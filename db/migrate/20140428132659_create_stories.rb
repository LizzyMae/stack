class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|

    	#i want to add some collumns to our data base
    	#we want to safe title as a string (letters and numbers)
    	t.string :title
    	t.string :description
    	t.string :link

      t.timestamps
    end
  end
end
