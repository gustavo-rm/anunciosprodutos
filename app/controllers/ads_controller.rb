class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :homepage
  load_and_authorize_resource :except => [:homepage, :show]

  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.where(user: current_user).order("title")
  end

  def homepage
    @ads = Ad.order(viewnumber: :desc, title: :asc)
    @ads = @ads.where(category_id: params[:category_id]) unless params[:category_id].blank?
    @ads = @ads.where("LOWER(ads.title) like ? OR LOWER(ads.description) like ? ", "%#{params[:search].to_s.downcase}%", "%#{params[:search].to_s.downcase}%") unless params[:search].blank?
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
    category_id = @ad.category_id
    id = @ad.id
    @ads = Ad.order(viewnumber: :desc, title: :asc)
    @ads = @ads.where("category_id = ? AND NOT id = ?", category_id, id) unless category_id.blank?
    
    viewnumber = @ad.viewnumber
    if (viewnumber.nil?)
      viewnumber = 1
    else
      viewnumber = viewnumber + 1
    end

    @ad.update_attribute(:viewnumber, viewnumber)
  end

  # GET /ads/new
  def new
    @ad = Ad.new
  end

  # GET /ads/1/edit
  def edit
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(ad_params)
    @ad.user = current_user

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
        format.json { render :show, status: :created, location: @ad }
      else
        format.html { render :new }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.json
  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Ad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title, :description, :price, :viewnumber, :quantity, :category_id, :user_id, {photos: []})
    end
end
