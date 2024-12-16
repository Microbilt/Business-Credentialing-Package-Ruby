require 'net/http'
require 'uri'
require 'json'
require_relative 'MBBaseClient'

module BusinessCredentialingPackage
  module APIClients
    class UCCSearchReportClient
      API_NAME = "UCCSearchReport".freeze

      def initialize(authorization, base_url)
        @client = MBBaseClient.new(authorization, base_url)
      end

      def get_report(json_request_model)
        url = URI.join(@client.base_url.to_s, "#{API_NAME}/GetReport")
        response = @client.post(url, JSON.parse(json_request_model))
        JSON.parse(response.to_json)
      end

      def get_archive_report(app_id)
        url = URI.join(@client.base_url.to_s, "#{API_NAME}/GetArchiveReport?AppId=#{app_id}")
        response = @client.get(url)
        JSON.parse(response.to_json)
      end
    end
  end
end