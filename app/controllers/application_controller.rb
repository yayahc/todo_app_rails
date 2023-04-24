class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :success

    helper_method :current_user

    def current_user
        if session[:user_id]            
            User.find(session[:user_id])
        end
    end
end