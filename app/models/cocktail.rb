class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo
  validates :name, uniqueness: true
  validates :name, presence: true
  validate :photo_validate

  def self.search(search)
    where('lower(name) LIKE ?', "%#{search.downcase}%")
  end

  def photo_validate
    if self.photo.attached? == false
      errors.add(:photo, 'photo is required')
    end
  end
end
