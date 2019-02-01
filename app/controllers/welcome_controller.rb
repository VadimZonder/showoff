class WelcomeController < ApplicationController
    before_action :authenticate_user!
    
    def debug
        @debug = 'works'
    end

# GET /welcome
  def index
    ##Development or Deployment____________
    @url =  request.original_url
    if @url.include? 'c9users.io' 
        @deployment = false
    else
        @deployment = true
        
    end  
      
    #default values
    @printX = "default"
      
    require 'csv' 
    require 'net/ftp'
    require 'tempfile'
    require "open-uri"
    require 'rest-client'

    @csvArray2 = Array.new 
    @labelsArray2 = Array.new  
      
      
    @email= current_user.email
    @accountNumber = @email[0, 6]  

    @resumes = Resume.all
    @resume = Resume.new


   ### @isFtp= IsFTp.last.isFTP
    
       

    
    
    #__________________________________________________________________
    #need this for initial setup - if no FTP record with this account number then create one and save
    if IsFTp.find_by_account_number(@accountNumber).nil?
        #if is ftp is nil then create a new entry for that account
        @isFTPC2 = IsFTp.create :isFTP => "false" ,:account_number => @accountNumber
       if @isFTPC2.nil?
             #####default account number for the first time when new user is create for ftp
            @isFTPC2 = IsFTp.create :isFTP => "false" ,:account_number => '1111X1'  
        else
            @isFTP2.save
         end
    end      
    
        @isFTP2 = IsFTp.find_by_account_number(@accountNumber) 
    ###if user does not exist get accoun number from the signup emails tring
    ### or created whn signup button is clicked
    ###first get the data passed from sign up
    ### @accountNumberDB = User.find_by_account_number(@accountNumber)
    

##_______________________________________________________________________________________________________IF SIGNED IN    
    if user_signed_in? 
        @isFTP2 = IsFTp.find_by_account_number(@accountNumber)
        isFTP = cookies[:cl]
        @isFTPC = IsFTp.find_by_account_number(@accountNumber)
        unless isFTP.nil?
            unless @isFTP2.nil?
                if isFTP == 'true'
                    @debug = true
                    @isFTP2.isFTP = true
                    @isFTP2.account_number = @accountNumber
                    ##@isFTP2.account_number = '5287L9' #@accountNumber
                    @isFTP2.save
                    
                else
                    @debug = false
                    @isFTP2.isFTP  = false
                    @isFTP2.account_number = @accountNumber
                    ##@isFTP2.account_number = '5287L9' #@accountNumber
                    @isFTP2.save
                
                end
    
            else
                ##else isFTP2 is nill
                  ###need existing number
                  @isFTP2 = IsFTp.find_by_account_number('5287L9')
                
            end
        
        else
            ##else isFTP from cookies is nill
            ##create first flocal is for that account
            @isFTP2.isFTP  = false
            @isFTP2.account_number = @accountNumber
            ##@isFTP2.account_number = '5287L9' #@accountNumber
            @isFTP2.save
    
        end
    
        #Onclick generae labels___
        @accountNumber = @email[0, 6] 
        @password = @email[6, 10] 
        @token = @email[16..-8] 
        
        @debug2 = true
      
#Read from FTP__________________________________________
        @print = cookies[:print]
        unless @print.nil?
            if @print == 'true' 

                
                ftp = Net::FTP::new("ftp.dpd.ie")
                ftp.login("3L4", "3l4123")
                ftp.chdir("/users/3L4/WebAppImport")
                ##files = ftp.list
                ftp.passive = true
                #most recent
                ##files = ftp.nlst('Our/*.*')
               ## most_recent = files.sort_by { |filename| ftp.mtime(filename) }.last
                files = ftp.nlst("*.csv")
                ##files = ftp.nlst("OurFormatEmailVadimTest*.csv")
                ###maybe will need all the files in loop and append to 1 csv
               most_recent = files.sort_by { |filename| ftp.mtime(filename) }.last
                ##file is downloaded from ftp to a local folder name "FromFTP"
                #############DONT SAVE INTO THE HEROKU FILEPATH BUT RATHER SAVE TO SOME TEMP LOCATION LIKE CLIPPER?
                ftp.getbinaryfile(most_recent, "FromFTP.csv")
                 @tempFTP = ftp.getbinaryfile(most_recent, nil ) ##public/uploads
                ##"/app/public/uploads/resume/attachment/1/OurFormatTest.csv"
                ######ftp.getbinaryfile("OurFormatEmailVadimTest.csv", "FromFTP")
                #tgz = ftp.list("ruby-*.tar.gz").sort.last
                #print "the latest version is ", tgz, "\n"
                #ftp.getbinaryfile(tgz, tgz)
                
                
                
                
                
# name_start = 'my_special_file'
#name_end = '.txt'
#location = '/path/to/some/dir'
options = { encoding: Encoding::UTF_8 }
#tempfile = Tempfile.new([name_start, name_end],  options) do |file|
# file.write('Hello, tempfile!')
#end

tempfile = Tempfile.new(['OurFormatEmailVadimTest', '.csv'], options)
#tempfile.write("22This is some text data I want to upload via FTP.")


####################@tempfile.write(@bulletin3)
####################tempfile.write(@resume.attachment)
##@fileReadCSV = @fileReadCSV.gsub(/"/, '|')
tempfile.write(ftp.getbinaryfile(most_recent, "FromFTP.csv"))
@tempFTPPath = tempfile.path

##@temp =Tempfile.open('*', @tempFTPPath)

tempfile.rewind

####################@  @bulletin3  = tempfile.read
  
  tempfile.unlink

tempfile.close


        
        
        
        
        
                ftp.close
                
            
            # ##triger this onclick??   
           @csvFileLocation =  './FromFTP.csv'
          
           ### @customers = CSV.read(@csvFileLocation.chomp("/*")) #.chomp(',')
           @localFileRead = File.read("./tmp/FromFTP.csv")##.gsub(/,\s+\"/,',\"')
           
           ## @localFileRead.write(@localFileRead.gsub(/,\s+\"/,',\"'))
            
             ##@localFileRe.close
             
            ##@localFileRead = File.read("FromFTP.csv")
            ##open('FromFTP' , 'wb') do |file|
              ##     file << open(Rails.root.to_s+'/FromFTP').read
              ##    @fileFTP = file
                   
              ##   end

            #read that variable
          ### @csvReadFTP = CSV.read('./FromFTP.csv')
         @csvReadFTP =   CSV.read('./tmp/FromFTP.csv', encoding: "utf-8", quote_char: '|')#.length
        # @csvReadFTP = @csvReadFTP.chomp("")#.chomp("&quot;")
         
         CSV.foreach(@csvFileLocation.chomp("/*"), encoding: "utf-8", liberal_parsing: true) do |row1|
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
               

=begin
                    arrayCounter = 0
                while arrayCounter < labelsArray.length do
                    redirect_to labelsArray[arrayCounter]
                    arrayCounter = arrayCounter +1
                end   
=end
                
               ##################
             
      else
        ###############################needed
        cookies[:print] = "false" 
         
        @print = false
        
            end
    
        
        
            end
        end
##END of MAIN CODE_______________________________________________________________________________________________________MAIN CODE END



=begin  


        # If on LOCAL_____________________________________________________________________________________________________%>
        if  @isFTP2.isFTP == false                    ############ORIGINAL LINE  isFtp.isFTP == false %>      
            #if on DEVELOPMENT LOCAL-----------------------------------------------
            ###CHANGE LATER
            if @deployment == true
                @debug3 = true
                  @csvFileLocationOpen = open('https://label-gen-var2.herokuapp.com/uploads/resume/attachment/1/OurFormatTest.csv')
                open('OurFormatTest.csv', 'wb') do |file|
                   file << open('https://label-gen-var2.herokuapp.com/uploads/resume/attachment/1/OurFormatTest.csv').read
                   @file5 = file
                   
                 end
                 
                

            #read that variable
            @csvRead = CSV.read(@file5)
            @csvLenght = @csvRead.length
            
            #read ech column and save it to a variable
            CSV.foreach(@file5) do |row1|
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
                
                @csvArray2.push(@csvColumn3 )
                
                
                
                
                
                
                
                
                        
        @debug6 = true

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
          
=begin          
        ##need to get the prin value from cookies to generate labels onclick.
        @debug8 = true
        
        @print = cookies[:print]
        unless @print.nil?
            if @print == 'true'
                @print = true
               
        
                @debug9 = true
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
                
                                  
                  #user_input_mapping = change all to integers
                
                  
                 
                xmlPayloadAuthorised = 
                '<?xml version="1.0" encoding="iso-8859-1"?>
                <PreAdvice>
                    <Consignment>
                        <RecordID>'+ @A1 +  '</RecordID>
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
                            <PostCode>'+@H8 +'</PostCode>
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
                            <PostCode>'+@H8 +'</PostCode>
                            <CountryCode>>'+@I9 +'</CountryCode>
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
                ###@labelsArrayDB = @labelsArrayDB +" "+ @labelURI
                ##@labelsArrayDB =  @labelURI +'~'+ @labelURI
                 ### @labelsArrayDB = @labelsArray2.map(&:inspect).join('') 
                 
            
                
                #######cookies[:cookeslabelsArray2] = cookies[:cookeslabelsArray2] +'~'+ @labelURI
                @debug10 = true
                
=begin
## updateing urls here will not trigger autoprint on refresh of the home page
        #######rmakes sure that label wont be generated on the reload
    if Url.find_by_account_number(@accountNumber).nil?
        #if is URLs is nil then create a new entry for that account
        @newURLs = Url.create :account_number => @accountNumber, :urls => @labelsArray2
        @newURLs.save
        
    else
        #if urls account already exist update with the latest urls
        @newURLs = Url.find_by_account_number(@accountNumber)
        @newURLs.update(urls: @labelsArray2)
        ##@newURLs = Url.create :account_number => @accountNumber, :urls => @labelsArray2
        ##@newURLs.save
        
    end 
=end

=begin
                    arrayCounter = 0
                while arrayCounter < labelsArray.length do
                    redirect_to labelsArray[arrayCounter]
                    arrayCounter = arrayCounter +1
                end   
=end

=begin
                
                ##################
            else
                @debug11 = true
                @print = false
                
                
            
            end
                 
         @debug12 = true      
        ## updateing urls here will not trigger autoprint on refresh of the home page
        #######rmakes sure that label wont be generated on the reload
=begin        
    if Url.find_by_account_number(@accountNumber).nil?
        #if is URLs is nil then create a new entry for that account
        @newURLs = Url.create :account_number => @accountNumber, :urls => @labelsArray2
        @newURLs.save
        
    else
        #if urls account already exist update with the latest urls
        @newURLs = Url.find_by_account_number(@accountNumber)
        @newURLs.update(urls: @labelsArray2)
        
    end  
=end


=begin
        end
            end
            
            
            

#IF ON DEPLOYMENT LOCAL----------------------------------------------------
            else
                @debug4 = true
                #get the 1st and the only file location where the file is stored
                @csvFileLocationOpen = open('https://api-to-labels-base-vadimmalakhovski.c9users.io/uploads/resume/attachment/1/OurFormatTest.csv')
                #open each line and save it to a variable
                open('OurFormatTest.csv', 'wb') do |file|
                    file << open('https://api-to-labels-base-vadimmalakhovski.c9users.io/uploads/resume/attachment/1/OurFormatTest.csv').read
                    #Resume.last.attachment.to_s
                    @file5 = file
                end
                 #read that variable
                 @csvRead = CSV.read(@file5)
                 
                 #read ech column and save it to a variable
                CSV.foreach(@file5) do |row1|
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
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                            
        @debug6 = true

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
          
=begin          
        ##need to get the prin value from cookies to generate labels onclick.
        @debug8 = true
        
        @print = cookies[:print]
        unless @print.nil?
            if @print == 'true'
                @print = true
               
        
                @debug9 = true
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
                
                                  
                  #user_input_mapping = change all to integers
                
                  
                 
                xmlPayloadAuthorised = 
                '<?xml version="1.0" encoding="iso-8859-1"?>
                <PreAdvice>
                    <Consignment>
                        <RecordID>'+ @A1 +  '</RecordID>
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
                            <PostCode>'+@H8 +'</PostCode>
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
                            <PostCode>'+@H8 +'</PostCode>
                            <CountryCode>>'+@I9 +'</CountryCode>
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
                ###@labelsArrayDB = @labelsArrayDB +" "+ @labelURI
                ##@labelsArrayDB =  @labelURI +'~'+ @labelURI
                 ### @labelsArrayDB = @labelsArray2.map(&:inspect).join('') 
                         ## updateing urls here will not trigger autoprint on refresh of the home page
=begin                         
        #######rmakes sure that label wont be generated on the reload
    if Url.find_by_account_number(@accountNumber).nil?
        #if is URLs is nil then create a new entry for that account
        @newURLs = Url.create :account_number => @accountNumber, :urls => @labelsArray2
        @newURLs.save
        
    else
        #if urls account already exist update with the latest urls
        @newURLs = Url.find_by_account_number(@accountNumber)
        @newURLs.update(urls: @labelsArray2)
        
    end 
=end  

=begin
            
                
                #######cookies[:cookeslabelsArray2] = cookies[:cookeslabelsArray2] +'~'+ @labelURI
                @debug10 = true
                
=begin
## updateing urls here will not trigger autoprint on refresh of the home page
        #######rmakes sure that label wont be generated on the reload
    if Url.find_by_account_number(@accountNumber).nil?
        #if is URLs is nil then create a new entry for that account
        @newURLs = Url.create :account_number => @accountNumber, :urls => @labelsArray2
        @newURLs.save
        
    else
        #if urls account already exist update with the latest urls
        @newURLs = Url.find_by_account_number(@accountNumber)
        @newURLs.update(urls: @labelsArray2)
        ##@newURLs = Url.create :account_number => @accountNumber, :urls => @labelsArray2
        ##@newURLs.save
        
    end 
=end

=begin
                    arrayCounter = 0
                while arrayCounter < labelsArray.length do
                    redirect_to labelsArray[arrayCounter]
                    arrayCounter = arrayCounter +1
                end   
=end
                
               ##################
=begin               
            else
                @debug11 = true
                @print = false
                
                
            
            end
                 
         @debug12 = true      

      
        end
        
        
        
        
        
        
        
        
                end
            end
                  
         
            
        
##IF on FTP DEV + DEPL all is ONE------------------------------------------------------------------------------------------------------        
        else
            @debu5g = true
            
            @csvFileLocation =  './FromFTP'
            customers = CSV.read(@csvFileLocation.chomp("/*"))
            
            CSV.foreach(@csvFileLocation.chomp("/*")) do |row1|
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
            end
        end
        
        
#__________________________________________________        
#back to the universal code for all the ifs        















        
        ###############################needed
        cookies[:print] = "false" 
         
        @debug13 = true
        
=end         

    

    
    

    
        
 
    end   
  end
end
