class PingTargetJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.info "[PingTargetJob] Starting ping at #{Time.current}"
    MonitorTarget.find_each do |target|
      new_status = ping(target.url) ? "OK" : "FAILED"
      puts "Ping result: #{target.url} is #{new_status}"
      if target.status != new_status
        target.update(status: new_status)
        Turbo::StreamsChannel.broadcast_refresh_later_to("monitor_targets_stream")
      end
    Rails.logger.info "[PingTargetJob] Completed ping at #{Time.current}"
    end
  end

  private

  def ping(url, limit = 5)
    raise "Too many redirects for #{url}" if limit == 0

    require "net/http"
    require "uri"

    # Ensure URL has a scheme
    url = url.start_with?("http") ? url : "https://#{url}"
    uri = URI.parse(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == "https")
    http.open_timeout = 5
    http.read_timeout = 5

    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)

    case response
    when Net::HTTPSuccess
      true
    when Net::HTTPRedirection
      # Follow redirect (recursively) with limit
      redirect_url = response['location']
      ping(redirect_url, limit - 1)
    else
      Rails.logger.warn "Ping failed for #{url}: #{response.code} #{response.message}"
      false
    end
  rescue => e
    Rails.logger.error "Ping failed for #{url}: #{e.class} - #{e.message}"
    false
  end
end

