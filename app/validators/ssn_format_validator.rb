
class SsnFormatValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless value =~ /^\d{3}-?\d{2}-?\d{4}$/
      record.errors[attribute] << (options[:message] || "must take the form XXX-XX-XXXX")
    end
  end
  
end


