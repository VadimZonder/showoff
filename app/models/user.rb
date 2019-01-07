class User < ApplicationRecord
  has_one :resume
  #has many
    
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable,  :validatable
end
