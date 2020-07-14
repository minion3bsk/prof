class AddFeedCloumnsToFeed < ActiveRecord::Migration[5.2]
  def change
    add_column :feeds, :content_id, :integer
    add_column :feeds, :content_type, :string
    add_column :feeds, :group_id, :integer
  end
end
