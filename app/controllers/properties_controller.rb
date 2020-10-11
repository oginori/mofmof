class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: '物件を登録しました！'
    else
      render :new
    end
  end

  def show
    @nearest_station = @property.nearest_stations
  end

  def edit
    @property.nearest_stations.build
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: '物件を編集しました！'
    else
      render :edit
    end
  end

  private

  def property_params
    params.require(:property).permit(
      :property_name,
      :rent, :address,
      :age_of_building,
      :remarks,
      nearest_stations_attributes: [
        :line_name,
        :station_name,
        :walking_minutes,
        :property_id,
    ],
  )
  end

  def set_property
    @property = Property.find(params[:id])
  end

end
