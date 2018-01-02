class Artist < ApplicationRecord
    
    belongs_to :user
    has_many :albums, dependent: :destroy
    has_many :songs, through: :albums
    accepts_nested_attributes_for :albums
    
    validates :name, presence: true
    validates :name, uniqueness: true
end
