class WelcomeController < ApplicationController
    before_action :authenticate_user!
# GET /welcome
  def index
       
        @email= current_user.email
     @accountNumber = @email[0, 6]  


     @bulletin      = Bulletin.new
    @bulletin_list = Bulletin.order(created_at: :desc).all
    
  ############# @bulletin_last = Bulletin.last.created_at
  
  @resumes = Resume.all
  @resume = Resume.new

  @isFtp= IsFTp.last.isFTP
  
  #######@isFTP2 = IsFTp.last
    @isFTP2 = IsFTp.find_by_account_number(@accountNumber)
 

  #@isFTP2.save
  
 #is FTP slider/switch 
   isFTP = cookies[:cl]
   @isFTPC = IsFTp.find_by_account_number(@accountNumber)
unless isFTP.nil?

  
if isFTP == 'true'
@isFTP2.isFTP = true
@isFTP2.account_number = @accountNumber
##@isFTP2.account_number = '5287L9' #@accountNumber
@isFTP2.save

else
@isFTP2.isFTP  = false
@isFTP2.account_number = @accountNumber
##@isFTP2.account_number = '5287L9' #@accountNumber
@isFTP2.save

end
  
 # @isFTP2 = isFTP
  # @is_f_tp = IsFTp.last


end

#Mappings
#all the colums
@mappings = Mapping.find_by_account_number(@accountNumber)

if @mappings.nil?


else
    @a1= @mappings.a1
    @b2= @mappings.b2
    @c3= @mappings.c3
    @d4= @mappings.d4
    @e5= @mappings.e5
    @f6= @mappings.f6
    @g7= @mappings.g7
    @h8= @mappings.h8
    @i9= @mappings.i9
    @j10= @mappings.j10
    
    @k11= @mappings.k11
    @l12= @mappings.l12
    @m13= @mappings.m13
    @n14= @mappings.n14
    @o15= @mappings.o15
    @p16= @mappings.p16
    @q17= @mappings.q17
    @r18= @mappings.r18
    @s19= @mappings.s19
    @t20= @mappings.t20
    @u21= @mappings.u21
    @v22= @mappings.v22
    @w23= @mappings.w23
    @x24= @mappings.x24
    @y25= @mappings.y25
    @z25= @mappings.z26
    @aa27= @mappings.aa27
    @ab28= @mappings.ab28
    @ac29= @mappings.ac29
    @ad30= @mappings.ad30
    
    @ae31= @mappings.ae31
    @af32= @mappings.af32
    @ag33= @mappings.ag33
    @ah34= @mappings.ah34
    @ai35= @mappings.ai35
    @aj36= @mappings.aj36
    @ak37= @mappings.ak37
    @al38= @mappings.al38
    @am39= @mappings.am39
    @an40= @mappings.an40
    
    @ao41= @mappings.ao41
    @ap42= @mappings.ap42
    @aq43= @mappings.aq43
    @ar44= @mappings.ar44
    @as45= @mappings.as45
    @at46= @mappings.at46
    @au47= @mappings.au47
    @av48= @mappings.av48
    @aw49= @mappings.aw49
    @ax50= @mappings.ax50
end


  end   
     
def new
  @resume = Resume.new
end

   def create
      @resume = Resume.new(resume_params)
      
      if @resume.save
         redirect_to resumes_path, notice: "The resume #{@resume.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
   end
   
   private
      def resume_params
        params.require(:resume).permit(:name, :attachment)
      end

  
end
