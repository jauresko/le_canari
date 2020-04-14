class Review < ApplicationRecord
  belongs_to :book
  validates :content
end
