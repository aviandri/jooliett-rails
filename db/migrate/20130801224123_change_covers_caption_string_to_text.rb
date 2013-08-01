class ChangeCoversCaptionStringToText < ActiveRecord::Migration
  def change
  	change_column :covers, :caption, :text
  end
end
