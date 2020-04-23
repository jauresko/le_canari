class Book < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :episodes, dependent: :destroy
  has_one_attached :cover
  validates :name, presence: true
  include AlgoliaSearch
  # include PgSearch::Model
  # pg_search_scope :search_by_name_and_editor,
  #   against: [ :name, :editor, :author, :drawer ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
  algoliasearch do
    attribute :name, :editor, :author, :drawer, :cover
  end
end
