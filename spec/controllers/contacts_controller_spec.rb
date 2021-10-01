require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  describe 'GET #index' do
    let(:my_contacts){Contact.create(id: 1, first_name: 'Bruce', last_name: 'Dickinson', email: 'iron@maiden.com', phone: '666', created_at: Time.now.utc, updated_at: Time.now.utc)}

    before do
      Contact.create(first_name: 'Bruce', last_name: 'Dickinson', email: 'iron@maiden.com', phone: '666')
    end
    it 'should return successful response' do
      request.accept = 'application/json'
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with good email' do
      it 'should return successful response' do
        request.accept = 'application/json'
        post :create, contact: {first_name: 'Bruce', last_name: 'Dickinson', email: 'iron@maiden.com', phone: '666'}

        expect(response).to have_http_status(:success)
      end
    end

    context 'with used email' do
      before do
        Contact.create(first_name: 'Bruce', last_name: 'Dickinson', email: 'iron@maiden.com', phone: '666')
      end
      it 'should return successful response' do
        request.accept = 'application/json'
        post :create, contact: {first_name: 'Steve', last_name: 'Harris', email: 'iron@maiden.com', phone: '666'}

        expect(response.response_code).to be(422)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with good data' do
      before do
        @contact = Contact.create(first_name: 'Bruce', last_name: 'Dickinson', email: 'iron@maiden.com', phone: '666')
      end
      it 'updates the wallet and redirects' do
        patch :update, id: @contact.id, contact: {first_name: 'Daniel', last_name: @contact.last_name, email: @contact.email, phone: @contact.phone}
        expect(response).to redirect_to(@contact)
      end
    end
  end
end
