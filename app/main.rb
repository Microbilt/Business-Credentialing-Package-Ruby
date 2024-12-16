require 'json'
require 'net/http'
require 'library'
require_relative '../Library/lib/BusinessCredentialingPackageClient'
require_relative '../Library/lib/helpers/EnvironmentType'
require_relative '../Library/lib/clients/ProfessionalLicenseSearchClient'
require_relative '../Library/lib/clients/UCCSearchReportClient'
require_relative '../Library/lib/model/model'


business_credentialing_package_client = BusinessCredentialingPackage::BusinessCredentialingPackageClient.new("You_client_id", "You_client_secret", EnvironmentType::Sandbox)
report = nil
archive_report = nil

puts "Test ProfessionalLicenseSearch:"
puts "Test GetReport:"

person_name = PersonName.new(
  first_name: "John",
  last_name: "Green"
)
professional_license_search_request = ProfessionalLicenseSearchRequestModel.new(person_name: person_name, state_prov: "TX").to_h.to_json

report = business_credentialing_package_client.professional_license_search_client.get_report(professional_license_search_request)
puts "GetReport = #{report}"

puts "Test GetArchiveReport:"
archive_report = business_credentialing_package_client.professional_license_search_client.get_archive_report("C76E01F3-8D6F-4D9D-B0F9-CD33ECE09F58")
puts "GetArchiveReport = #{archive_report}"


puts "Test UCCSearchReport:"
puts "Test GetReport:"

post_addr = {addr1: "1900 US HWY 69", city: "EXCELSIOR SPRINGS", state_prov: "MO", postal_code: "64024", country: "USA"}
contact_info = [{ postAddr: post_addr }]
org_info = OrgInfo.new(name: "69 AUTO SALES LLC", contact_info: contact_info)

ucc_search_report_request = UCCSearchReportRequestModel.new(org_info: org_info).to_h.to_json

report = business_credentialing_package_client.UCC_search_report_client.get_report(ucc_search_report_request)
puts "GetReport = #{report}"

puts "Test GetArchiveReport:"
archive_report = business_credentialing_package_client.UCC_search_report_client.get_archive_report("0B75ABF4-0360-48BC-816D-6687FB7089F0")
puts "GetArchiveReport = #{archive_report}"
