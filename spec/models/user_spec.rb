require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,family_name，first_name,family_name_reading,first_name_reading,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordは6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"        
        expect(@user).to be_valid
      end
      it "passwordは半角英数字混合であれば登録できる" do
        @user.password = "fff@gmalil.com"
        @user.password_confirmation = "fff@gmalil.com"        
        expect(@user).to be_valid
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        
      end
      it "ユーザー本名のフリガナは全角（カタカナ）であれば登録できる" do
      
      end

    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "emailは@を含んでなければ登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordは5文字以下であれば登録できない" do
      end
      it "passwordは半角英数字混合でなければ登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it "ユーザー本名が、名字と名前が空では登録できない" do
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      end
      it "ユーザー本名のフリガナが、名字と名前が空では登録できない" do
      end
      it "ユーザー本名のフリガナは全角（カタカナ）でなければ登録できない" do
      end
      it "生年月日が空では登録できない" do
      end
    end
  end

 
end