class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo
  validates :name, uniqueness: true
  validates :name, presence: true

  def self.search(search)
    where('lower(name) LIKE ?', "%#{search.downcase}%")
  end
end
