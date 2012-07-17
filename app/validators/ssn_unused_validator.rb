

class SsnUnusedValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    user = User.find_by_ssn(value)
    if user
      record.errors[attribute] << (options[:message] || "is already associated with the username '#{user.username}'")
    end
  end
  
end

