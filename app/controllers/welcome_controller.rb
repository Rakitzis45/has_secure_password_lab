class WelcomeController < ApplicationController
    def home
        if logged_in? == false
            redirect_to '/login'
        end
    end
end
