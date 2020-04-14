class Book < ApplicationRecord
  has_many :sessions
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
end
