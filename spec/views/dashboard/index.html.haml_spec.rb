require 'rails_helper'

RSpec.describe "dashboard/index.html.haml", type: :view do
  #pending "add some examples to (or delete) #{__FILE__}

  describe 'Dashboard page' do
    before :each do
      visit '/'
    end

    describe 'with guest user' do
      it 'should have title' do
        expect(page).to have_title('Order test')
      end

      it 'should have content for sign_in and sign_up' do
        expect(page).to have_content('Sign up')
        expect(page).to have_content('Sign in')
      end
    end

  end
end