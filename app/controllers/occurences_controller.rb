class OccurencesController < ApplicationController
    before_action :find_occurence, only: [:destroy]
    before_action :authenticate_user!
    before_action :authorize_user!, only: [:destroy]

    def create
        @gym_class = GymClass.find params[:gym_class_id]
        @occurence = Occurence.new occurence_params
        @occurence.gym_class = @gym_class


        if @occurence.save
            flash[:success] = "The occurence was successfully created..."
        else
            @occurences = @gym_class.occurences.order(created_at: :desc)
            flash[:danger] = "Oops, something went wrong, occurence couldn't be created..."
        end
        redirect_to gym_class_path(@gym_class)
    end

    def destroy
        @occurence.destroy
        redirect_to gym_class_path(@occurence.gym_class)
    end


    private
    def occurence_params
        params.require(:occurence).permit(:start_time, :end_time)
    end

    def find_occurence
        @occurence = Occurence.find(params[:id])
    end

    def authorize_user!
        unless can?(:crud, @occurence)
            flash[:danger] = "Access Denied"
            redirect_to gym_class_path(@occurence.gym_class)
        end
    end
end
