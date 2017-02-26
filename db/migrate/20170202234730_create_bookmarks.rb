class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.string :url
      # t.references :topic, foreign_key: true
      t.references :topic, index: true, foreign_key: true


      # t.timestamps
      t.timestamps null: false

    end
  end
end
