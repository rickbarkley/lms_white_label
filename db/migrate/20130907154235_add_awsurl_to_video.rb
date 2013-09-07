class AddAwsurlToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :awsurl, :string
  end
end
