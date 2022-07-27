class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :store

  has_one_attached :image
  
  validates :store_id, :title, :body, :star, presence: true

end