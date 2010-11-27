class User < ActiveRecord::Base
  belongs_to :subdomain
  
  devise :database_authenticatable, :confirmable, :lockable, :recoverable,
         :rememberable, :registerable, :trackable, :timeoutable, :validatable,
         :token_authenticatable

  attr_accessible :email, :password, :password_confirmation, :subdomain_name
  attr_accessor :subdomain_name
  
  before_create :save_subdomain
  
  private
  
  def save_subdomain
    safe_subdomain = self.subdomain_name.gsub(/\W/, '').downcase
    self.subdomain = Subdomain.create!(:name => safe_subdomain)
  end
end
