class Category < ApplicationRecord
    has_many :unit
    has_many :product
end
