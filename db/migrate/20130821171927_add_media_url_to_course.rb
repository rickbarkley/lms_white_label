class AddMediaUrlToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :media_url, :string
  end
end
