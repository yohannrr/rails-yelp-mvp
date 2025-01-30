class Review < ApplicationRecord
  belongs_to :restaurant

  # Vérifie que le contenu et la note sont présents
  validates :content, :rating, presence: true

  # Vérifie que la note est un entier entre 0 et 5
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
