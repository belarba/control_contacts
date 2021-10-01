require 'rails_helper'

describe 'Contact' do
  it 'valid with First Name, Last Name, Email and Phone' do
    contact = Contact.new(first_name: 'Santa',
                          last_name: 'Claus',
                          email: 'xmas@hohoho.com',
                          phone: '123456')

    expect(contact).to be_valid
  end

  it 'invalid without First Name' do
    contact = Contact.new(first_name: nil)
    contact.valid?
    expect(contact.errors[:first_name]).to include("can't be blank")
  end

  it 'invalid with if email already used' do
    contact = Contact.create(first_name: 'Steve',
                             last_name: 'Harris',
                             email: 'contato@ironmaiden.com',
                             phone: '666')

    contact = Contact.new(first_name: 'Bruce',
                          last_name: 'Dickinson',
                          email: 'contato@ironmaiden.com',
                          phone: '666')

    contact.valid?
    expect(contact.errors[:email]).to include('has already been taken')
  end
end
