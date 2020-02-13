class SessionsController < ApplicationController
    def new
    end
    def create
        user = User.find_by(email: params[:email])

        # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
        if user && user.authenticate(params[:password])
          log_in(user)
          redirect_to root_path
          # redirige où tu veux, avec un flash ou pas
      
        else
          flash.now[:danger] = 'Invalid email/password combination'
          redirect_to new_session_path
        end
    end
    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
end
