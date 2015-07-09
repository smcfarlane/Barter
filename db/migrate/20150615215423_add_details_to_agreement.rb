class AddDetailsToAgreement < ActiveRecord::Migration
  def change
    add_column :agreements, :details, :text, null: false, default: ''
  end
end
