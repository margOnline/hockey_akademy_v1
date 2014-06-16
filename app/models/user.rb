class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50}
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }
  # validates :dob, presence: true


  def fullname
    "#{lastname.titleize}, #{firstname.titleize}"
  end

  def age(as_at = Time.now)
    as_at = as_at.utc.to_date if as_at.respond_to?(:utc)
    as_at.year - dob.year - ((as_at.month > dob.month || (as_at.month == dob.month && as_at.day >= dob.day)) ? 0 : 1)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end

end
