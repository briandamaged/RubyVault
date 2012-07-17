
namespace :rv do
  desc "Initializes RubyVault with a default dataset."
  task :prepare => :environment do
    admin = User.create(
      :username => "admin",
      :password => "I'mDaBoss",
      :first_name => "Adam",
      :last_name => "Minh",
      :email     => "adam.minh@company.org",
      :ssn       => "2561234523",
      :is_admin  => true
    )
    
    personal_checking = AccountType.create(
      :name => "Personal Checking"
    )
    
    business_checking = AccountType.create(
      :name => "Business Checking"
    )
    
    personal_savings = AccountType.create(
      :name => "Personal Savings"
    )
    
  end
end


