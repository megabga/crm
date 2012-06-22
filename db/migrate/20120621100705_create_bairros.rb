class CreateBairros < ActiveRecord::Migration
  def change
    create_table :bairros do |t|
      t.string :name
      t.timestamps
    end
  end
end
