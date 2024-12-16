# Locate Assets Package Client

A Ruby client for consuming the Microbilt Property Search API.

API page - https://developer.microbilt.com/api/PropertySearch

# Installation

`composer require Microbilt/Locate-Assets-Package-Ruby`

# Quick Start

```
locate_assets_package_client = LocateAssetsPackage::LocateAssetsPackageClient.new("You_client_id", "You_client_secret")
```
# Configuration

`client_id` required

`client_secret` required

`EnvironmentType` optional (defaults to Production). Other option is Sandbox. 

# Usage
See https://developer.microbilt.com/api/PropertySearch for the necessary parameters to pass in to each function.
For report created request model 
```
owner_info = OwnerInfo.new(
  PersonName.new(
    "LORENZO A",
    "FOSTER"
  )
)

post_addr = PostAddr.new(
  "530 EAKER WAY",
  "ANTIOCH",
  "CA",
  "94509"
)

property_search_request_model = PropertySearchRequestModel.new(owner_info, post_addr).to_h.to_json
```
All responses for all requests 'JsonObject', for get JSON string You can use ```.ToString()``` method