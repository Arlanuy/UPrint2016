class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string :name
    	t.string :student_number
    	t.string :email
    	t.string :contact_number
      	t.timestamps null: false
    end
  end
end
