


class AccountNumberUnusedValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    account = Account.includes(:user).where(:account_number => value).first
    
    if account
      record.errors[attribute] << (options[:message] || "is already assocated with the username '#{account.user.username}'")
    end
  end
  
end


