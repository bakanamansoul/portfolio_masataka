class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :store

  has_one_attached :image

end
