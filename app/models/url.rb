class Url < ApplicationRecord
  belongs_to :domain

  VALID_URL_REGEX = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i

  validates :full_url, presence: true, format: { with: VALID_URL_REGEX }

  before_create :generate_short_url

  private

  def generate_short_url
    self.short_url = rand(36**8).to_s(36)
  end
end
