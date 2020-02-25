class Unit < ApplicationRecord
    belongs_to :category
    has_many :product
end
