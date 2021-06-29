# frozen_string_literal: true

class AddColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false, null: false
    add_column :users, :postal_code, :integer, null: false
    add_column :users, :address, :string, null: false
    add_column :users, :biography, :text, null: false
  end
end
