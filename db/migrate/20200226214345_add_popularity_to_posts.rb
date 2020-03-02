class AddPopularityToPosts < ActiveRecord::Migration[6.0]
  def change
    change_table :posts do |t|
      t.numeric :popularity 
    end
  end
end
