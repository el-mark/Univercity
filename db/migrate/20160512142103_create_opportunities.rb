class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string   :title
      t.string   :description
      t.string   :opportunity_type
      t.date     :startdate
      t.string   :duration
      t.string   :location
      t.boolean  :published, null: false, default: false

      t.references :user, index:true

      t.timestamps null: false
    end
  end
end
