class Song < ApplicationRecord
    validates :title, :artist_name, :genre, presence: true
    validates :title, uniqueness: { scope: [:artist_name, :release_year]}

    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released?, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }

def released?
    released
end


end
