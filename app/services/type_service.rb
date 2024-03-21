module TypeService
    module Base

        def self.create_type(params)
            type = Type.new(params)
            
            begin
              type.save!
            rescue ActiveRecord::RecordInvalid => exception
                return ServiceContract.error(type.errors.full_messages)
            end

            ServiceContract.success(type)           
        end

        def self.show_type(type)            
            begin
                ServiceContract.success(type)   
            rescue ActiveRecord::RecordInvalid => exception
                return ServiceContract.error(type.errors.full_messages)
            end       
        end


        def self.update_type(type, params)
            begin
                type.update!(params)
                ServiceContract.success(type)
            rescue ActiveRecord::RecordInvalid => exception
                ServiceContract.error(type.errors.full_messages)
            end
        end

        def self.destroy_type(type)
            begin
                type.destroy!
                ServiceContract.success(type)
            rescue ActiveRecord::RecordNotDestroyed => exception
                ServiceContract.error(exception.message)
            end
        end

    end
end