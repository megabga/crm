class CreateAtividades < ActiveRecord::Migration
  def change
    create_table :atividades do |t|
      t.string :name, :limit => 20
      t.boolean :disabled

      t.timestamps
    end
  end
end
