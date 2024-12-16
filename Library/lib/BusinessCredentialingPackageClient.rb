require 'net/http'
require 'json'

module BusinessCredentialingPackage
  class BusinessCredentialingPackageClient
    attr_reader :authorization, :professional_license_search_client, :UCC_search_report_client, :base_uri

    def initialize(client_id, client_secret, environment_type = EnvironmentType::Production)
      @base_uri = URI(EnvironmentType.descriptions[environment_type])
      @authorization = mba_authorizations(client_id, client_secret)
      @professional_license_search_client = BusinessCredentialingPackage::APIClients::ProfessionalLicenseSearchClient.new(@authorization, @base_uri)
      @UCC_search_report_client = BusinessCredentialingPackage::APIClients::UCCSearchReportClient.new(@authorization, @base_uri)
    end

    private

    def mba_authorizations(client_id, client_secret)
      uri = URI.join(@base_uri.to_s, 'OAuth/GetAccessToken')
      request = Net::HTTP::Post.new(uri)
      request['Accept'] = 'application/json'
      request.content_type = 'application/json'

      authorization_payload = {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: 'client_credentials'
      }

      request.body = authorization_payload.to_json

      response = send_request(uri, request)

      if response.code.to_i == 200
        json_response = JSON.parse(response.body)
        if json_response.key?('access_token')
          json_response['access_token']
        else
          raise "Authorization failed: #{response.body}"
        end
      else
        raise "Authorization failed: #{response.body}"
      end
    end

    def send_request(uri, request)
      Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
        http.request(request)
      end
    rescue StandardError => e
      raise "HTTP Request failed: #{e.message}"
    end
  end
end