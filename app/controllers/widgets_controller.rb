class WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]

  # GET /widgets
  # GET /widgets.json
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


  # https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/widgets?
   @myWidgetsUrl = 'https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?
client_id='+@client_id+'&client_secret='+@client_secret
   
    @myWidgetsResponceSample = RestClient.get(@myWidgetsUrl,
  {
  content_type: 'application/json',
    authorization: @authorization
  }
)
  
#display auth message
   ### @res = result
   ### @jsonParse = JSON.parse @res
   @objectCounter =1
    @jsonParseAllWidgets = JSON.parse (@myWidgetsResponceSample) ##change to the actual json string
   # @nameResulsArray = @jsonParseAllWidgets["data"]["widgets"][0]["name"]
   arrayCount = @jsonParseAllWidgets["data"]["widgets"].count-1
  #@nameResulsArray = @jsonParseAllWidgets["data"]["widgets"][1]["name"]
  @nameResulsArray = []
  @descriptionResulsArray = []
  @fNameResulsArray = []
  @lNameResulsArray = []
   while arrayCount != -1 do
        @nameResulsArray =  @nameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["id"])
       @nameResulsArray =  @nameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["name"])
       @nameResulsArray = @nameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["description"])
       @nameResulsArray =  @nameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["kind"])
       @nameResulsArray =  @nameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["user"]["images"]["small_url"])
=begin         
       @descriptionResulsArray = @descriptionResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["description"])
       @fNameResulsArray =  @fNameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["user"]["first_name"])
       @lNameResulsArray =  @lNameResulsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["user"]["last_name"])
=end       
       arrayCount = arrayCount - 1
   end
  
   

  end

  # GET /widgets/1
  # GET /widgets/1.json
  def show
  end

  # GET /widgets/new
  def new

  end

  # GET /widgets/1/edit
  def edit
  end

  # POST /widgets
  # POST /widgets.json
  def create
   
  end

  # PATCH/PUT /widgets/1
  # PATCH/PUT /widgets/1.json
  def update
   
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.json
  def destroy
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_widget
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def widget_params
      
    end
end
