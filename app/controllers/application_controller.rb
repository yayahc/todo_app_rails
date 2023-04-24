class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :success

    helper_method :current_user

    def require_current_user
        if current_user.nil?
            redirect_to '/register'
        end
    end

    def current_user
        if session[:user_id]            
            User.find(session[:user_id])
        end
    end
end