module UserVarietyService
    module Base
      def self.create_user_variety(user, params)
        user_variety = user.user_varieties.new(params)
  
        if user_variety.save
          ServiceContract.success(user_variety)
        else
          ServiceContract.error(user_variety.errors.full_messages)
        end
      end
  
      def self.show_user_variety(user_variety)
        ServiceContract.success(user_variety)
      end
  
      def self.update_user_variety(user_variety, params)
        if user_variety.update(params)
          ServiceContract.success(user_variety)
        else
          ServiceContract.error(user_variety.errors.full_messages)
        end
      end
  
      def self.destroy_user_variety(user_variety)
        if user_variety.destroy
          ServiceContract.success(user_variety)
        else
          ServiceContract.error(user_variety.errors.full_messages)
        end
      end
    end
  end