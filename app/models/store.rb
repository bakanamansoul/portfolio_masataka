class Store < ApplicationRecord
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :customers, through: :reviews

  def self.search_for(content, method)
    if method == 'perfect'
      Store.where(name: content)
    elsif method == 'forward'
      Store.where('name LIKE ?', content+'%')
    elsif method == 'backward'
      Store.where('name LIKE ?', '%'+content)
    else
      Store.where('name LIKE ?', '%'+content+'%')
    end
  end
end
