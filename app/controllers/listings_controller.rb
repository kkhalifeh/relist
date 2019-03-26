class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :past_listing?, only: :edit
  before_action :authorize_edit, only: :edit

  def past_listing?
    if Listing.find(params[:id]).check_in < Time.now.strftime('%a, %d %b %Y').to_date
      flash[:notice] = "You are not authorized to edit a past listing"
      redirect_to @listing
    end
  end

  def authorize_edit
    if Listing.find(params[:id]).seller_id != current_user.id
      flash[:notice] = "You are not authorized to edit another user's listing"
      redirect_to @listing
    end
  end

  require 'will_paginate/array'

  # GET /listings
  def index
    #WILL_PAGINATE GEM INSTALLED
    @listings = Listing.all.find_all do |listing| listing.sale == nil end
    @listings = @listings.paginate(page: params[:page], per_page: 10)
    if params[:search]
      # @listings = Listing.search(params[:search]).paginate(page: params[:page], per_page: 10).order("created_at DESC")
      @listings = Listing.check_in_date(params[:search][:start_date]).paginate(page: params[:page]).order("check_in DESC")
    end
  end

  # GET /listings/1
  def show
    # byebug
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    # @categories = Category.all
  end

  # GET /listings/1/edit
  def edit
    # @categories = Category.all
  end

  # POST /listings
  def create
    @listing = Listing.create(listing_params)
    @listing.seller = current_user
    # @listing.photos.attach(params[:listing][:photos])

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /listings/1
  def update
    # @listing.photos.attach(params[:listing][:photos])
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:value, :price, :guest, :title, :description, :check_in, :check_out, :photo)
    end
end
