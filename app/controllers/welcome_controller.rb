class WelcomeController < ApplicationController

  # GET /welcome
  def index
     @bulletin      = Bulletin.new
    @bulletin_list = Bulletin.order(created_at: :desc).all
    
 ###############  @bulletin_last = Bulletin.last.created_at


#def switch 
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
end
