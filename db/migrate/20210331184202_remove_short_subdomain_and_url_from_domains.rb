class RemoveShortSubdomainAndUrlFromDomains < ActiveRecord::Migration[6.1]
  def change
    remove_column :domains, :short_subdomain, :string
    remove_column :domains, :url, :string
  end
end
