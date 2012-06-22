class CreateSeguimentos < ActiveRecord::Migration
  def change
    create_table :seguimentos do |t|
      t.string :name, :limit => 20
      t.boolean :disabled

      t.timestamps
    end
  end
end
