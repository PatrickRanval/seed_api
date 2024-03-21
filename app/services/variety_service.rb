module VarietyService
    module Base
        def self.create_variety(params)
            variety = Variety.new(params)
            if variety.save
                variety
            else
                variety.errors
            end
        end
    end
end
