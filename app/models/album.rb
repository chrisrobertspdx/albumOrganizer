class Album < ApplicationRecord
    
    belongs_to :artist
    has_many :songs, dependent: :destroy
    has_many :genres, -> { distinct }, through: :songs
    
    validates :name, presence: true
    validates :release_date, presence: true

    has_attached_file :album_cover, styles: { thumb: "100x100>", icon: "250x250>" }, default_url: 'blank-album-cover.jpg'
    validates_attachment_content_type :album_cover, content_type: /\Aimage\/.*\z/
    
    def user
        self.artist.user
    end
end
