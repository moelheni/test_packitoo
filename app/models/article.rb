require 'csv'

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

  def rating_scores
    self.ratings.map{ |el| el.score }
  end

  def avg_rating
    self.rating_scores.inject{ |sum, el| sum + el }.to_f / self.ratings.size
  end

  def lowest_rating
    self.rating_scores.sort.first
  end

  def highest_rating
    self.rating_scores.sort.reverse.first
  end

  def nbr_comments
    self.comments.size
  end

  def avg_comments_length
    self.comments.map{ |el| el.body.length }.inject{ |sum, el| sum + el }.to_f / self.comments.size
  end

  def self.to_csv
    attributes = %w{title lowest_rating highest_rating avg_rating nbr_comments avg_comments_length}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |article|
        csv << attributes.map{ |attr| article.send(attr) }
      end
    end
  end
end
