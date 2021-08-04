class Address < ApplicationRecord
    belongs_to :end_user
    validates :postal_code, presence: true
    validates :address, presence: true
    validates :name, presence: true
end
