class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_edit_listing, only: :edit

  def authorize_edit_listing
    if set_listing.seller_id != current_user.id
      redirect_to @listing
    elsif set_listing.check_in < Time.now.strftime('%a, %d %b %Y').to_date
      redirect_to @listing
    end
  end

  require 'will_paginate/array'

  # GET /listings
  def index
    #WILL_PAGINATE GEM INSTALLED
    @listings = Listing.all.find_all do |listing| listing.sale == nil && listing.check_in > Date.yesterday end
    @listings = @listings.paginate(page: params[:page], per_page: 10)
    if params[:search]
      @listings = Listing.check_in_date(params[:search][:start_date]).paginate(page: params[:page]).order("check_in ASC")
    end
  end

  # GET /listings/1
  def show

  end

  # GET /listings/new
  def new
    @listing = Listing.new

  end

  # GET /listings/1/edit
  def edit

  end

  # POST /listings
  def create
    @listing = Listing.create(listing_params)
    @listing.seller = current_user

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
    if !@listing.sale
      respond_to do |format|
        if @listing.update(listing_params)
          format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to listings_url, notice: 'Unable to edit listing that has already been sold.' }
      end
    end
  end

  # DELETE /listings/1
  def destroy
    if !@listing.sale
      @listing.destroy
      respond_to do |format|
        format.html { redirect_to listings_url, notice: 'Listing was successfully deleted.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to listings_url, notice: 'Unable to delete listing that has already been sold.' }
      end
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
