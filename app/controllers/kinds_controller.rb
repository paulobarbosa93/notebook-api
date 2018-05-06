class KindsController < ApplicationController
  # TOKEN = "secret"

  # include ActionController::HttpAuthentication::Basic::ControllerMethods
  # http_basic_authenticate_with name: "paulo", password: "secret"

  # include ActionController::HttpAuthentication::Token::ControllerMethods

  # before_action :authenticate
  before_action :authenticate_user!
  before_action :set_kind, only: [:show, :update, :destroy]


  # GET /kinds
  def index
    @kinds = Kind.all

    render json: @kinds
  end

  # GET /kinds/1
  def show
    render json: @kind
  end

  # POST /kinds
  def create
    @kind = Kind.new(kind_params)

    if @kind.save
      render json: @kind, status: :created, location: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /kinds/1
  def update
    if @kind.update(kind_params)
      render json: @kind
    else
      render json: @kind.errors, status: :unprocessable_entity
    end
  end

  # DELETE /kinds/1
  def destroy
    @kind.destroy
  end

  private

    # def authenticate
    #   authenticate_or_request_with_http_token do |token, options|
    #     hmac_secret = 'my$ecretK3y'
    #     JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
    #     # Compare the tokens in a time-constant manner, to mitigate
    #     # timing attacks.
    #     # ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
    #   end
    # end

    def set_kind
      if params[:contact_id]
        @kind = Contact.find(params[:contact_id]).kind
        return @kind
      end

      @kind = Kind.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def kind_params
      params.require(:kind).permit(:description, contacts_attributes: %i[id name email birthdate])
    end
end
