class AddAttachmentPicToOpportunities < ActiveRecord::Migration
  def self.up
    change_table :opportunities do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :opportunities, :pic
  end
end
