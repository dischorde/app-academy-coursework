# ROUTES

#   Prefix Verb   URI Pattern             Controller#Action
#       users POST   /users(.:format)        users#create
#    new_user GET    /users/new(.:format)    users#new
#        user GET    /users/:id(.:format)    users#show
#    sessions POST   /sessions(.:format)     sessions#create
# new_session GET    /sessions/new(.:format) sessions#new
#     session DELETE /sessions/:id(.:format) sessions#destroy

class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(session_params[:email], session_params[:password])
    if user
      log_in_user!(user)
      redirect_to user_url(user.id)
    else
      flash.now[:errors] = ["Error logging in."]
      render :new
    end
  end

  def new
  end

  def destroy
    log_out
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
