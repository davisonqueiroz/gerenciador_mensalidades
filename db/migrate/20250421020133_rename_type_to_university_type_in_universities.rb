class RenameTypeToUniversityTypeInUniversities < ActiveRecord::Migration[8.0]
  def change
    rename_column :universities, :type, :university_type
  end
end
