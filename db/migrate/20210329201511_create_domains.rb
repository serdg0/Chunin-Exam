class CreateDomains < ActiveRecord::Migration[6.1]
  def change
    create_table :domains do |t|
      t.string :domain
      t.string :short_subdomain
      t.string :url

      t.timestamps
    end
  end
end
