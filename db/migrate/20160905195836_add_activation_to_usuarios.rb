class AddActivationToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :activation_digest, :string
    add_column :usuarios, :activated, :boolean
    add_column :usuarios, :activated_at, :datetime
  end
end
