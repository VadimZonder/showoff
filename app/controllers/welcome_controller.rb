class WelcomeController < ApplicationController
# GET /welcome
  def index
      def button
           @hi = 'hi'
      end

     @bulletin      = Bulletin.new
    @bulletin_list = Bulletin.order(created_at: :desc).all
    
  ############# @bulletin_last = Bulletin.last.created_at
  
  @resumes = Resume.all
  @resume = Resume.new

  @isFTP2 = IsFTp.last

  #@isFTP2.save
  
  
   isFTP = cookies[:cl]
unless isFTP.nil?
  
if isFTP == 'true'
@isFTP2.isFTP = true
@isFTP2.save

else
@isFTP2.isFTP  = false
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
