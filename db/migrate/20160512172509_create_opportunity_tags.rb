class CreateOpportunityTags < ActiveRecord::Migration
  def change
    create_table :opportunity_tags do |t|
      t.belongs_to :opportunity, index: true
      t.belongs_to :tag, index: true

      t.timestamps null: false
    end
  end
end
