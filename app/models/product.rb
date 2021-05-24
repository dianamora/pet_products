class Product < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :reviews

    validates :title, presence: true
    validates :description, presence: true
    validates :rating, presence: true
    validates :user_id, presence: true
    validates :image, presence: true
   
end
