class User < ActiveRecord::Base
  
  before_save {self.email = email.downcase, self.name = name.downcase }
  validates :name, presence: true, length: {maximum: 50},
                    uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 200},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
                    
  has_secure_password
  validates :password, length: {minimum: 6}
  
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => ":style/missing.jpg"
  validates_attachment_content_type :avatar, :content_type => /^image\/(png|gif|jpeg|jpg)/
  
end
