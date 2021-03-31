class Url < ApplicationRecord
  belongs_to :domain

  validates :full_url, format: { with: /\A#{URI::regexp}\z/ }

  before_create :generate_short_url

  private

  def generate_short_url
    self.short_url = rand(36**8).to_s(36)
  end
end
