class Rating < ApplicationRecord
  belongs_to :article
  validates :score, presence: true, :inclusion => 1..5
end
