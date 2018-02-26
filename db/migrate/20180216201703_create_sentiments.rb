class CreateSentiments < ActiveRecord::Migration[5.1]
  def change
    create_table :sentiments do |t|
      t.belongs_to :region, index: true
      t.integer :score
      t.timestamps
    end
  end
end
