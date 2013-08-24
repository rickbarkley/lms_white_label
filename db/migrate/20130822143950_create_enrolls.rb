class CreateEnrolls < ActiveRecord::Migration
  def change
    create_table :enrolls do |t|
        t.belongs_to :user
        t.belongs_to :course
      t.datetime :expiration

      t.timestamps
    end
  end
end
