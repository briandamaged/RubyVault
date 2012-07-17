
class AccountNumberFormatValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless value =~ /^\d{16}$/
      record.errors[attribute] << (options[:message] || "must consist of 16 digits")
    end
  end
  
end


