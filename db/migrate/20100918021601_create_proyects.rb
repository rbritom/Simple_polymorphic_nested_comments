class CreateProyects < ActiveRecord::Migration
  def self.up
    create_table :proyects do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :proyects
  end
end
