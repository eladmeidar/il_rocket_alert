require 'httparty'
module IlRocketAlerts
  class Client
    include HTTParty

    base_uri 'https://www.oref.org.il'
    headers "Referer": "https://www.oref.org.il/11226-he/pakar.aspx",
      "X-Requested-With": "XMLHttpRequest",
      "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36"

    def self.all
      res = self.get('/WarningMessages/alert/alerts.json').parsed_response
    end
  end
end