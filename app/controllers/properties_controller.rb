class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      flash[:notice] = "Property was saved."
      redirect_to @property
    else
      flash[:error] = "There was an error saving the property. Please try again."
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update_attributes(property_params)
      flash[:notice] = "Property was updated."
      redirect_to @property
    else
      flash[:error] = "There was an error saving the property. Please try again."
      render :edit
    end
  end
end

def property_params
  params.require(:property).permit(:name, :address1, :address2, :address3, :country, :city, :state, :zip, :taxes, :rent, :notes)
end
