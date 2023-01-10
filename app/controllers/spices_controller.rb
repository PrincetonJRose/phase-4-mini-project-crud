class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices, except: [:created_at, :updated_at], status: 418
    end

    def create
        spice = Spice.new( spice_params )
        spice.save
        render json: spice, status: :created
    end

    def show
        spice = Spice.find_by( id: params[:id] )
        if spice
            render json: spice, status: :ok
        else 
            spice_not_found
        end
    end

    def update
        spice = Spice.find_by( id: params[:id] )
        if spice
            spice.update( spice_params )
            render json: spice, status: :ok
        else
            spice_not_found
        end
    end

    def destroy
        spice = Spice.find_by( id: params[:id] )
        if spice
            spice.destroy
            head :no_content
        else
            spice_not_found
        end
    end

    private

    def spice_params
        params.permit( :title, :image, :description, :notes, :rating )
    end

    def spice_not_found
        # spice = Spice.find_by( id: params[:id] )
        # if spice
        #     return spice
        # else
            render json: { errors: ['Spice not found.'] }, status: :not_found
        # end
    end

end
