module VarietyService
  module Base
      def self.create_variety(params)
          type = Type.find_or_create_by(name: params[:type_name])
          variety = type.varieties.find_or_create_by(name: params[:variety_name])
    
          begin
            variety.save!
            ServiceContract.success(variety)
          rescue ActiveRecord::RecordInvalid => exception
            ServiceContract.error(variety.errors.full_messages)
          end
      end
    
      def self.find_or_create_variety(params)
          type = Type.find_or_create_by(name: params[:type_name])
          variety = type.varieties.find_or_create_by(name: params[:variety_name])
      
          variety
      end

    def self.show_variety(variety)
      begin
        ServiceContract.success(variety)
      rescue ActiveRecord::RecordNotFound => exception
        ServiceContract.error("Variety not found")
      end
    end

    def self.update_variety(variety, params)
      begin
        variety.update!(params)
        ServiceContract.success(variety)
      rescue ActiveRecord::RecordInvalid => exception
        ServiceContract.error(variety.errors.full_messages)
      end
    end

    def self.destroy_variety(variety)
      begin
        variety.destroy!
        ServiceContract.success(variety)
      rescue ActiveRecord::RecordNotDestroyed => exception
        ServiceContract.error(exception.message)
      end
    end
  end
end

