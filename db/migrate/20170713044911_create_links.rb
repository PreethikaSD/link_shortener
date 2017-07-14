class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
    	t.string :given_link
    	t.string :shortened_link

      t.timestamps
    end
  end
end
