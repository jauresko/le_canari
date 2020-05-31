class Episode < ApplicationRecord
  belongs_to :book
  has_many :sessions, dependent: :destroy
  has_many_attached :pages
end
