class CreatePostcodes < ActiveRecord::Migration
  def self.up
    create_table :postcodes do |t|
      t.integer :id
      t.string :number
      t.string :suburb

      t.timestamps
    end
  end

  def self.down
    drop_table :postcodes
  end
end
