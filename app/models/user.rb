require 'digest'

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_reader :password

  field :email, type: String
  field :encrypted_password, type: String

  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates_presence_of :password, :on => :create
  validates_length_of :password, minimum: 6, :on => :create
  validates_confirmation_of :password, allow_blank: true

  # Returns +self+ if the password is correct, otherwise +false+.
  #
  #   user = User.new(email: 'me@sample.com', password: 'eD04gV07amGyEF')
  #   user.save
  #   user.authenticate('notright')      # => false
  #   user.authenticate('eD04gV07amGyEF') # => user
  def authenticate(unencrypted_password)
    encrypted_password == Digest::SHA1.hexdigest(unencrypted_password) && self
  end

  # Encrypts the password into the +password_digest+ attribute, only if the
  # new password is not empty.
  #
  #   user = User.new
  #   user.password = nil
  #   user.encrypted_password # => nil
  #   user.password = 'eD04gV07amGyEF'
  #   user.encrypted_password # => "380ecbc84f7956623e18b999a45be05ff50d8858"
  def password=(unencrypted_password)
    if unencrypted_password.nil?
      self.encrypted_password = nil
    elsif !unencrypted_password.empty?
      @password = unencrypted_password
      self.encrypted_password = Digest::SHA1.hexdigest unencrypted_password
    end
  end

  def password_confirmation=(unencrypted_password)
    @password_confirmation = unencrypted_password
  end
end
