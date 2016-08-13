class CreateGlues < ActiveRecord::Migration[5.0]
  def change
    create_table :glues do |t|
    	t.string "title"
    	t.text   "content"
    	t.string "user"

    	t.timestamps
    end
  end
end
