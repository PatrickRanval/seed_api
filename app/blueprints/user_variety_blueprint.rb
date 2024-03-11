# frozen_string_literal: true

class UserVarietyBlueprint < Blueprinter::Base
    view :normal do
        #Alternative way to get simpler JSON
        # fields :type_name      
      association :variety, blueprint: VarietyBlueprint, view: :normal
    end  
end
