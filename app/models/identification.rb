
class Identification
  include ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveRecord::Validations  

  attr_accessor :ssn, :account_number, :pin

  validates :ssn, :presence => true,
                  :format => {:with => /\d{3}-?\d{2}-?\d{4}/,
                              :message => "must consist of 9 digits" }

  validates :account_number, :presence => true,
                             :format => {:with => /\d{16}/,
                                         :message => "must consist of 16 digits"}

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
