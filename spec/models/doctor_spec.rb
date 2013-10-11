require 'spec_helper'

describe Doctor do

  before do
    @doctor = Doctor.new(name: "Example User", email:"operez@iteso.mx",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @doctor }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should be_valid }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:admin) }
  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @doctor.save!
      @doctor.toggle!(:admin)
    end

    it { should be_admin }
  end
  it "should be valid" do
    expect(@doctor).to be_valid
  end
  describe "when name is not present" do
    before { @doctor.name = "" }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    before { @doctor.name = "" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @doctor.name = "a" * 51 }
    it { should_not be_valid }
  end


  describe "when password is not present" do
    before do
      @doctor = Doctor.new(name: "Example User", email:"operez@iteso.mx",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @doctor.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @doctor.password = @doctor.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @doctor.save }
    let(:found_doctor) { User.find_by(email: @doctor.email) }

    describe "with valid password" do
      it { should eq found_doctor.authenticate(@doctor.password) }
    end

    describe "with invalid password" do
      let(:doctor_for_invalid_password) { found_doctor.authenticate("invalid") }

      it { should_not eq doctor_for_invalid_password }
      specify { expect(doctor_for_invalid_password).to be_false }
    end
  end





end