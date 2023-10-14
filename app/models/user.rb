class User < ApplicationRecord
  has_many :recipes, dependent: :destroy, foreign_key: 'user_id'
  has_many :foods, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end
