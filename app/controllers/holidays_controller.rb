class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:show, :edit, :update, :destroy]

  # GET /holidays
  # GET /holidays.json
  def index
    # @holidays = Holiday.all
    #WILL_PAGINATE GEM INSTALLED
    @holidays = Holiday.paginate(page: params[:page], per_page: 15)
  end

  # GET /holidays/1
  # GET /holidays/1.json
  def show
    # byebug
  end

  # GET /holidays/new
  def new
    @holiday = Holiday.new
    # @categories = Category.all
  end

  # GET /holidays/1/edit
  def edit
    # @categories = Category.all
  end

  # POST /holidays
  # POST /holidays.json
  def create
    @holiday = Holiday.create(holiday_params)
    @holiday.user = current_user
    # @holiday.photos.attach(params[:holiday][:photos])

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to @holiday, notice: 'Holiday was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /holidays/1
  # PATCH/PUT /holidays/1.json
  def update
    # @holiday.photos.attach(params[:holiday][:photos])
    respond_to do |format|
      if @holiday.update(holiday_params)
        format.html { redirect_to @holiday, notice: 'Holiday was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /holidays/1
  # DELETE /holidays/1.json
  def destroy
    @holiday.destroy
    respond_to do |format|
      format.html { redirect_to holidays_url, notice: 'Holiday was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holiday
      @holiday = Holiday.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holiday_params
      params.require(:holiday).permit(:value, :price, :guest, :title, :description, :check_in, :check_out, :category_id, photos:[])
    end
end
