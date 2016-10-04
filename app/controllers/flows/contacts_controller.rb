# frozen_string_literal: true
class Flows::ContactsController < ApplicationController
  def index
    @contacts = contacts
    @contact = current_user.contacts.build
  end

  def create
    contact = Contact.find_or_initialize_by(email: contact_params[:email])
    contact.name = contact_params[:name]

    if contact.save
      membership = current_user.memberships.build(contact_id: contact.id)
      return redirect_to flows_contacts_path, alert: 'Contact has already been added' unless membership.valid?
      membership.save
      redirect_to flows_contacts_path, notice: 'Contact has been added'
    else
      @contacts = contacts
      @contact = contact
      render :index
    end
  end

  def edit; end

  def destroy; end

  private

  def contacts
    @contacts = current_user.contacts.order(id: :asc)
  end

  def contact_params
    params.require(:contact).permit(:name, :email)
  end
end
