class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.float :score
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
