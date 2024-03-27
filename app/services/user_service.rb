module UserService
    module Base
      def self.create_user(params)
        user = User.new(params)
  
        begin
          user.save!
          ServiceContract.success(user)
        rescue ActiveRecord::RecordInvalid => exception
          ServiceContract.error(user.errors.full_messages)
        end
      end
  
      def self.show_user(user)
        begin
          ServiceContract.success(user)
        rescue ActiveRecord::RecordNotFound => exception
          ServiceContract.error("User not found")
        end
      end
  
      def self.update_user(user, params)
        begin
          user.update!(params)
          ServiceContract.success(user)
        rescue ActiveRecord::RecordInvalid => exception
          ServiceContract.error(user.errors.full_messages)
        end
      end
  
      def self.destroy_user(user)
        begin
          user.destroy!
          ServiceContract.success(user)
        rescue ActiveRecord::RecordNotDestroyed => exception
          ServiceContract.error(exception.message)
        end
      end
    end
  end