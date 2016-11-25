class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  validates :name , presence: true, uniqueness: { case_sensitive: false }
  validates :photo , presence: true

  has_many :doses, dependent: :destroy
  has_many :ingredients , through: :doses

end
