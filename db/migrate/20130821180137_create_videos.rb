class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :meia_url
      t.string :chapter

      t.timestamps
    end
  end
end
