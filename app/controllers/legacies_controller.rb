class LegaciesController < ApplicationController
  before_action :set_legacy, only: [:show, :edit, :update, :destroy ]
  layout "new"

  # GET /legacies
  # GET /legacies.json
  def index
    @legacies = Legacy.all
  end

  # GET /legacies/1
  # GET /legacies/1.json
  def show
  end

  # GET /legacies/new
  def new
    @legacy = Legacy.new
  end

  # GET /legacies/1/edit
  def edit
  end

  # POST /legacies
  # POST /legacies.json
  def create
    @legacy = Legacy.new(legacy_params)

    respond_to do |format|
      if @legacy.save
        format.html { redirect_to @legacy, notice: 'Legacy was successfully created.' }
        format.json { render :show, status: :created, location: @legacy }
      else
        format.html { render :new }
        format.json { render json: @legacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legacies/1
  # PATCH/PUT /legacies/1.json
  def update
    respond_to do |format|
      if @legacy.update(legacy_params)
        format.html { redirect_to @legacy, notice: 'Legacy was successfully updated.' }
        format.json { render :show, status: :ok, location: @legacy }
      else
        format.html { render :edit }
        format.json { render json: @legacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legacies/1
  # DELETE /legacies/1.json
  def destroy
    @legacy.destroy
    respond_to do |format|
      format.html { redirect_to legacies_url, notice: 'Legacy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def calculate_amount
      @age= params[:age]
      @relationship_status=  params[:relationship_status]
      @smoker= params[:smoker]
      @calulated_amount= "13216546"
      respond_to do |format|
        format.js {   }
      end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legacy
      @legacy = Legacy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legacy_params
      params.require(:legacy).permit(:age, :relationship_status, :smoker, :coverage_amount, :insurance_years, :user_id)
    end
end
