require 'net/http'
require 'uri'
require 'json'

module BusinessCredentialingPackage
  module APIClients
    class MBBaseClient
      attr_reader :base_url, :headers

      def initialize(authorization, base_url)
        @base_url = URI(base_url)
        @headers = {
          "Accept" => "application/json",
          "Authorization" => "Bearer #{authorization}"
        }
      end

      def get(path, params = {})
        uri = URI.join(base_url, path)
        uri.query = URI.encode_www_form(params) if params.any?
        request = Net::HTTP::Get.new(uri, headers)
        send_request(uri, request)
      end

      def post(path, body = {})
        uri = URI.join(base_url, path)
        request = Net::HTTP::Post.new(uri, headers)
        request.content_type = "application/json" # Добавляем Content-Type
        request.body = body.to_json
        send_request(uri, request)
      end

      private

      def send_request(uri, request)
        Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
          response = http.request(request)
          JSON.parse(response.body) if response.content_type == "application/json"
        end
      end
    end
  end
end