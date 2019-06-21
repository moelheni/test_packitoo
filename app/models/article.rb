class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

  def avg_rating
    self.ratings.map{ |el| el.score }.inject{ |sum, el| sum + el }.to_f / self.ratings.size
  end
end
