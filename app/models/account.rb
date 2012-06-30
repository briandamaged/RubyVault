class Account < ActiveRecord::Base
  attr_accessible :account_number, :balance, :name
  
  belongs_to :account_type
  belongs_to :user
  
  validates :name, :format => {:with => /((\w)((\w\s)*(\w))?)?/,
                               :message => 'must consist of letters, numbers, and spaces'}
  
  validates :account_number, :presence => true,
                             :format => {:with => /\d{16}/,
                                         :message => 'must consist of 16 digits' }
                             
  validates :balance, :presence => true
  
  
  
end
