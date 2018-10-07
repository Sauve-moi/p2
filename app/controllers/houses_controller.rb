class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  before_action
  # GET /houses
  # GET /houses.json


  def index
    @houses = House.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @houses }
    end
  end


  # GET /houses/1
  # GET /houses/1.json
  def show
    @picture = Picture.find_by(house_id: @house.house_id)
    @inquiries = Inquiry.where(houseid: @house.house_id)
    @user_ids = @inquiries.select('userid')
    userids = Array.new(@user_ids.length)

    @user_ids.each do |id|
      userids.push(id.userid)
    end

    @users = User.find(userids)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house }
    end
  end

  # GET /houses/new
  def new
    @house = House.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @house }
    end
  end

  # GET /houses/1/edit
  def edit
    #@house = House.find(params[:house_id])
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)

    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render action :"new" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update

    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { render :show, status: :ok, location: @house }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    #@house = House.find(params[:house_id])
    @house.destroy

    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def potential_buyers
    @potential_buyers = Potential_buyers.select('buyer_id').where(house_id: params[:house_id])

  end

  def reply
    @inquiry = Inquiry.find(params[:inquiry][:id])
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        format.html { redirect_to '/houses/' + @inquiry.houseid.to_s }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_house
   # @house = House.find(params[:id]
    @house=House.find_by(house_id: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def house_params
    params.require(:house).permit(:house_id, :location, :square_footage, :year_built, :style, :list_price, :floors, :basement, :current_house_owner, :contact_information_for_listing_realtor)
  end

  def inquiry_params
    params.require(:inquiry).permit(:id, :reply )
  end
end
