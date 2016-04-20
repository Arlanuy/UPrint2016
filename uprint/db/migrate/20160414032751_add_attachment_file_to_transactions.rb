class AddAttachmentFileToTransactions < ActiveRecord::Migration
  def self.up
    change_table :transactions do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :transactions, :file
  end
end
