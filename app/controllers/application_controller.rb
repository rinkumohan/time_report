class ApplicationController < ActionController::Base
  
    before_action :authenticate_user!
    
    require 'will_paginate/array'
    
end
