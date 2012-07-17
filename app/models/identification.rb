
class Identification
  include ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveRecord::Validations  

  attr_accessor :ssn, :account_number, :pin

  validates :ssn, :presence => true,
                  :ssn => true

  validates :account_number, :presence => true,
                             :account_number => true

  validates :pin, :presence => true,
                  :format => {:with => /\d{4}/,
                              :message => "must consist of 4 digits"}


  def initialize(params = {})
    @ssn            = params[:ssn]
    @account_number = params[:account_number]
    @pin            = params[:pin]
  end


  def new_record?
    true
  end

  def persisted?
    false
  end

end
