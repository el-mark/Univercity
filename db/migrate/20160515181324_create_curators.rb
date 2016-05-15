class CreateCurators < ActiveRecord::Migration
  def change
    create_table :curators do |t|

      t.timestamps null: false
    end
  end
end
