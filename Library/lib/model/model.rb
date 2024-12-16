class ProfessionalLicenseSearchRequestModel
  attr_accessor :personName, :stateProv

  def initialize(person_name:, state_prov:)
    @personName = person_name
    @stateProv = state_prov
  end

  def to_h
    {
      personName: @personName.to_h,
      stateProv: @stateProv
    }
  end
end

class PersonName
  attr_accessor :firstName, :lastName

  def initialize(first_name:, last_name:)
    @firstName = first_name
    @lastName = last_name
  end

  def to_h
    {
      firstName: @firstName,
      lastName: @lastName
    }
  end
end

class UCCSearchReportRequestModel
  attr_accessor :orgInfo

  def initialize(org_info:)
    @orgInfo = org_info
  end

  def to_h
    {
      orgInfo: @orgInfo.to_h
    }
  end
end

class OrgInfo
  attr_accessor :name, :contactInfo

  def initialize(name:, contact_info:)
    @name = name
    @contactInfo = contact_info.map do |info|
      info.is_a?(ContactInfo) ? info : ContactInfo.new(**info)
    end
  end

  def to_h
    {
      name: @name,
      contactInfo: @contactInfo.map(&:to_h)
    }
  end
end

class ContactInfo
  attr_accessor :postAddr

  def initialize(postAddr:)
    @postAddr = PostAddr.new(**postAddr)
  end

  def to_h
    {
      postAddr: @postAddr.to_h
    }
  end
end

class PostAddr
  attr_accessor :addr1, :city, :stateProv, :postalCode, :country

  def initialize(addr1:, city:, state_prov:, postal_code:, country:)
    @addr1 = addr1
    @city = city
    @stateProv = state_prov
    @postalCode = postal_code
    @country = country
  end

  def to_h
    {
      addr1: @addr1,
      city: @city,
      stateProv: @stateProv,
      postalCode: @postalCode,
      country: @country
    }
  end
end