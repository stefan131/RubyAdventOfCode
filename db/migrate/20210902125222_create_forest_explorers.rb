class CreateForestExplorers < ActiveRecord::Migration[6.1]
  def change
    create_table :forest_explorers do |t|

      t.timestamps
    end
  end
end
