class CreateGyms < ActiveRecord::Migration[5.0]
  def change
    create_table :gyms do |t|
      t.string :name
      t.text   :body
      t.timestamps
    end
  end
end
