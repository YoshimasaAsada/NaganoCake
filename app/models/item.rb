class Item < ApplicationRecord
    attachment :image
    belongs_to :genre
    has_many :cart_items
    
    validates :genre, presence: true
    validates :name, presence: true
    validates :image, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    validates :is_active, presence: true
    
    def add_tax_price
        (self.price * 1.08).round
    end
    
    def self.search(search)
      if search
        Item.where(['name LIKE ?', "%#{search}%"])
      else
        Item.all
      end
    end
    
end
