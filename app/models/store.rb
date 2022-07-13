class Store < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
end
