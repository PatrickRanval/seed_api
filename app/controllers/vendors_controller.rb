class VendorsController < ApplicationController
    before_action :set_vendor, only: [:show, :update, :destroy]

    def index
      vendors = Vendor.all
      render json: vendors, status: :ok
    end
  
    def show
        render json: @vendor, status: :ok
    end
  
    def create
      vendor = Vendor.new(vendor_params)
  
      if vendor.save
        render json: vendor, status: :ok
      else
        render json: { error: "Vendor already exists or some other fail" }, status: :unprocessable_entity
      end
    end
 
  
    def update
      if @vendor.update(vendor_params)
        render json: @vendor, status: :ok
      else
        render json: { error: "Some kinda fail" }, status: :unprocessable_entity
      end
    end
  
    def destroy
        if @vendor.destroy
            render json: nil, status: :ok
          else
            render json: @vendor.errors, status: :unprocessable_entity
          end
    end
  
    private
  
    def set_vendor
        @vendor = Vendor.find(params[:id])
    end
  
    def vendor_params
        params.require(:name)
        params.permit(:name, :website)
    end
end
