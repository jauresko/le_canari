class User < ApplicationRecord
  has_many :sessions
  has_many :books
  has_many :requests
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username , :first_name, :last_name, :phone_number, :email, :photo, presence: true
  validates :username, uniqueness: true
end
