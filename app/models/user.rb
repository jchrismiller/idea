class User < ActiveRecord::Base

  validates :first_name, :last_name, :email, :password_digest, presence: true, unless: :guest?

  has_many :bright_ideas
  has_many :likes
  has_many :bright_ideas, through: :likes
  has_many :blogs

  # has_attached_file :image
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_secure_password(validations: false)

  def self.new_guest
  	new { |u| u.guest = true }
  end

  def name
  	guest ? "Guest" : " #{self.first_name} #{self.last_name}"
  end

  def company_name
    guest ? "" : self.company
  end
end
