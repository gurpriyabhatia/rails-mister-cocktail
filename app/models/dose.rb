class Dose < ApplicationRecord
  validates :description, :cocktail, :ingredient, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient }
  belongs_to :cocktail
  belongs_to :ingredient
end
