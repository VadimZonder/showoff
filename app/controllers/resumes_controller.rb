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
    
    ###@email= current_user.email
   ### @accountNumber = @email[0, 6]  
    
    
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















##________________________________

@readResume =  CSV.read("./public/uploads/resume/attachment/1/FromFTP.csv")


@path = './public'+@resume.attachment.to_s



 CSV.foreach(@path.chomp("/*"), encoding: "utf-8", liberal_parsing: true) do |row1|
        ########@tempFTPPath = './tmp/FromFTP.csv'
        ########CSV.foreach(@tempFTPPath.chomp("/*"), encoding: "utf-8", liberal_parsing: true) do |row1|
                             @csvColumn1 =  row1[0].inspect.gsub!('"', '') #+  @csvRow1.inspect 
                @csvColumn2 =  row1[1].inspect.gsub!('"', '') 
                @csvColumn3 =  row1[2].inspect.gsub!('"', '') 
                @csvColumn4 =  row1[3].inspect.gsub!('"', '') 
                @csvColumn5 =  row1[4].inspect.gsub!('"', '') 
                @csvColumn6 =  row1[5].inspect.gsub!('"', '')  
                @csvColumn7 =  row1[6].inspect.gsub!('"', '')  
                @csvColumn8 =  row1[7].inspect.gsub!('"', '')  
                @csvColumn9 =  row1[8].inspect.gsub!('"', '')  
                @csvColumn10 =  row1[9].inspect.gsub!('"', '')  
                @csvColumn11 =  row1[10].inspect.gsub!('"', '')  
                @csvColumn12 =  row1[11].inspect.gsub!('"', '')  
                @csvColumn13 =  row1[12].inspect.gsub!('"', '')  
                @csvColumn14 =  row1[13].inspect.gsub!('"', '')  
                @csvColumn24 =  row1[23].inspect.gsub!('"', '')  
                @csvColumn25 =  row1[24].inspect.gsub!('"', '')  
                @csvColumn26 =  row1[25].inspect.gsub!('"', '')  
                @csvColumn27 =  row1[26].inspect.gsub!('"', '') 
                @csvColumn30 =  row1[29].inspect.gsub!('"', '')  
                @csvColumn31 =  row1[30].inspect.gsub!('"', '')  
                @csvColumn32 =  row1[31].inspect.gsub!('"', '') 
=begin             
                @csvColumn1 =  row1[0].gsub('"\\"', '').gsub!('"', '') #+  @csvRow1.inspect 
                @csvColumn2 =  row1[1].gsub('"\\"', '').gsub!('"', '') 
                @csvColumn3 =  row1[2].gsub('"\\"', '').gsub!('"', '') 
                @csvColumn4 =  row1[3].gsub('"\\"', '').gsub!('"', '') 
                @csvColumn5 =  row1[4].gsub('"\\"', '').gsub!('"', '')
                @csvColumn6 =  row1[5].gsub('"\\"', '').gsub!('"', '')  
                @csvColumn7 =  row1[6].gsub('"\\"', '').gsub!('"', '')  
                @csvColumn8 =  row1[7].gsub('"\\"', '').gsub!('"', '')
                @csvColumn9 =  row1[8].gsub('"\\"', '').gsub!('"', '')###.gsub(/\s+/, "") 
                @csvColumn10 =  row1[9].gsub('"\\"', '').gsub!('"', '')  
                @csvColumn11 =  row1[10].gsub('"\\"', '').gsub!('"', '')  
                @csvColumn12 =  row1[11].gsub('"\\"', '').gsub!('"', '')  
                @csvColumn13 =  row1[12].gsub('"\\"', '').gsub!('"', '')  
                @csvColumn14 =  row1[13].gsub('"\\"', '').gsub!('"', '') 
                @csvColumn24 =  row1[23].gsub('"\\"', '').gsub!('"', '')  
                @csvColumn25 =  row1[24].gsub('"\\"', '').gsub!('"', '') 
                @csvColumn26 =  row1[25].gsub('"\\"', '').gsub!('"', '') 
                @csvColumn27 =  row1[26].gsub('"\\"', '').gsub!('"', '')
                @csvColumn30 =  row1[29].gsub('"\\"', '').gsub!('"', '')  
                @csvColumn31 =  row1[30].gsub('"\\"', '').gsub!('"', '') 
                @csvColumn32 =  row1[31].gsub('"\\"', '').gsub!('"', '')
                #@csvColumn50 =  row1[49].gsub('"\\"', '').gsub!(']]', '').gsub!('"', '')
=end                
                #@csvArrayFTP.push(@csvColumn3)
                
               #each cell of a column (one row by one)
               @mapping_array = [@csvColumn1,  @csvColumn2,  @csvColumn3,  @csvColumn4, 
               @csvColumn5,  @csvColumn6,  @csvColumn7,  @csvColumn8,
               @csvColumn9,  @csvColumn10, @csvColumn11, @csvColumn12, 
               @csvColumn13, @csvColumn14, @csvColumn15, @csvColumn16,
               @csvColumn17, @csvColumn18, @csvColumn19, @csvColumn20,
               @csvColumn21, @csvColumn22, @csvColumn23, @csvColumn24, 
               @csvColumn25, @csvColumn26, @csvColumn27, @csvColumn28,  
               @csvColumn29, @csvColumn30, @csvColumn31, @csvColumn32, 
               @csvColumn33, @csvColumn34, @csvColumn35, @csvColumn36,
               @csvColumn37, @csvColumn38, @csvColumn39, @csvColumn40,
               @csvColumn41, @csvColumn42, @csvColumn43, @csvColumn44,
               @csvColumn45, @csvColumn46, @csvColumn47, @csvColumn48, 
               @csvColumn49, @csvColumn50]
               
               
               
               
                         
        #Mappings_____________________________________________________________BEGIN
        #all the colums from the DB  -  Mapping for that particular account
        @mappings = Mapping.find_by_account_number(@accountNumber)
        @debug7 = true
        #if no mapping was created yet then use the default
        if @mappings.nil?
            @a1= 1
            @b2= 2
            @c3= 3
            @d4= 4
            @e5= 5
            @f6= 6
            @g7= 7
            @h8= 8
            @i9= 9
            @j10= 10
            
            @k11= 11
            @l12= 12
            @m13= 13
            @n14= 14
            @o15= 15
            @p16= 16
            @q17= 17
            @r18= 18
            @s19= 19
            @t20= 20
            
            @u21= 21
            @v22= 22
            @w23= 23
            @x24= 24
            @y25= 25
            @z26= 26
            @aa27= 27
            @ab28= 28
            @ac29= 29
            @ad30= 30
            
            @ae31= 31
            @af32= 32
            @ag33= 33
            @ah34= 34
            @ai35= 35
            @aj36= 36
            @ak37= 37
            @al38= 38
            @am39= 39
            @an40= 40
            
            @ao41= 41
            @ap42= 42
            @aq43= 43
            @ar44= 44
            @as45= 45
            @at46= 46
            @au47= 47
            @av48= 48
            @aw49= 49
            @ax50= 50
        
        
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
            @z26= @mappings.z26
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

        a = @a1
        b = @b2
        c = @c3
        d = @d4
        e = @e5
        f = @f6
        g = @g7
        h = @h8
        i = @i9
        j = @j10
        
        k = @k11
        l = @l12
        m = @m13
        n = @n14
        o= @o15 
        p = @p16
        q= @q17
        r= @r18
        s= @s19
        t= @t20
        
        u= @u21
        v= @v22
        w= @w23
        x = @x24
        y = @y25
        z = @z26
        aa = @aa27
        ab= @ab28
        ac= @ac29
        
        ad = @ad30
        ae = @ae31
        af = @af32
        ag= @ag33
        ah= @ah34
        ai= @ai35
        aj= @aj36
        ak= @ak37
        al= @al38
        am= @am39
        an= @an40
        
        ao= @ao41
        ap= @ap42
        aq= @aq43
        ar= @ar44
        as= @as45
        at= @at46
        au= @au47
        av= @av48
        aw= @aw49
        ax= @ax50
        
=begin  
          a = 1
          b = 2
          c = 3
          d = 4
          e = 5
          f = 6
          g = 7
          h = 8
          i = 9
          j = 10
          k = 11
          l = 12
          m = 13
          n = 14
          x = 24
          y = 25
          z = 26
          aa = 27
          ad = 30
          ae = 31
          af = 32
=end
#Mappings_____________________________________________________________END
          
         
##Autorize call_____________________________________________________________ BEGIN
                #get the authorise token
                xmlPayloadAuthorise = 
                '<?xml version="1.0" encoding="iso-8859-1"?>
                <Request>
                <User>'+@accountNumber+'</User>
                <Password>'+@password+'</Password>
                <Type>CUST</Type>
                </Request>'
                
                authorizeResponce = RestClient.post "https://papi.dpd.ie/common/api/authorize", xmlPayloadAuthorise, 
                {content_type: :xml, accept: :xml, authorization: 'Bearer '+@token+''}
                
                #parce the xml to get the access token
                xmlAuthorizeDoc  = Nokogiri::XML(authorizeResponce)
                #get the access token
                accessToken = xmlAuthorizeDoc.xpath("//AccessToken").text
                
                
                ######___________________________________MAPPING AN ARRAY_________________________________
                #@mapping_array[@xml_input_d.to_i-1]
                
                @A1 = @mapping_array[a-1]
                @A1= @A1.to_s
                
                @C3 = @mapping_array[c-1]
                @C3= @C3.to_s
                
                @D4 = @mapping_array[d-1]
                @D4= @D4.to_s
                
                @E5 = @mapping_array[e-1]
                @E5= @E5.to_s
                
                @F6 = @mapping_array[f-1]
                @F6= @F6.to_s
                
                @G7 = @mapping_array[g-1]
                @G7= @G7.to_s
                
                @H8 = @mapping_array[h-1]
                @H8= @H8.to_s
                #if postcode filed is empty
                #if @H8==nil
                #    @H8=' '
               # end
                
                
                
                @I9 = @mapping_array[i-1]
                @I9= @I9.to_s
                
                @J10 = @mapping_array
                @J10= @J10.to_s
                
                @K11 = @mapping_array[k-1]
                @K11= @K11.to_s
                
                @L12 = @mapping_array[l-1]
                @L12= @L12.to_s
                
                @M13 = @mapping_array[g-1]
                @M13= @M13.to_s
                
                @N14 = @mapping_array[m-1]
                @N14= @N14.to_s
                
                
                
                @X24 = @mapping_array[x-1]
                @X24= @X24.to_s
                
                @Y25 = @mapping_array[y-1]
                @Y25= @Y25.to_s
                
                @Z26 = @mapping_array[z-1]
                @Z26= @Z26.to_s
                
                @AA27 = @mapping_array[aa-1]
                @AA27= @AA27.to_s
                
                @AD30 = @mapping_array[ad-1]
                @AD30= @AD30.to_s
                
                                  
                
                #@H8 = "N37 VK44"
                  
                 #{!@H8.nil? ? @H8 : ''}
                 #{!@H8.nil? ? <PostCode>@H8</PostCode> : ''}
                 #<PostCode>#{!@H8.nil? ? @H8 : ''}</PostCode>
                 @postcodeYes = "<PostCode>"+@H8+"</PostCode>"
                 @postcode = "#{!@H8.nil? ? @postcodeYes : ''}"
                xmlPayloadAuthorised = 
                '<?xml version="1.0" encoding="iso-8859-1"?>
                <PreAdvice>
                    <Consignment>
                        <RecordID>'+ @I9 +  '</RecordID>
                        <AlertEmailAddress>'+ @AD30 +  '</AlertEmailAddress>
                        <ConsignmentDescription>LG.124132D</ConsignmentDescription>
                        <ConsignmentDate>2018-12-03</ConsignmentDate>
                        <CustomerAccount>1111L1</CustomerAccount>
                        <DeliveryDepot>0</DeliveryDepot>
                        <Gazzed>0</Gazzed>
                        <GazzType>PreAdvice</GazzType>
                        <TrackingNumber>0</TrackingNumber>
                        <TotalParcels>1</TotalParcels>
                        <Relabel>1</Relabel>
                        <ServiceOption>5</ServiceOption>
                        <ServiceType>1</ServiceType>
                        <Weight>10</Weight>
                        <DeliveryAddress>
                            <Contact>'+ @X24 +'</Contact>
                            <ContactTelephone>'+@Y25  +'</ContactTelephone>
                            <ContactEmail>'+@AD30  +'</ContactEmail>
                            <BusinessName>'+@C3  +'</BusinessName>
                            <AddressLine1>'+@D4  +'</AddressLine1>
                            <AddressLine2>'+@E5  +'</AddressLine2>
                            <AddressLine3>'+@F6  +'</AddressLine3>
                            <AddressLine4>'+@G7 +'</AddressLine4>
                           '+@postcode+'
                            <CountryCode>'+@I9 +'</CountryCode>
                        </DeliveryAddress>
                        <CollectionAddress>
                           <Contact>'+@X24  +'</Contact>
                            <ContactTelephone>'+@Y25  +'</ContactTelephone>
                            <ContactEmail>'+@AD30  +'</ContactEmail>
                            <BusinessName>'+ @C3  +'</BusinessName>
                            <AddressLine1>'+@D4  +'</AddressLine1>
                            <AddressLine2>'+@E5  +'</AddressLine2>
                            <AddressLine3>'+@F6  +'</AddressLine3>
                            <AddressLine4>'+@G7 +'</AddressLine4>
                          '+@postcode+'
                            <CountryCode>'+@I9 +'</CountryCode>
                        </CollectionAddress>
                        <References>
                            <Reference>
                                <ReferenceName>name</ReferenceName>
                                <ReferenceValue>'+@Z26 +'</ReferenceValue>
                                <ParcelNumber>1</ParcelNumber>
                            </Reference>
                            <Reference>
                                <ReferenceName>ref3</ReferenceName>
                                <ReferenceValue>'+@AA27 +'</ReferenceValue>
                                <ParcelNumber>2</ParcelNumber>
                            </Reference>
                        </References>
                    </Consignment>
                </PreAdvice>'
                
                labelResponse = RestClient.post "https://papi.dpd.ie/common/api/preadvice", xmlPayloadAuthorised, 
                {content_type: :xml, accept: :xml, authorization: "Bearer " + accessToken}
                
                #parce the xml to get the access token
                xmlLabelDoc  = Nokogiri::XML(labelResponse)
                #get the access token
                @labelURI = xmlLabelDoc.xpath("//LabelImage").text
                
                @responseXML = xmlLabelDoc
                
                 
                ###############
                ####redirects to url with a label
                
                
                @labelsArray2.push(@labelURI)
                
                @xmlPayload =  xmlPayloadAuthorised
               

end
##______________________________________
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
