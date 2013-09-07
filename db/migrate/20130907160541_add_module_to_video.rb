class AddModuleToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :module, :string
  end
end
