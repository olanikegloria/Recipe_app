class User < ApplicationRecord
  has_many :recipes, dependent: :destroy, foreign_key: 'user_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
