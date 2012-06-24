class CreateBusinessSegments < ActiveRecord::Migration
  def change
    create_table :business_segments do |t|
      t.string :name
      t.boolean :disable

      t.timestamps
    end
  end
end
