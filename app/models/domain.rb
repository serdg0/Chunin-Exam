class Domain < ApplicationRecord

  validates :url, format: { with: /\A#{URI::regexp}\z/ }
  
  before_create :extract_domain
  before_create :generate_short_subdomain

  private

  def extract_domain
    self.domain = URI(url).host
  end

  def generate_short_subdomain
    self.short_subdomain = rand(36**8).to_s(36)
  end
end
