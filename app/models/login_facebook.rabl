OMNIAUTH TUTORIAL FACEBOOK

# tutorial de referencia:
# http://evanamccullough.com/2015/01/rails-4-omniauth-using-devise-twitter-facebook-tutorial/
​
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
​
# Creamos una nueva tabla llamada identities. En esta tabla se guardaran las diferentes formas en las q se puede llevar un usuario a la misma cuenta
# complementamos las formas de auntentificación.
# al crear esta tabla nos permite tener varias formas de autentificación simultaneamente
​
rails g model identity user:references provider:string uid:string
#provider: quien provee el servicio (en este caso facebook o twitter)
#uid: código q entregan face, twitter o google q identifica al usuario en el sistema
​
# en identuty.rb
class Identity < ActiveRecord::Base
  belongs_to :user
​
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, scope: :provider
​
  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end
end
​
# en app/config/initializers/devise.rb
​
  config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
    scope: 'public_profile,email', display: 'popup', secure_image_url: true,
    image_size: {width: 600, height: 600}
​
  config.omniauth :twitter, ENV['TWITTER_APP_ID'], ENV['TWITTER_APP_SECRECT'],
    secure_image_url: true, image_size: 'original'
​
# en config/routes.rb 
devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' } # decimos q agregaremos un nuevo controlador para devise
​
# Le decimos a nuestro usuario q tendrá nuevas formas de authentificación : :omniauthable, omniauth_providers:
# en user.rb
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :timeoutable, :omniauthable, omniauth_providers: [:facebook, :twitter]
​
## agregamos también en user.rb
has_many :identities, dependent: :destroy
​
rails g controller omniauth_callbacks # creamos el controlador
​
# Luego en omniauth_callback_controller.rb
​
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(env["omniauth.auth"], current_user)
​
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    }
  end
​
  [:twitter, :facebook].each do |provider|
    provides_callback_for provider
  end
​
end
​
​
# luego en user.rb
​
  # Omniauth
  def self.find_for_oauth(auth, signed_in_resource = nil)
​
    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)
​
    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user
​
    # Create the user if needed
    if user.nil?
​
      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(email: email).first if email
​
      # Create the user if it's a new registration
      if user.nil?
        if identity.provider == "twitter"
            user = User.new(
              name: auth.info.name,
              email: email ? email : "update@me.com",
              remote_avatar_url: auth.info.image,
              password: Devise.friendly_token[0,20]
            )
          else
            user = User.new(
              name: auth.info.name,
              email: email ? email : "update@me.com",
              remote_avatar_url: auth.info.image,
              password: Devise.friendly_token[0,20]
            )
          end
        user.save!
      end
    end
​
    # Associate the identity with the user if needed
    unless identity.user == user
      identity.user = user
      identity.save!
    end
    user
  end
​
​
  ## Para loguearse con facebook es necesario crear una app de facebook
  # nos vamos a https://developers.facebook.com/
  # En: my app -> add a new app -> sitio web  # creamos la app
  # En site url debemos poner el dominio de nuestro sitio web, como estamos en desarrollo es: http://localhost:3000/
  # Si quisieramos en producción, deberiamos crear una nueva aplicación
  # luego en my app-> nombre_de_nuestra_app -> show y tomamos el app id y app secret y los pegamos en nuestro .env
  # Finalmente en devise.rb deben estar las claves de nuestro .env (como editamos archivos de configuración, reiniciamos servidor)
​
​
​