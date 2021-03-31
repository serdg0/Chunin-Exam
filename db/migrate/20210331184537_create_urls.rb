class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.references :domain, null: false, foreign_key: true
      t.string :full_url
      t.string :short_url

      t.timestamps
    end
  end
end
