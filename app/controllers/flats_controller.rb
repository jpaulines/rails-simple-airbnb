class FlatsController < ApplicationController
  before_action :find_flat, only: [ :show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
    # @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    # @flat = Flat.find(params[:id])
  end

  def update
    # @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    # @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:flat).permit(:name, :address)
  end
end
