# frozen_string_literal: true

require_relative "il_rocket_alerts/version"
require_relative "il_rocket_alerts/client"
require_relative "il_rocket_alerts/location"

module IlRocketAlerts
  class Error < StandardError; end
  
  def self.run!(interval_in_seconds = 60)
    loop do
      data = IlRocketAlerts::Client.all
      if !data.nil?
        puts ["🚀🚀🚀",DateTime.now.strftime("DD/MM/YYYY HH:mm:ss"), "-", data.join(', ') , "🚀🚀🚀"].join(' ')
        `say "ALERT, ALERT, ALERT"`
      end
      sleep interval_in_seconds
    end
  end
end
