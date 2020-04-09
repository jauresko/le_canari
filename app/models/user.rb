class User < ApplicationRecord
  has_many :books
  has_many :sessions
  has_many :requests
  has_one :status
  validates :first_name, :last_name, :username, presence: true
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

end
