class AddBodyToTemplates < ActiveRecord::Migration[6.1]
  def change
    add_column :templates, :body, :text
  end
end
