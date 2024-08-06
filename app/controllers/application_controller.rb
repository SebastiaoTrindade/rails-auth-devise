class ApplicationController < ActionController::Base
    include Pundit;

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def user_not_authorized
        redirect_to(request.referrer || root_path, alert: "Not authorized")
    end
end
