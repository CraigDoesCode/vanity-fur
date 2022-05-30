class ApplicationController < ActionController::Base
  before_Action :authenticate_user!
end
