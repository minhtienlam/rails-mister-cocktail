class Ingredient < ApplicationRecord

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  has_many :doses, dependent: :destroy
  has_many :cocktails, through: :doses

end
