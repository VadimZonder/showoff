class WelcomeController < ApplicationController

    
    # GET /welcome
  def index
    ##Development or Deployment____________
    @url =  request.original_url
    if @url.include? 'c9users.io' 
        @deployment = false
    else
        @deployment = true
        
    end  
    require "open-uri"
    require 'rest-client'
    require 'json'
    
    ###chnange whne recieve working credentials
    @client_id= "277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe"
    @client_secret = "d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352"
    @access_token =  cookies[:access_token]
    #will cause an error if access_token is nil
    if !@access_token.nil?
        @authorization = "Bearer "+@access_token
    end

   @allWidgetsUrl = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/1/widgets?"+
   "client_id="+@client_id+
   "&client_secret="+@client_secret
    
    

 
    ##Autorize call_____________________________________________________________ BEGIN
#__________WORKING CONTROL___ 
=begin
@email= current_user.email
@user = "3767L3"
@pass = "F3NhbBvHZ7"
@url = 'https://papi.dpd.ie/common/api/authorize'
     xmlPayloadAuthoriseControl = 
                '{"User":'+@user+', 
                "Password":'+@pass+', 
                "Type":"CUST"}'

                
    result = RestClient.post(@url, #xmlPayloadAuthorise,:content_type => 'application/xml') 
  xmlPayloadAuthoriseControl, 
  {
  content_type: 'application/json',
    accept: 'application/json', 
    authorization: 'Basic VG90YWxJbXBvcnRTb2x1dGlvbnM6Qm1DNWd4bWVOdw=='
  }
) 
        
    #display auth message   
    @res = result
    @jsonParse = JSON.parse @res
    @accessToken = @jsonParse["AccessToken"]
    @refreshToken = @jsonParse["RefreshToken"]
    @userId = @jsonParse["UserId"]

=end
#__________WORKING CONTROL___ END

                
##Autorize call_____________________________________________________________ BEGIN
#__________ActualL___ 
=begin
    @grant_type = "password"
    @client_id = "277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe"
    @client_secret = "d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352"
    @user = "michael@showoff.ie"
    @pass = "password"
    @urlAuth = 'https://showoff-rails-react-production.herokuapp.com/oauth/token'
    

 payload =  
 '{
 
 "grant_type":'+@grant_type +',
 "client_id":'+@client_id +',
 "client_secret":'+@client_secret +',
 "username":'+@user +',
 "password":'+@pass +'
     
 }'
    result = RestClient.post(@urlAuth,
    payload, 
  {
    content_type: 'application/json'
   # accept: 'application/json'

  }
) 
=end


#delete
@authResponceSample = 
'
{
  "code": 0,
  "message": "Success",
  "data": {
    "token": {
      "access_token": "479c8407d69e5bbc5079936e13314b50971d7028a11994a3be83c8f89027835f",
      "token_type": "Bearer",
      "expires_in": 2592000,
      "refresh_token": "6399bbcf509079f7565a30d06de245e5414e554d74328181f7fe4313bb256c29",
      "scope": "basic",
      "created_at": 1549368326
    }
  }
}
'

#display auth message
   ### @res = result
   ### @jsonParse = JSON.parse @res
    @jsonParse = JSON.parse @authResponceSample
    @accessToken = @jsonParse["data"]["token"]["access_token"]
    @refreshToken = @jsonParse["data"]["token"]["refresh_token"]
    #@userId = @jsonParse["UserId"]
#__________ACTUAL CONTROL___ END

         ###@res = result
 #__________________________________________________________________
                
###All Visible Widets______________________________________________________________________________


@urlSerachTermVisible ='https://showoff-rails-react-production.herokuapp.com/api/v1/users/1/widgets?
client_id='+@client_id+'&client_secret='+@client_secret+'&term=visible'

@urlAllWidgetsVisible ='https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?
client_id='+@client_id+'&client_secret='+@client_secret+'&term=visible'

  @allWidgetsResponceSample = RestClient.get(@urlAllWidgetsVisible,
  {
  content_type: 'application/json',
    authorization: @authorization
  }
) 
        


=begin
    result = RestClient.get(@urlSerachTermVisible,
  {
    content_type: 'application/json',
    authorization: @authorization
  }
) 
=end


=begin

 payload =  
 '{
 
 "grant_type":'+@grant_type +',
 "client_id":'+@client_id +',
 "client_secret":'+@client_secret +',
 "username":'+@user +',
 "password":'+@pass +'
     
 }'
    result = RestClient.post(@urlAuth,
    payload, 
  {
    content_type: 'application/json'
   # accept: 'application/json'

  }
) 
=end


#display auth message
   ### @res = result
   ### @jsonParse = JSON.parse @res
   @objectCounter =1
    @jsonParseAllWidgets = JSON.parse (@allWidgetsResponceSample) ##change to the actual json string
   # @nameResulsArray = @jsonParseAllWidgets["data"]["widgets"][0]["name"]
   arrayCount = @jsonParseAllWidgets["data"]["widgets"].count-1
  #@nameResulsArray = @jsonParseAllWidgets["data"]["widgets"][1]["name"]
  @nameResulsArray = []
  @descriptionResulsArray = []
  @fNameResulsArray = []
  @lNameResulsArray = []
   while arrayCount != -1 do
       
       @nameResulsArray =  @nameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["name"])
     
       @nameResulsArray = @nameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["description"])
       @nameResulsArray =  @nameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["user"]["first_name"])
       @nameResulsArray =  @nameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["user"]["last_name"])
=begin         
       @descriptionResulsArray = @descriptionResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["description"])
       @fNameResulsArray =  @fNameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["user"]["first_name"])
       @lNameResulsArray =  @lNameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["user"]["last_name"])
=end       
       arrayCount = arrayCount -1
   end
   
   
   # @jsonParseAllWidgets.each_key {|k| @keys = k if k == "data"}
  #@keys = @jsonParseAllWidgets["data"].values
  #@jsonParseAllWidgets["data"]["widgets"].each_value {|v| @keys = v if v == "3"}#
   
   ## @jsonParseAllWidgets["data"]["widgets"].each do |object|
      
    ##    @nameResulsArray = object["data"]["widgets"][arrayCount-1]["name"]
    ##    arrayCount= arrayCount-1
  # This is a hash object so now create a new one.
 # @widgetsResultsAllArray = object[1]["data"]["widgets"]["name"]#@widgetsResultsAllArray.push(object)

##end

#@duration_in_seconds = @jsonParseAllWidgets["data"]["widgets"][0]["name"]#["value"]#["routes"][0]["legs"][0]["duration"]["value"]
    ##@refreshToken = @jsonParseAllWidgets["data"]["token"]["refresh_token"]
    #@userId = @jsonParse["UserId"]
       
   
    #__________________________________________________________________
       

  #__________________________________________User Index Me____________________________________   
   def usrIndexMe
       #__________ActualL___
=begin      
@urlSerachMe ='https://showoff-rails-react-production.herokuapp.com/api/v1/users/1/widgets?client_id=
'+@client_id+'&client_secret='+@client_secret+''



    result = RestClient.get(@urlSerachMe,
  {
    content_type: 'application/json',
    authorization: @authorization
  }
) 
=end
#delete
@responceSample ='{
  "code": 0,
  "message": "Success",
  "data": {
    "widgets": [
      {
        "id": 3,
        "name": "A Hidden Widget",
        "description": "Widget 1",
        "kind": "hidden",
        "user": {
          "id": 1,
          "name": "A User",
          "images": {
            "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/small/961-200.png?1549366177",
            "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/medium/961-200.png?1549366177",
            "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/large/961-200.png?1549366177",
            "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/original/961-200.png?1549366177"
          },
          "first_name": "A",
          "last_name": "User",
          "date_of_birth": null,
          "email": "michael@showoff.ie",
          "active": true
        },
        "owner": true
      },
      {
        "id": 4,
        "name": "A Visible Widget",
        "description": "Widget 1",
        "kind": "visible",
        "user": {
          "id": 1,
          "name": "A User",
          "images": {
            "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/small/961-200.png?1549366177",
            "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/medium/961-200.png?1549366177",
            "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/large/961-200.png?1549366177",
            "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/original/961-200.png?1549366177"
          },
          "first_name": "A",
          "last_name": "User",
          "date_of_birth": null,
          "email": "michael@showoff.ie",
          "active": true
        },
        "owner": true
      }
    ]
  }
}'

#display auth message
   ### @res = result
   ### @jsonParse = JSON.parse @res
    @jsonParseResponce  = JSON.parse (@responceSample) ##change to the actual json string
    #@nameResulsArray = @jsonParseResponce["data"]["widgets"][0]["name"]
   
   end
#__________________________________________User Index Me END____________________________________  

#__________________________________________User Index Me + Term Begin____________________________________   
   def usrIndexMeTerm
       #__________ActualL___
=begin       
@urlSerachTermVisible ='https://showoff-rails-react-production.herokuapp.com/api/v1/users/1/widgets?client_id='+@client_id+'&client_secret='+@client_secret+'&term=visible'


    result = RestClient.get(@urlSerachTermVisible,
  {
    content_type: 'application/json',
    authorization: @authorization
  }
) 
=end


#display auth message
    @res = result
    @jsonParse = JSON.parse @res
    #@nameResulsArray = @jsonParseResponce["data"]["widgets"][0]["name"]
   
   end
#__________________________________________User Index Me Term END____________________________________  

#__________________________________________User Create Begin____________________________________   

   def usrCreate
       
 require 'csv' 
    require 'net/ftp'
    require 'tempfile'
    require "open-uri"
    require 'rest-client'
    require 'smarter_csv'
    require 'json'
    
    
    @client_id = "277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe"
    @client_secret = "d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352"
    @authorization = "Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024"
    
@url ='https://showoff-rails-react-production.herokuapp.com/api/v1/users'



@fName = "Vadim"
@lName = "Mal"
@pass = "password"
@email = "michael+52@showoff.ie"

=begin
  xmlPayloadAuthoriseControl = 
                '{"User":'+@user+', 
                "Password":'+@pass+', 
                "Type":"CUST"}'
=end

 body =
 '{

	"client_id": "277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe",
	"client_secret": "d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352",
	"user": {
		"first_name": "'+@fName+'",
		"last_name": "'+@lName+'",
		"password": "'+@pass+'",
			"email": "'+@email+'",
		"image_url": "https://static.thenounproject.com/png/961-200.png"
	}
}'
 
                
  #  result = RestClient.post(@url, body,:content_type => 'application/json') 
  #xmlPayloadAuthorise,:content_type => 'application/xml') 




    result = RestClient.post(@url, body, 
  {
  content_type: 'application/json'
  }
)



#display auth message
    @result = result
    @jsonParse = JSON.parse @result
    #@nameResulsArray = @jsonParseResponce["data"]["widgets"][0]["name"]

   end
 
#__________________________________________User Create END____________________________________  

    
    

##_______________________________________________________________________________________________________IF SIGNED IN    
   
  end

#__________________________________________Revoke____________________________________   
   def authenticationRevoke
#__________________________________________Revoke____________________________________   
=begin
    
    @url = 'https://showoff-rails-react-production.herokuapp.com/oauth/revoke'
    @bearer 'b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024'
    

 payload =  
 '{
 
"token":'+@bearer+'
     
 }'
    result = RestClient.post(@url,
    payload, 
  {
    content_type: 'application/json'
    authorization: @bearer
   # accept: 'application/json'

  }
) 
=end
#__________ACTUAL CONTROL___ END 
        
    
    #display revoke message  
    @res = result  
       
       
   end 
   
#__________________________________________Refresh____________________________________   
   def authenticationRefresh
#__________________________________________Refresh____________________________________    
=begin
    
    @client_id = "277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe"
    @client_secret = "d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352"
    @url = 'https://showoff-rails-react-production.herokuapp.com/oauth/token'
    

 payload =  
 '{
 
    "grant_type": "refresh_token",
    "refresh_token":'+@refresh_token+'',
     "client_id":'+@client_id +',
     "client_secret":'+@client_secret +',
     
 }'
    result = RestClient.post(@url,
    payload, 
  {
    content_type: 'application/json'
    authorization: @bearer
   # accept: 'application/json'

  }
) 
=end
#__________ACTUAL CONTROL___ END 
        
    
    #display revoke message  
    @res = result  
       
       
   end    

end
