class MappingsController < ApplicationController
  before_action :set_mapping, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!
 
 
  # GET /mappings
  # GET /mappings.json
  def index
    @debug18 = true
      @email= current_user.email
     @accountNumber = @email[0, 6]  
    @mappings = Mapping.all
  end

  # GET /mappings/1
  # GET /mappings/1.json
  def show
     @email= current_user.email
     @accountNumber = @email[0, 6] 
  end

  # GET /mappings/new
  def new
     @email= current_user.email
     @accountNumber = @email[0, 6] 
    @mapping = Mapping.new
  end

  # GET /mappings/1/edit
  def edit
     @email= current_user.email
     @accountNumber = @email[0, 6] 
  end

  # POST /mappings
  # POST /mappings.json
  def create
     @email= current_user.email
     @accountNumber = @email[0, 6]  
if  Mapping.find_by_account_number(@accountNumber).nil?
    @mapping = Mapping.new(mapping_params)
   ## @is_f_tp = IsFTp.last
    @mapping = Mapping.find_by_account_number(@accountNumber)
    ###@is_f_tp = IsFTp.find_by_account_number('5287L9')
   #### @mapping = Mapping.new(mapping_params)

    respond_to do |format|
      if @mapping.save
        format.html { redirect_to @mapping, notice: 'Mapping was successfully created.' }
        format.json { render :show, status: :created, location: @mapping }
      else
        format.html { render :new }
        format.json { render json: @mapping.errors, status: :unprocessable_entity }
      end
    end
    else   
   @mapping = Mapping.find_by_account_number(@accountNumber)
 ### @is_f_tp = IsFTp.find_by_account_number('5287L9')
     respond_to do |format|
      if @mapping.save
        format.html { redirect_to @mapping, notice: 'Mapping was successfully created.' }
        format.json { render :show, status: :created, location: @mapping }
      else
        format.html { render :new }
        format.json { render json: @mapping.errors, status: :unprocessable_entity }
      end
    end
end    
  end

  # PATCH/PUT /mappings/1
  # PATCH/PUT /mappings/1.json
  def update
     @email= current_user.email
     @accountNumber = @email[0, 6] 
    respond_to do |format|
      if @mapping.update(mapping_params)
        format.html { redirect_to @mapping, notice: 'Mapping was successfully updated.' }
        format.json { render :show, status: :ok, location: @mapping }
      else
        format.html { render :edit }
        format.json { render json: @mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mappings/1
  # DELETE /mappings/1.json
  def destroy
     @email= current_user.email
     @accountNumber = @email[0, 6] 
    @mapping.destroy
    respond_to do |format|
      format.html { redirect_to mappings_url, notice: 'Mapping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mapping
      @mapping = Mapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mapping_params
      params.require(:mapping).permit(:account_number, :a1, :b2, :c3, :d4, :e5, :f6, :g7, :h8, :i9, :j10, :k11, :l12, :m13, :n14, :o15, :p16, :q17, :r18, :s19, :t20, :u21, :v22, :w23, :x24, :y25, :z26, :aa27, :ab28, :ac29, :ad30, :ae31, :af32, :ag33, :ah34, :ai35, :aj36, :ak37, :al38, :am39, :an40, :ao41, :ap42, :aq43, :ar44, :as45, :at46, :au47, :av48, :aw49, :ax50)
    end
end
