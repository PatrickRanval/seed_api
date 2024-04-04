module UserTrayService
    module Base
      def self.create_user_tray(user, params)
        tray_id = params[:tray_id] # Access tray_id correctly from params

        # Construct the parameters for creating the user_tray
        user_tray_params = { tray_id: tray_id, seed_map: params[:seed_map] }

        user_tray = user.user_trays.new(user_tray_params)

        if user_tray.save
          ServiceContract.success(user_tray)
        else
          ServiceContract.error(user_tray.errors.full_messages)
        end
      end
  
      def self.show_user_tray(user_tray)
        ServiceContract.success(user_tray)
      end
  
      def self.update_user_tray(user_tray, params)
        if user_tray.update(params)
          ServiceContract.success(user_tray)
        else
          ServiceContract.error(user_tray.errors.full_messages)
        end
      end
  
      def self.destroy_user_tray(user_tray)
        if user_tray.destroy
          ServiceContract.success(user_tray)
        else
          ServiceContract.error(user_tray.errors.full_messages)
        end
      end
    end
  end