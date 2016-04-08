class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { self.role ||= :member }

  validates :name, presence: true
  validates :role, presence: true
  validates :email, uniqueness: {case_sensitive: false}

  has_many :recipes
  
  enum role: [:member, :admin]
end
