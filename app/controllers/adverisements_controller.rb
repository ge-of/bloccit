class AdverisementsController < ApplicationController
  def index
    @adverisements = Adverisement.all
  end

  def show
    @adverisements = Adverisement.find(params[:id])
  end

  def new
    @adverisements = Adverisement.new
  end

  def create
    @adverisement = Adverisement.new
    @adverisement.title = params[:adverisement][:title]
    @adverisement.copy = params[:adverisement][:copy]
    @adverisement.price = params[:adverisement][:price]

    if @adverisement.save
      flash[:notice] = "Adverisement was saved."
      redirect_to @adverisement
    else
      flash[:error] = "There was an error saving the ad. Please try again."
      render :new
    end
  end
end
