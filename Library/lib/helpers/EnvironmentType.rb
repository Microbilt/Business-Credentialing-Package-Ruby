require_relative 'DescriptionAttribute'

class EnvironmentType
  include DescriptionAttribute

  Production = :Production
  Sandbox = :Sandbox

  description Production, "https://api.microbilt.com"
  description Sandbox, "https://apitest.microbilt.com"
end

def environment_description(environment)
  EnvironmentType.descriptions[environment]
end