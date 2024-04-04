module ServiceContract
    def self.success(payload)
        OpenStruct.new({
            success?: true,
            payload: payload,
            errors: nil
        })
    end

                        # Appended empty array
    def self.error(errors)
        OpenStruct.new({
            success?: false,
            payload: nil,
            errors: error
        })
    end
end