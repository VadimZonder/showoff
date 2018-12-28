class MappingsController < ApplicationController
  before_action :set_mapping, only: [:show, :edit, :update, :destroy]

  # GET /mappings
  # GET /mappings.json
  def index
    @mappings = Mapping.all
  end

  # GET /mappings/1
  # GET /mappings/1.json
  def show
  end

  # GET /mappings/new
  def new
    @mapping = Mapping.new
  end

  # GET /mappings/1/edit
  def edit
  end

  # POST /mappings
  # POST /mappings.json
  def create
       #problem for the first create. if no recods(Mapping.last = nill) then run first and if records then last
       
      #################CHANGE THIS AT THE END BECAUSE MAY NOT DEPLAY WELL
    @mapping = Mapping.new(mapping_params)
   ###########@mapping = Mapping.last

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

  # PATCH/PUT /mappings/1
  # PATCH/PUT /mappings/1.json
  def update
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
      params.require(:mapping).permit(:a1, :b2, :c3, :d4, :e5, :f6, :g7, :h8, :i9, :j10, :k11, :l12, :m13, :n14, :o15, :p16, :q17, :r18, :s19, :t20, :u21, :v22, :w23, :x24, :y25, :z26, :aa27, :ab28, :ac29, :ad30, :ae31, :af32, :ag33, :ah34, :ai35, :aj36, :ak37, :al38, :am39, :an40, :ao41, :ap42, :aq43, :ar44, :as45, :at46, :au47, :av48, :aw49, :ax50)
    end
end
