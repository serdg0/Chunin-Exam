class AddUrlToDomain < ActiveRecord::Migration[6.1]
  def change
    add_column :domains, :url, :string
  end
end
