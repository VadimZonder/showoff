class ResumesController < ApplicationController
  def index
      @resumes = Resume.all
  end
   
   def new
      @resume = Resume.new
   end
   
   def create
     #checks if there are Resume entries in DB
      if  Resume.first.nil?
        #true=make new one
        @resume = Resume.new(resume_params)
      else
        #false=delete the old one and make new one
        Resume.last.destroy
        @resume = Resume.new(resume_params)
        
      end
      
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
