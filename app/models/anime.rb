class Anime < ApplicationRecord
    has_one_attached :image
    has_many :episodes, dependent: :destroy
end