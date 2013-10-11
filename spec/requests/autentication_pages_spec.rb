require 'spec_helper'

describe "Authentication" do

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:doctor) { FactoryGirl.create(:doctor) }
      before do
        fill_in "Email",    with: doctor.name.upcase
        fill_in "Password", with: doctor.password
        click_button "Sign in"
      end

      it { should have_title(doctor.name) }
      it { should have_link('Profile',     href: doctor_path(user)) }
      it { should have_link('Settings',    href: edit_doctor_path(doctor)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end


  end
describe "authorization" do

  describe "for non-signed-in doctors" do
    let(:doctor) { FactoryGirl.create(:doctor) }

    describe "when attempting to visit a protected page" do
      before do
        visit doctor_path(doctor)
        fill_in "Email",    with: doctor.email
        fill_in "Password", with: doctor.password
        click_button "Sign in"
      end


    end

    describe "in the doctor controller" do

      describe "visiting the edit page" do
        before { visit edit_doctor_path(doctor) }
        it { should have_title('Sign in') }
      end

      describe "submitting to the update action" do
        before { patch doctor_path(doctor) }
        specify { expect(response).to redirect_to(signin_path) }
      end

      describe "visiting the doctor index" do
        before { visit doctors_path }
        it { should have_title('Sign in') }
      end


    end



  end

  describe "as wrong user" do
    let(:doctor) { FactoryGirl.create(:doctor) }
    let(:wrong_doctor) { FactoryGirl.create(:doctor, email: "wrong@example.com") }
    before { sign_in doctor, no_capybara: true }

    describe "submitting a GET request to the Doctors#edit action" do
      before { get edit_doctor_path(wrong_doctor) }
      specify { expect(response.body).not_to match(full_title('Edit user')) }
      specify { expect(response).to redirect_to(root_url) }
    end

    describe "submitting a PATCH request to the Users#update action" do
      before { patch doctor_path(wrong_doctor) }
      specify { expect(response).to redirect_to(root_url) }
    end
  end
  describe "as non-admin user" do
    let(:doctor) { FactoryGirl.create(:doctor) }
    let(:non_admin) { FactoryGirl.create(:doctor) }

    before { sign_in non_admin, no_capybara: true }

    describe "submitting a DELETE request to the Doctors#destroy action" do
      before { delete doctor_path(doctor) }
      specify { expect(response).to redirect_to(root_url) }
    end
  end
end
end