class RenameModelsToCarModels < ActiveRecord::Migration
  def change
    rename_table :models, :car_models
  end
end
