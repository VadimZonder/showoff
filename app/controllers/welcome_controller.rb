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
