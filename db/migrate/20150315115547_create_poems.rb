class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :title
      t.string :row

      t.timestamps null: false
    end
  end
end
