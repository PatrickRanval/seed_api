# frozen_string_literal: true

class UserVarietyBlueprint < Blueprinter::Base
  
    view :normal do
        #Alternative way to get simpler JSON
      field :id      
      association :variety, blueprint: VarietyBlueprint, view: :normal
    end  
end
