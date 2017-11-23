class AddResetToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :reset_digest, :string
    add_column :usuarios, :reset_sent_at, :datetime
  end
end
