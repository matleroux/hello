require_dependency "hello/application_controller"

module Hello
  class ConfirmEmailsController < ApplicationController

    dont_kick_people

    before_actions do
      all { destroy_and_clear_hello_access_token }
      only(:confirm) { @credential = Credential.where(id: params[:id]).first }
    end

    # GET /hello/emails/1/confirm/:token
    def confirm
      entity = ConfirmEmailEntity.new(@credential)

      if entity.confirm_with_token(params[:token])
        _sign_in
        flash[:notice] = entity.success_message
        redirect_to emails_path
      else
        flash[:alert] = entity.alert_message
        redirect_to expired_token_emails_path
      end
    end

    # GET /hello/emails/1/expired_token
    def expired_token
    end

    private

    def _sign_in
      # In RSpec and Capybara (Rails 4.2):
      # when the user gets access, the session of the next request will assume the values it had before,
      # if before you were a guest, you will be redirected as a user, but the following request will be as a guest again
      # if before you were a user1, you will be redirected as a user2, but the following request will be as a user1 again
      access_token = create_hello_access_token(@credential.user, 1.hour.from_now)
    end

  end
end
