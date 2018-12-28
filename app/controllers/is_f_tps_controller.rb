class IsFTpsController < ApplicationController
  before_action :set_is_f_tp, only: [:show, :edit, :update, :destroy]

  # GET /is_f_tps
  # GET /is_f_tps.json
  def index
    @is_f_tps = IsFTp.all
  end

  # GET /is_f_tps/1
  # GET /is_f_tps/1.json
  def show
  end

  # GET /is_f_tps/new
  def new
    @is_f_tp = IsFTp.new
  end

  # GET /is_f_tps/1/edit
  def edit
  end

  # POST /is_f_tps
  # POST /is_f_tps.json
  def create
    @is_f_tp = IsFTp.new(is_f_tp_params)

    respond_to do |format|
      if @is_f_tp.save
        format.html { redirect_to @is_f_tp, notice: 'Is f tp was successfully created.' }
        format.json { render :show, status: :created, location: @is_f_tp }
      else
        format.html { render :new }
        format.json { render json: @is_f_tp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /is_f_tps/1
  # PATCH/PUT /is_f_tps/1.json
  def update
    respond_to do |format|
      if @is_f_tp.update(is_f_tp_params)
        format.html { redirect_to @is_f_tp, notice: 'Is f tp was successfully updated.' }
        format.json { render :show, status: :ok, location: @is_f_tp }
      else
        format.html { render :edit }
        format.json { render json: @is_f_tp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /is_f_tps/1
  # DELETE /is_f_tps/1.json
  def destroy
    @is_f_tp.destroy
    respond_to do |format|
      format.html { redirect_to is_f_tps_url, notice: 'Is f tp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_is_f_tp
      @is_f_tp = IsFTp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def is_f_tp_params
      params.require(:is_f_tp).permit(:isFTP)
    end
end
