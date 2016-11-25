class Dose < ApplicationRecord

  validates :description, :cocktail, :ingredient, presence: true
  validates_uniqueness_of :cocktail_id, :scope => [:ingredient_id],
     :message => "error: that ingredient is already in the cocktail!<br>" \
                 "Choose another ingredient or click 'Back' to return " \
                 "to the cocktails list."

  belongs_to :cocktail
  belongs_to :ingredient

end
