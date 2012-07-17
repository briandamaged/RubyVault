class Account < ActiveRecord::Base
  
  belongs_to :account_type
  belongs_to :user
  
  validates :name, :format => {:with => /((\w)((\w\s)*(\w))?)?/,
                               :message => 'must consist of letters, numbers, and spaces'}
  
  validates :account_number, :presence => true,
                             :account_number_format => true
                             
  validates :balance, :presence => true
  
  
  
end
