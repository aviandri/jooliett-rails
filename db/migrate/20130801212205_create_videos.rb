class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :photo_url

      t.timestamps
    end
  end
end
