class WelcomeController < ApplicationController
  before_action :set_mapping, only: [:show, :edit, :update, :destroy]
   before_action :set_bulletin, only: [:show, :edit, :update, :destroy]
  # GET /welcome
  def index
    @bulletin      = Bulletin.new
    @bulletin_list = Bulletin.order(created_at: :desc).all
    
   @bulletin_last = Bulletin.last.created_at
    
    
        #now get a file from storage if file is in folder.

    @a1= Mapping.last.a1
    @b2= Mapping.last.b2
    @c3= Mapping.last.c3
    @d4= Mapping.last.d4
    @e5= Mapping.last.e5
    @f6= Mapping.last.f6
    @g7= Mapping.last.g7
    @h8= Mapping.last.h8
    @i9= Mapping.last.i9
    @j10= Mapping.last.j10
    @k11= Mapping.last.k11
    @l12= Mapping.last.l12
    @m13= Mapping.last.m13
    @n14= Mapping.last.n14
    @x24= Mapping.last.x24
    @y25= Mapping.last.y25
    @z25= Mapping.last.z26
    @aa27= Mapping.last.aa27
    @ad30= Mapping.last.ad30
    @ae31= Mapping.last.ae31
    @af32= Mapping.last.af32
  end
  
  
   private
    # Use callbacks to share common setup or constraints between actions.
    def set_mapping
      @mapping = Mapping.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mapping_params
      params.require(:mapping).permit(:a1, :b2, :c3, :d4, :e5, :f6, :g7, :h8, :i9, :j10, :k11, :l12, :m13, :n14, :x24, :y25, :z26, :aa27, :ad30, :ae31, :af32)
    end
    
     private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulletin
      @bulletin = Bulletin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bulletin_params
      params.fetch(:bulletin, {})
    end
end
