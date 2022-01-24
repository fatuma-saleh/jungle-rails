require "rails_helper"

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is a Valid user with a valid password and confirm_password fields " do
     
      newUser = User.new(
        first_name: 'Fatuma',
        last_name:  'Saleh',
        email: 'sfatex@gmail.com',
        password:'123456',
        password_confirmation:'123456'

        )
       
    expect(newUser).to be_valid
    end

    it "is an invalid user with the password and confirm_password fields not matching  " do
      
      newUser = User.new(
        first_name: 'Fatuma',
        last_name:  'Saleh',
        email: 'sfatex@gmail.com',
        password:'1234567',
        password_confirmation:'123456'
        )
       
    expect(newUser).to_not be_valid
    end

    it "is an invalid user with the password length less than 6 characters" do
      
      newUser = User.create(
        first_name: 'Fatuma',
        last_name:  'Saleh',
        email: 'sfatex@gmail.com',
        password:'1234',
        password_confirmation:'1234'
        )
    puts newUser.errors.full_messages   
    expect(newUser.errors.full_messages).to eq(["Password is too short (minimum is 6 characters)"]) 
    end
 
    it "is not a Valid user without a first_name " do
        newUser = User.new(
          first_name: nil,
          last_name:  'Saleh',
          email: 'sfatex@gmail.com',
          password:'1234567',
          password_confirmation:'1234567'
          )
         
      expect(newUser).to_not be_valid
      end
      
      it "is not a Valid user without a last_name " do
        newUser = User.new(
          first_name: 'Fatuma',
          last_name:  nil,
          email: 'sfatex@gmail.com',
          password:'1234567',
          password_confirmation:'1234567'
          )
         
      expect(newUser).to_not be_valid
      end  
    
      it "is not a Valid user without an email" do
        newUser = User.new(
          first_name: 'Fatuma',
          last_name:  'Saleh',
          email: nil,
          password:'1234567',
          password_confirmation:'1234567'
          )
         
      expect(newUser).to_not be_valid
      end  

      it "is not a Valid user if created with an email which exists(not case sensitive)" do
        newUser1 = User.create(
          first_name: 'Fatuma',
          last_name:  'Saleh',
          email: 'test@test.com',
          password:'1234567',
          password_confirmation:'1234567'
          )
         
          newUser2= User.create(
            first_name: 'Asu',
            last_name:  'Semir',
            email: 'TEST@TEST.COM',
            password:'1234567',
            password_confirmation:'1234567'
            )
      p newUser2
      expect(newUser2).to_not be_valid
      end   
    end
    describe '.authenticate_with_credentials' do
      it "authenticate a user with credentials" do
        newUser = User.create(
          first_name: 'Fatuma',
          last_name:  'Saleh',
          email: 'test@test.com',
          password:'1234567',
          password_confirmation:'1234567'
          )
        user =  User.authenticate_with_credentials('test@test.com','1234567')
        expect(user).to_not be_nil
      end   
       

      it "authenticate a user with spaces in email" do
        newUser = User.create(
          first_name: 'Fatuma',
          last_name:  'Saleh',
          email: 'test@test.com',
          password:'1234567',
          password_confirmation:'1234567'
          )
        user =  User.authenticate_with_credentials('  test@test.com  ','1234567')
        expect(user).to_not be_nil
      end   
      it "authenticate a user with diffrerent case in email" do
        newUser = User.create(
          first_name: 'Fatuma',
          last_name:  'Saleh',
          email: 'test@test.com',
          password:'1234567',
          password_confirmation:'1234567'
          )
        user =  User.authenticate_with_credentials('Test@tEst.com','1234567')
        expect(user).to_not be_nil
      end   
   end   
 end

