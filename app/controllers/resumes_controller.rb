class ResumesController < ApplicationController
  def index
      @resumes = Resume.all
  end
   
   def new
      @resume = Resume.new
      #@resume = current_user.resume.new
   end
   
   def create
           require 'csv' 
    require 'net/ftp'
  ############################  require 'tempfile'
    require "open-uri"
    require 'rest-client'
    
    ##Development or Deployment____________
    @url =  request.original_url
    if @url.include? 'c9users.io' 
        @deployment = false
    else
        @deployment = true
        
    end  
    
    @email= current_user.email
    @accountNumber = @email[0, 6]  
    
    
     #checks if there are Resume entries in DB
      if  Resume.first.nil?
        #true=make new one
        @resume = Resume.new(resume_params)
        # @resume = current_user.resumes.new(resume_params)
      else
        #false=delete the old one and make new one
        Resume.last.destroy
        @resume = Resume.new(resume_params)
        
        # @resume = current_user.resumes.new(resume_params)
        


#Upload to FTP
ftp = Net::FTP::new("ftp.dpd.ie")
ftp.login("3L4", "3l4123")
ftp.chdir("/users/3L4/WebAppImport")



  ftp.passive = true
  #ftp.putbinaryfile('Gemfile')
 # tempfile = Tempfile.new('test')
  #tempfile.write("This is some text data I want to upload via FTP.")
  #my_data = "This is some text data I want to upload via FTP."
 # my_data = Bulletin.last
 # tempfile.puts my_data
 # ftp.putbinaryfile(tempfile)


# name_start = 'my_special_file'
#name_end = '.txt'
#location = '/path/to/some/dir'
############################options = { encoding: Encoding::UTF_8 }
#tempfile = Tempfile.new([name_start, name_end],  options) do |file|
# file.write('Hello, tempfile!')
#end

############################tempfile = Tempfile.new(['OurFormatEmailVadimTest', '.csv'], options)
#tempfile.write("22This is some text data I want to upload via FTP.")

#get the link of the file
##tempfile.write(@bulletin2 =   rails_blob_path(Bulletin.last.attachment))

#@bulletin2 = Bulletin.last.attachment.variant, rails_blob_path( Bulletin.last.attachment, disposition: "attachment")
#@bulletin2 = File.read(rails_blob_path(Bulletin.last.attachment))


#@open_uri = open(rails_blob_path(Bulletin.last.attachment))
####################@csvFileLocation3 = open('https://api-to-labels-base-vadimmalakhovski.c9users.io'+rails_blob_path(Bulletin.last.attachment))
######@csvFileLocation3 = open('https://label-gen-is-ftp.herokuapp.com'+rails_blob_path(Bulletin.last.attachment))
####################@open('OurFormatTest.csv', 'wb') do |file|
####################@  file << open('https://api-to-labels-base-vadimmalakhovski.c9users.io'+rails_blob_path(Bulletin.last.attachment)).read
 ##### file << open('https://label-gen-is-ftp.herokuapp.com'+rails_blob_path(Bulletin.last.attachment)).read
####################@  @file = file
####################@end

####################@@bulletin3 = CSV.read(@file)

if @deployment == false
=begin
@csvFileLocation3 = open('https://api-to-labels-base-vadimmalakhovski.c9users.io'+@resume.attachment.to_s)
open('OurFormatTest.csv', 'wb') do |file|
file << open('https://api-to-labels-base-vadimmalakhovski.c9users.io'+@resume.attachment.to_s).read
  @file = file
end
=end
###@file = open('https://api-to-labels-base-vadimmalakhovski.c9users.io'+@resume.attachment.to_s).read
##################here need to create lines for each lni and not just one string
 @locationCSV = './public'+@resume.attachment.to_s


else
 @locationCSV = './public'+@resume.attachment.to_s
=begin    
 @csvFileLocation3 = open('https://label-gen-var3.herokuapp.com'+@resume.attachment.to_s)
######@csvFileLocation3 = open('https://label-gen-is-ftp.herokuapp.com'+rails_blob_path(Bulletin.last.attachment))
open('OurFormatTest.csv', 'wb') do |file|
file << open('https://label-gen-var3.herokuapp.com'+@resume.attachment.to_s).read
 ##### file << open('https://label-gen-is-ftp.herokuapp.com'+rails_blob_path(Bulletin.last.attachment)).read
  @file = file
end  
=end
end

@readResume =  CSV.read("./public/uploads/resume/attachment/1/FromFTP.csv")
##open('OurFormatTest.csv', 'wb') do |file|
                ##   file << open('./public'+@resume.attachment.to_s).read
                 ##  @readResume = file
                ##   
                ## end
## updateing urls here will not trigger autoprint on refresh of the home page
        #######rmakes sure that label wont be generated on the reload
    if Url.find_by_account_number(@accountNumber).nil?
        #if is URLs is nil then create a new entry for that account
        @newURLs = Url.create :account_number => @accountNumber, :urls => './public'+@resume.attachment.to_s
        @newURLs.save
        
    else
        #if urls account already exist update with the latest urls
        @newURLs = Url.find_by_account_number(@accountNumber)
        @newURLs.update(urls: CSV.read('./public'+@resume.attachment.to_s))
        ##@newURLs = Url.create :account_number => @accountNumber, :urls => @labelsArray2
        ##@newURLs.save
        
    end 
####################@@bulletin3 = CSV.read(@file)
###################################################@fileReadCSV = CSV.read(@file)

##@csvFileLocation2 = rails_blob_path(Bulletin.last.attachment, disposition: "attachment")
##@bulletin2 = CSV.read(@csvFileLocation2.chomp("/*")) 

#@csvFileLocation2 =  File.open('/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--4426c02a8060d8ac6f3ea960420e0a1417f330f0/OurFormatTest.csv')
#@csvFileLocation2 =  'https://api-to-labels-base-vadimmalakhovski.c9users.io/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--4426c02a8060d8ac6f3ea960420e0a1417f330f0/OurFormatTest.csv?disposition=attachment'


####################@tempfile.write(@bulletin3)
####################tempfile.write(@resume.attachment)
##@fileReadCSV = @fileReadCSV.gsub(/"/, '|')
############################tempfile.write(@fileReadCSV)

#link_to "Download my", rails_blob_path(Bulletin.last.attachment, disposition: "attachment")

#@bulletin2 = File.read(rails_blob_path(@bulletin_list.last.attachment, disposition: "attachment"))
#tempfile.write(@bulletin2 = Bulletin.last.attachment)
#tempfile.write(@bulletin2 = Bulletin.order(created_at: :desc).all)
#tempfile.write(@bulletin2 = File.read(rails_blob_path(bulletin.attachment)))

#= link_to(image_tag(bulletin.attachment.variant(resize: "200x200")), rails_blob_path(bulletin.attachment, disposition: "attachment"))
#= link_to "Download file", rails_blob_path(bulletin.attachment, disposition: "attachment")


###################tempfile.rewind
#############ftp.putbinaryfile(tempfile)
ftp.putbinaryfile(@locationCSV)
####################@  @bulletin3  = tempfile.read
  
###################tempfile.unlink





ftp.close
###################tempfile.close


        
        
      end
      
      if @resume.save
         redirect_to root_path, notice: "The resume #{@resume.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to root_path, notice:  "The resume #{@resume.name} has been deleted."
   end
   
   private
      def resume_params
        params.require(:resume).permit(:name, :attachment)
      end
   
end
