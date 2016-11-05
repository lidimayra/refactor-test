class AddMakeRefToCarModels < ActiveRecord::Migration
  def change
    remove_column :car_models, :make_id, :integer
    add_reference :car_models, :make, index: true, foreign_key: true
  end
end
