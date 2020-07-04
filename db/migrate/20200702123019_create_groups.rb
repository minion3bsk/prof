class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :key, uniq: true
      t.text :detail
      t.timestamps
    end
  end
end
