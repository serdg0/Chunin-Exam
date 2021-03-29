class Domain < ApplicationRecord

  after_commit :extract_domain
  after_commit :extract_subdomain
  after_commit :generate_short_subdomain

  def extract_domain
    domain = url
    self.domain = url
  end

  def extract_subdomain
  end

  def generate_short_subdomain
  end
end
