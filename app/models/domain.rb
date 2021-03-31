class Domain < ApplicationRecord
  has_many :urls

  validates :domain, presence: true

  def self.top_ten_domains
    Domain.order(visits: :desc).limit(10)
  end
end
