class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices, status: :ok
    end

    def create
        spice = Spice.create( spice_params )
        # spice = nil

        if spice
            render json: spice, status: :created
        else
            render json: spice, status: 418
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id] )
        if spice
            spice.destroy
            render json: 'Spice was deleted!', status: 200
        else
            render json: {errors: ['Spice not found']}, status: :not_found
        end
    end

    def update
        spice = Spice.find( params[:id] )
        if spice
            spice.update( spice_params )
            render json: spice, status: :ok
        else
            render json: {errors: ['Could not find spice.']}, status: 404
        end
    end

    private

    def spice_params
        params.permit( :title, :image, :description, :notes, :rating )
        # params.require(:spice).permit( :title, :image, :description, :notes, :rating )
    end


end
