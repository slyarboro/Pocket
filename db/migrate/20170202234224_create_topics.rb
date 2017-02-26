class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :title
      # t.references :user, foreign_key: true
      t.references :user, index: true, foreign_key: true


      # t.timestamps
      t.timestamps null: false

    end
  end
end
