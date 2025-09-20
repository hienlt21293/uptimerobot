class DebugJob < ApplicationJob
  queue_as :default

  def perform
    puts "=== DebugJob running inside worker ==="
    puts "Worker DB name: #{ActiveRecord::Base.connection.pool.db_config.name}"
    puts "MonitorTarget count: #{MonitorTarget.count}"
  end
end
