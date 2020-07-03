class CreateBigSiteSites < ActiveRecord::Migration[6.0]
  def change
    create_table :big_site_sites do |t|
      t.integer :user_id
      t.string :name
      t.string :domain
      t.boolean :deleted

      t.timestamps
    end
  end
end
