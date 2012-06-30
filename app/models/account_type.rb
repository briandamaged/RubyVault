class AccountType < ActiveRecord::Base
  attr_accessible :name

  has_many :accounts
  
  validates :name, :presence => true,
                   :format => {:with => /\w((\w|\s)*\w)?/,
                               :message => 'must consist of letters, numbers, and spaces'}
end

