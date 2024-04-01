# frozen_string_literal: true

class TrayBlueprint < Blueprinter::Base
    view :normal do
      fields :name, :cells_short, :cells_long
    end  
end