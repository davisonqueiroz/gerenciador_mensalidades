class ChangeEnumInstitution < ActiveRecord::Migration[8.0]
  def change
    change_column :institutions, :status, :integer, using: "status::integer", default: 0
    rename_column :institutions, :type, :institution_type
    change_column :institutions, :institution_type, :integer, using: "institution_type::integer", default: 0
  end
end
