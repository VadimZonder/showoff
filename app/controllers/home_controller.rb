class HomeController < ApplicationController
    before_action :authenticate_user!
    def index
        @email= current_user.email
        @accountNumber = @email[0, 6]  
    
    
        @home = 'another'
        
        
        
    @resumes = Resume.all
    @resume = Resume.new

    @isFtp= IsFTp.last.isFTP
    
    @isFTP2 = IsFTp.find_by_account_number(@accountNumber)
  
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
  ###if user does not exist get accoun number from the signup emails tring
  ### or created whn signup button is clicked
  ###first get the data passed from sign up
 ### @accountNumberDB = User.find_by_account_number(@accountNumber)
  if user_signed_in? 
    @isFTP2 = IsFTp.find_by_account_number(@accountNumber)
   isFTP = cookies[:cl]
   @isFTPC = IsFTp.find_by_account_number(@accountNumber)
    unless isFTP.nil?
        unless @isFTP2.nil?

  
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
    
#Onclick generae labels
@accountNumber = @email[0, 6] 
@password = @email[6, 10] 
@token = @email[16..-8] 



require 'csv' 
require 'net/ftp'
require 'tempfile'
require "open-uri"

##Development or Deployment
@url =  request.original_url
if @url.include? 'c9users.io' 
    @deployment = false
else
    @deployment = true
end

#############@isFTP2 = @isFTP2.isFTP

         
        
isFtp = IsFTp.last ############ORIGINAL LINE    isFtp = IsFTp.last
        

#Read from FTP
ftp = Net::FTP::new("ftp.dpd.ie")
ftp.login("3L4", "3l4123")
ftp.chdir("/users/3L4/WebAppImport")

  files = ftp.list

  ftp.passive = true
  ##file is downloaded from ftp to a local folder name "FromFTP"
   ftp.getbinaryfile("OurFormatEmailVadimTest.csv", "FromFTP")




#tgz = ftp.list("ruby-*.tar.gz").sort.last
#print "the latest version is ", tgz, "\n"
#ftp.getbinaryfile(tgz, tgz)
ftp.close

      
  
# If on LOCAL_____________________________________________________________________________________________________%>
if    isFtp.isFTP== false                    ############ORIGINAL LINE  isFtp.isFTP == false %>      
 #if on DEVELOPMENT LOCAL-----------------------------------------------
          if @deployment == false
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


#@csvArray2.push(@csvColumn3 )









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
                   
                   
                   
 #user_input_mapping = change all to integers
  ##########################ORIGINAL
=begin  
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
=end

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


 print = cookies[:print]
 unless print.nil?
    if print == 'true'
       @print = true
       
       require 'open-uri'
require 'rest-client'

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
            <BusinessName>'+@C3  +'</BusinessName>
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


=begin
    arrayCounter = 0
while arrayCounter < labelsArray.length do
    redirect_to labelsArray[arrayCounter]
    arrayCounter = arrayCounter +1
end   
=end

##################
    else
        
        @print = false
    
    end
 
       
########redirect_to @labelURI

################redirect_to @labelURI
    ####rmakes sure that label wont be generated on the reload


 end

end
###############################needed
 cookies[:print] = "false" 
 
 
 
 
 
#IF ON DEPLOYMENT LOCAL----------------------------------------------------
          else
              ###not a problem -  there are less Resume entries on deployment than development but the ids are the same
              @csvFileLocationOpen = open('https://label-gen-test.herokuapp.com/uploads/resume/attachment/1/OurFormatTest.csv')
                  open('OurFormatTest.csv', 'wb') do |file|
                   file << open('https://label-gen-test.herokuapp.com/uploads/resume/attachment/1/OurFormatTest.csv').read
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
end
              
          end
          
 
    

 ##IF on FTP DEV + DEPL all is ONE------------------------------------------------------------------------------------------------------        
          else
           
           

           
           
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
          







     
     


#Mappings
#all the colums
@mappings = Mapping.find_by_account_number(@accountNumber)

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


  end
  
      
  end   

end
