# Business Credentialing Package Client

A Ruby client for consuming the Microbilt Business Credentialing API.

API page - https://developer.microbilt.com/api/PropertySearch

or more about APIs You can see on [Microbilt Developer Portal](https://developer.microbilt.com/)

## APIs in this plan:

[ProfessionalLicenseSearch](https://developer.microbilt.com/api/ProfessionalLicenseSearch)

[UCCSearchReport](https://developer.microbilt.com/api/UCCSearchReport)

# Installation

`composer require Microbilt/Business-Credentialing-Package-Ruby`

# Quick Start

```
business_credentialing_package_client = BusinessCredentialingPackage::BusinessCredentialingPackageClient.new("You_client_id", "You_client_secret")
```
# Configuration

`client_id` required

`client_secret` required

`EnvironmentType` optional (defaults to Production). Other option is Sandbox. 

# Usage
See https://developer.microbilt.com/api/ProfessionalLicenseSearch for the necessary parameters to pass in to each function.
For report created request model 
```
person_name = PersonName.new(
  first_name: "John",
  last_name: "Green"
)
professional_license_search_request = ProfessionalLicenseSearchRequestModel.new(person_name: person_name, state_prov: "TX").to_h.to_json
```
See https://developer.microbilt.com/api/UCCSearchReport for the necessary parameters to pass in to each function.
For report created request model 
```
post_addr = {addr1: "1900 US HWY 69", city: "EXCELSIOR SPRINGS", state_prov: "MO", postal_code: "64024", country: "USA"}
contact_info = [{ postAddr: post_addr }]
org_info = OrgInfo.new(name: "69 AUTO SALES LLC", contact_info: contact_info)

ucc_search_report_request = UCCSearchReportRequestModel.new(org_info: org_info).to_h.to_json
```