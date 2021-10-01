require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  describe "GET #index" do
    let(:my_contacts){Contact.create(id: 1, first_name: 'Bruce', last_name: 'Dickinson', email: 'iron@maiden.com', phone: '666', created_at: Time.now.utc, updated_at: Time.now.utc)}

    before do
      Contact.create(first_name: 'Bruce', last_name: 'Dickinson', email: 'iron@maiden.com', phone: '666')
    end
    it "should return successful response" do
      request.accept = "application/json"
      get :index

      expect(assigns(:contacts)).to eq([my_contacts])
    end
  end

end
