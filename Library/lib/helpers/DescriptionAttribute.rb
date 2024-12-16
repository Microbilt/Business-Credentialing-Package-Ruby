module DescriptionAttribute
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def descriptions
      @descriptions ||= {}
    end

    def description(attribute, value)
      descriptions[attribute] = value
    end
  end

  def description
    self.class.descriptions[self]
  end
end