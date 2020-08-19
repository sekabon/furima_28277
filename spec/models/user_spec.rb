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
        @user.password = "fff111"
        @user.password_confirmation = "fff111"        
        expect(@user).to be_valid
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）であれば登録できる" do
        @user.family_name = '藤田'
        @user.first_name = '敏弥'
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナは全角（カタカナ）であれば登録できる" do
        @user.family_name_reading = 'フジタ'
        @user.first_name_reading = 'トシヤ'
        expect(@user).to be_valid
      end

    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは@を含んでなければ登録できない" do
        @user.email = 'fffgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid. Include at-sign(@)")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英数字混合でなければ登録できない" do
        @user.password = "００００００"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名が、名字と名前が空では登録できない" do
        @user.family_name = nil
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank","First name can't be blank")
      end
      it "ユーザー本名は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = 'ﾌｼﾞﾀ'
        @user.first_name = 'ﾄｼﾔ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.", "First name is invalid. Input full-width characters.")
      end
      it "ユーザー本名のフリガナが、名字と名前が空では登録できない" do
        @user.family_name_reading = nil
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading can't be blank", "First name reading can't be blank")
      end
      it "ユーザー本名のフリガナは全角（カタカナ）でなければ登録できない" do
        @user.family_name_reading = 'ﾌｼﾞﾀ'
        @user.first_name_reading = 'ﾄｼﾔ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name reading is invalid. Input full-width katakana characters.", "First name reading is invalid. Input full-width katakana characters.")
      end
      it "生年月日が空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end

 
end