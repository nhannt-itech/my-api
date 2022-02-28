class Item < ApplicationRecord
	validates :title, presence: true
	validates :price, presence: true
	validates :shipping_cost, presence: true
	validates :bids, presence: true
	validates :end_at, presence: true
	validates :image, presence: true
end
