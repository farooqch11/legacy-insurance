class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show, :edit, :update, :destroy]

  # GET /policies
  # GET /policies.json
  def index
    @policies = Policy.all
  end

  # GET /policies/1
  # GET /policies/1.json
  def show
  end

  # GET /policies/new
  def new
    @policy = Policy.new
  end

  # GET /policies/1/edit
  def edit
  end

  # POST /policies
  # POST /policies.json
  def create
    @policy = Policy.new(policy_params)
    #assigning user to policy if logged in
    if user_signed_in?
      @policy.user = current_user
    end

    respond_to do |format|
      if @policy.save
        format.html { redirect_to @policy, notice: 'Policy was successfully created.' }
        format.json { render :show, status: :created, location: @policy }
      else
        format.html { render :new }
        format.json { render json: @policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /policies/1
  # PATCH/PUT /policies/1.json
  def update
    respond_to do |format|
      if @policy.update(policy_params)
        format.html { redirect_to @policy, notice: 'Policy was successfully updated.' }
        format.json { render :show, status: :ok, location: @policy }
      else
        format.html { render :edit }
        format.json { render json: @policy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policies/1
  # DELETE /policies/1.json
  def destroy
    @policy.destroy
    respond_to do |format|
      format.html { redirect_to policies_url, notice: 'Policy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_policy
    @policy = Policy.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def policy_params
    params.require(:policy).permit(:Name, :age, :birthday, :address, :StateofBirth, :CityofBirth, :height, :weight, :Licensenumber, :State, :SSN, :Salary, :Agency, :Job, :Doh, :Benefactors, :DateofBirth, :Relationship, :AgeofFather, :AgeofMother, :Living, :AgeofFatherDeath, :AgeofMotherDeath, :cause, :Siblings, :Married, :Medicalinfo)
  end
end
