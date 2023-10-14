class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def total_price
    food.price * quantity
  end

  def quantity_needed
    quantity - food.quantity
  end
end
