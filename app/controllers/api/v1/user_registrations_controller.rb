module Api
  module V1
    class UserRegistrationsController < Devise::RegistrationsController
      skip_before_filter :verify_authenticity_token

      respond_to :json

      def create

        user = User.new(params[:user])
        if user.save
          render :json=> user.as_json(:private=>true), :status=>201
          return
        else
          warden.custom_failure!
          render :json=> user.errors, :status=>422
        end
      end
    end
  end
end