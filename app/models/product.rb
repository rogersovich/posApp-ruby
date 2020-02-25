class Product < ApplicationRecord
    belongs_to :unit
    belongs_to :category
    has_many :order_detail
    has_many :cart
end
