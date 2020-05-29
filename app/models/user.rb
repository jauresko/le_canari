class User < ApplicationRecord
  acts_as_token_authenticatable
  has_many :sessions
  has_many :books
  has_many :episodes
  has_many :requests
  has_many :reviews
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username , :first_name, :last_name, :phone_number, :email, presence: true
  validates :username, uniqueness: true
end
