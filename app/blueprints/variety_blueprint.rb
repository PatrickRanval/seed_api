# frozen_string_literal: true

class VarietyBlueprint < Blueprinter::Base
    fields :name
  
    view :normal do
        #Alternative way to get simpler JSON
        # fields :type_name      
      association :type, blueprint: TypeBlueprint, view: :normal
    end    
end
