class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
        t.belongs_to :user
        t.belongs_to :course
      t.datetime :expiration

      t.timestamps
    end
  end
end
