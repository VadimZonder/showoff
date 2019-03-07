class WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]

  # GET /widgets
  # GET /widgets.json
  def index

  end

  # GET /widgets/1
  # GET /widgets/1.json
  def show
  end

  # GET /widgets/new
  def new

  end

  # GET /widgets/1/edit
  def edit
  end

  # POST /widgets
  # POST /widgets.json
  def create
   
  end

  # PATCH/PUT /widgets/1
  # PATCH/PUT /widgets/1.json
  def update
   
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.json
  def destroy
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_widget
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def widget_params
      
    end
end
