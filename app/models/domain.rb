class Domain < ApplicationRecord
  has_many :urls

  validates :domain, presence: true
  
  scope :top_ten_domains, -> { order(visits: :desc).limit(10) }
end
