module TrayService
    module Base
      def self.create_tray(params)
        tray = Tray.new(params)
  
        begin
          tray.save!
          ServiceContract.success(tray)
        rescue ActiveRecord::RecordInvalid => exception
          ServiceContract.error(tray.errors.full_messages)
        end
      end
  
      def self.show_tray(tray)
        begin
          ServiceContract.success(tray)
        rescue ActiveRecord::RecordNotFound => exception
          ServiceContract.error("Tray not found")
        end
      end
  
      def self.update_tray(tray, params)
        begin
          tray.update!(params)
          ServiceContract.success(tray)
        rescue ActiveRecord::RecordInvalid => exception
          ServiceContract.error(tray.errors.full_messages)
        end
      end
  
      def self.destroy_tray(tray)
        begin
          tray.destroy!
          ServiceContract.success(tray)
        rescue ActiveRecord::RecordNotDestroyed => exception
          ServiceContract.error(exception.message)
        end
      end
    end
  end