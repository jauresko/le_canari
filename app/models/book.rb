class Book < ApplicationRecord
  has_many :sessions
  has_many :reviews
  has_many_attached :photos
end
