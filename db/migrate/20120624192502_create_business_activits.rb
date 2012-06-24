class CreateBusinessActivits < ActiveRecord::Migration
  def change
    create_table :business_activits do |t|
      t.string :name
      t.boolean :disable

      t.timestamps
    end
  end
end
