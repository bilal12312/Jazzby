class Product < ApplicationRecord
	validates :name, presence: true,
                    length: { minimum: 5 }
  	has_one_attached :image
  	has_many :line_items, dependent: :destroy
end
