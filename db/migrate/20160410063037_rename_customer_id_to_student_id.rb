class RenameCustomerIdToStudentId < ActiveRecord::Migration
  def change
    rename_column :transactions, :customer_id, :student_id
  end
end
