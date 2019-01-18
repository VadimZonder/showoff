class WelcomeController < ApplicationController
    before_action :authenticate_user!
    
    def debug
        @debug = 'works'
    end

# GET /welcome
  def index
@debug = 'works'
   
  end
  
  
end
