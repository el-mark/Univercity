class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :title
      t.string :publisher
      t.references :user, index:true

      t.timestamps null: false
    end
  end
end
