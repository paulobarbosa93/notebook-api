module V1
  class PhonesController < ApplicationController
    before_action :set_contact

    # DELETE /contacts/:contact_id/address
    def destroy
      phone = Phone.find(phone_params[:id])
      phone.destroy
    end

    # POST /contacts/:contact_id/address
    def create
      @contact.phones << Phone.new(phone_params)

      if @contact.save
        render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # GET /contacts/:contact_id/address
    def show
      render json: @contact.phones
    end

    # PUT/PATCH /contacts/:contact_id/address
    def update
      phone = Phone.find(phone_params[:id])

      if phone.update(phone_params)
        render json: @contact.phones
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    private

    def phone_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

    def set_contact
      @contact = Contact.find(params[:contact_id])
    end
  end
end
