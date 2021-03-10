class MakeUrlsNonNullOnImages < ActiveRecord::Migration[5.2]
  def change
    change_column_null :images, :url, false
  end
end
