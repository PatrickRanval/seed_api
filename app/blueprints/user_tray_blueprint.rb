# frozen_string_literal: true

class UserTrayBlueprint < Blueprinter::Base
  
    view :normal do
      field :id      
      association :tray, blueprint: TrayBlueprint, view: :normal
    end  
end