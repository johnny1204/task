class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :title, null: false
      t.string :file_name, null: false
      t.timestamps

      t.references :user, foreign_key: { on_update: :cascade, on_delete: :cascade }
    end
  end
end
