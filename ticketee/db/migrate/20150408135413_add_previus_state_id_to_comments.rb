class AddPreviusStateIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :previus_state_id, :integer
  end
end
