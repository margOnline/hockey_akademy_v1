require 'spec_helper'

describe User do
  before do
    @user = User.new(
      firstname: 'John', 
      lastname: 'Doe', 
      email:'test@gmail.com',
      password: "password",
      password_confirmation: "password"
    )
  end

  subject { @user }

  it { should respond_to(:firstname) }
  it { should respond_to(:lastname) }
  it { should respond_to(:email) }
  it { should respond_to(:dob) }
  it { should respond_to(:password_digest)}
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should be_valid }

  describe "when first name is not present" do
    before { @user.firstname = " " }
    it { should_not be_valid }
  end

  describe "when first name is too long" do
    before { @user.firstname = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @user.lastname = " " }
    it { should_not be_valid }
  end

  describe "when last name is too long" do
    before { @user.lastname = "z" * 51 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w(user@foo,COM user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+bax.com)
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be invalid" do
      addresses = %w(user@foo.COM A_US-ER@f.b.org frst.1st@foo.jp +b@vaz.cn)
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_email = @user.dup
      user_with_email.email = @user.email.upcase
      user_with_email.save
    end
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(
        firstname: 'John', 
        lastname: 'Doe', 
        email:'test@gmail.com',
        password: " ",
        password_confirmation: " "
      )
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match password_confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that is too short" do
    before { @user.password = @user.password_confirmation = "a" * 6 }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end 

    describe "with invalid password" do
      let(:user_with_invalid_password) { found_user.authenticate("invalid" ) }
      it { should_not eq user_with_invalid_password }
      specify { expect(user_with_invalid_password).to be_false }
    end
  end

end
