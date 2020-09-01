class SignupsController < ApplicationController
    # before_action :find_camper, only: [:show]
    
    # def index
    #   @campers = Camper.all
    # end
  
    # def show
  
    # end

    def new
        @signup = Signup.new
    end

    def create
        @signup = Signup.create(signup_params)
        
        if @signup.valid?
            flash[:success] = "This #{@signup.camper} has signed up for #{@signup.activity}!"
            redirect_to camper_path(@signup.camper.id)
        else
            flash[:my_errors] = @signup.errors.full_messages
            redirect_to new_signup_path
        end

    end
  
    private
  
    # def find_camper
    #   @camper = Camper.find(params[:id])
    # end

    def signup_params
        params.require(:signup).permit(:camper_id, :activity_id, :time)
    end

  end