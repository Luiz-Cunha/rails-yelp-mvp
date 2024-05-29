class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :address, :category, :phone_number, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }

  def avg_rating
    ratings = reviews.map(&:rating)
    ratings.length > 0 ? ratings.sum / ratings.length : 0
  end
end
