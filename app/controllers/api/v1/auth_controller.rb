class Api::V1::AuthController < ApplicationController

  def login
   begin
     user = login_user(params[:username], params[:password])
     render json: {
       id: user.id,
       username: user.username,
       token: encode_token({'user_id': user.id})
     }
   rescue AuthError => e
     render json: { error: e.msg }, status: 401
   end
  end

  def currentUser
    user = current_user
   if user
     render json: { id: user.id, username: user.username }
   else
     render json: nil
   end
  end

def signup
  avatars = [
    "https://react.semantic-ui.com/assets/images/avatar/small/steve.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/ade.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/chris.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/christian.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/daniel.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/elliot.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/helen.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/jenny.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/joe.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/large/kristy.png",
    "https://react.semantic-ui.com/assets/images/avatar/small/justen.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/laura.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/lena.png",
    "https://react.semantic-ui.com/assets/images/avatar/small/lindsay.png",
    "https://react.semantic-ui.com/assets/images/avatar/small/matthew.png",
    "https://react.semantic-ui.com/assets/images/avatar/small/mark.png",
    "https://react.semantic-ui.com/assets/images/avatar/small/molly.png",
    "https://react.semantic-ui.com/assets/images/avatar/small/nan.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/large/patrick.png",
    "https://react.semantic-ui.com/assets/images/avatar/small/rachel.png",
    "https://react.semantic-ui.com/assets/images/avatar/small/tom.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/veronika.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/stevie.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/steve.jpg",
    "https://react.semantic-ui.com/assets/images/avatar/small/zoe.jpg"
  ]
  user = User.new(user_params)
  user[:avatar] = avatars.sample
  if user.save
    begin
      user = login_user(user_params[:username], user_params[:password])
      render json: {
        id: user.id,
        username: user.username,
        token: encode_token({'user_id': user.id})
      }
    rescue AuthError => e
      render json: { error: "Invalid Passwords"}, status: 401
    end
  else
    render json: { error: "Need all info correct to sign up" }
  end

end

private


def user_params
  params.require(:user).permit(:username, :password, :password_confirmation)
end


end
