class User < Hello::RailsActiveRecord::User
  include HelloMixin


  has_many :facebook_credentials



  validates_presence_of :name
  validates_presence_of :city
  has_many :addresses, dependent: :restrict_with_error

end
