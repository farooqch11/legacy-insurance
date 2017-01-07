class LegaciesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_legacy, only: [:show, :edit, :update, :destroy ]
  

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
    @legacy = current_user.build_legacy
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
      @gender= params[:gender]
      @smoker= params[:smoker]
      @coverage_params= params[:coverage]
      @relationship_status = params[:relationship_status]

      @ammounts =Faceamount.where(:relationship_status => @relationship_status)
      pricing = @ammounts.where("start_age <= ? and  end_age >= ?",@age,@age)

      @coverage_amount = pricing.first.amount.to_f
      @coverage_factor = pricing.first.coverage_factor
      @prefered_insurance = pricing.first.prefered_insurance

      if @coverage_params.present?
        puts @coverage_params
        @coverage_amount = @coverage_params.to_i
      end

      if @coverage_amount >= 100000 && @coverage_amount <= 249999
        if @gender=="male"
          if @smoker == "true"
            @smoker_val= Pricing.male249.where(age: @age).first.sns.to_f
          else
            @smoker_val= Pricing.male249.where(age: @age).first.pns.to_f
          end
        elsif @gender=="female"
          if @smoker == "true"
            @smoker_val=Pricing.female249.where(age: @age).first.sns.to_f
          else
            @smoker_val=Pricing.female249.where(age: @age).first.pns.to_f
          end
        end
      elsif @coverage_amount >= 250000 &&@coverage_amount <= 499999
        if @gender=="male"
          if @smoker == "true"
            @smoker_val= Pricing.male499.where(age: @age).first.sns.to_f
          else
            @smoker_val= Pricing.male499.where(age: @age).first.pns.to_f
          end
        elsif @gender=="female"
          if @smoker == "true"
            @smoker_val=Pricing.female499.where(age: @age).first.sns.to_f
          else
            @smoker_val=Pricing.female499.where(age: @age).first.pns.to_f
          end
        end

      elsif @coverage_amount >= 500000 && @coverage_amount <= 2000000
        if @gender=="male"
          if @smoker == "true"
            @smoker_val= Pricing.male499.where(age: @age).first.sns.to_f
          else
            @smoker_val= Pricing.male499.where(age: @age).first.pns.to_f
          end
        elsif @gender=="female"
          if @smoker == "true"
            @smoker_val=Pricing.female2m.where(age: @age).first.sns.to_f
          else
            @smoker_val=Pricing.female2m.where(age: @age).first.pns.to_f
          end
        end

      end
      if @prefered_insurance == "GPM"
        if @gender== "male"
          if @smoker == "true"
            @smoker_val_gpm= Pricing.male1ht.where(age: @age).first.sns.to_f
          else
            @smoker_val_gpm= Pricing.male1ht.where(age: @age).first.pns.to_f
          end
        elsif @gender=="female"
          if @smoker == "true"
            @smoker_val_gpm= Pricing.female1ht.where(age: @age).first.sns.to_f
          else
            @smoker_val_gpm= Pricing.female1ht.where(age: @age).first.pns.to_f
          end
        end
      end

      @total_monthly_GPM = (@coverage_factor * @smoker_val_gpm.to_f + 4) * 0.088

      @total_monthly_term= (@coverage_factor * @smoker_val.to_f + 30)* 0.088


      if @prefered_insurance == "GPM"
        @total_monthly = @total_monthly_GPM
      else
        @total_monthly = @total_monthly_term
      end
      puts @total_monthly

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
      params.require(:legacy).permit(:age,:gender, :relationship_status, :smoker, :coverage_amount, :insurance_years, :user_id)
    end
end
