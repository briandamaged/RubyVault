
task :prepare => :environment do
  u = User.create(
    :username => "admin",
    :password => "I'mDaBoss",
    :first_name => "Adam",
    :last_name => "Minh",
    :email     => "adam.minh@company.org",
    :ssn       => "2561234523",
    #:is_admin  => true
  )
end
