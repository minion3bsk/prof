class RenameFeedColumnsToFeed < ActiveRecord::Migration[5.2]
  def change
    rename_column :feeds, :content_id, :feedable_id
    rename_column :feeds, :content_type, :feedable_type
  end
end
