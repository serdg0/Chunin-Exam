class AddVisitsToDomains < ActiveRecord::Migration[6.1]
  def change
    add_column :domains, :visits, :integer
  end
end
