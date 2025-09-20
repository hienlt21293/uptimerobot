require "open-uri"

class MonitorTarget < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  
  before_save :update_icon
  after_commit -> {broadcast_refresh_later_to "monitor_targets_stream"}

  private

  def update_icon
    if url_changed?
      fetch_favicon
    end
  end

  private

  def fetch_favicon
    begin
      normalized_url = url.match?(/https/i) ? url : "https://#{url}"
      url = URI.parse(normalized_url)
    favicon_url = "#{URI.join(url, '/favicon.ico')}"
    downloaded_image = URI.open(favicon_url) rescue nil
    if downloaded_image
      image.attach(io: downloaded_image, filename: "favicon.ico")
    else
      image.purge
    end
    rescue => e
      Rails.logger.error("Favicon fetch failed: #{e.message}")
      nil
    end
  end
end
