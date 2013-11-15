class User < ActiveRecord::Base
  include BCrypt
  attr_reader :entered_password

  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\w+@\w+.\w+/ }

  has_many :events
  has_many :event_attendances

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_digest = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil
  end

  def created_events
    self.events
  end

  def attended_events
    self.event_attendances.map {|attendance| attendance.event}
  end

  def gravatar_url
    hash = Digest::MD5.hexdigest(self.email.downcase)
    "http://www.gravatar.com/avatar/#{hash}"
  end

end
