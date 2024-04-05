# frozen_string_literal: true

class UserTrayBlueprint < Blueprinter::Base
  
    view :normal do
      fields :id, :seed_map, :created_at, :updated_at      
      association :tray, blueprint: TrayBlueprint, view: :normal
    end  
end