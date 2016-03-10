class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
    	t.belongs_to :transaction
      t.integer :paper_size,     null:false
      t.boolean :is_colored,     null:false
      t.string  :filename,       null:false
      t.integer :num_of_pages,   null:false
      t.integer :num_of_colored

      t.timestamps null: false
    end
  end
end
