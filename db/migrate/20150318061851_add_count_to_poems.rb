class AddCountToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :count, :integer
  end
end
