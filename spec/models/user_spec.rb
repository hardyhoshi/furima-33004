require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname、email、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'emailに@が含まれれば登録できる' do
      @user.email = 'aaa@aaa'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'passwordとpassword_confirmationが6文字以上で半角英数混合あれば登録できる' do
      @user.password = '1aaaaa'
      @user.password_confirmation = '1aaaaa'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'last_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
      @user.last_name = 'あああ'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
      @user.first_name = 'あああ'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'last_name_kanaは全角（カタカナ）であれば登録できる' do
      @user.last_name_kana = 'アア'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'first_name_kanaは全角（カタカナ）であれば登録できる' do
      @user.first_name_kana = 'アア'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'emailに@が含まれなければ登録できない' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'passwordは半角数字のみの場合は登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて設定してください')
    end
    it 'passwordは半角英字のみの場合は登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは英字と数字の両方を含めて設定してください')
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前(性)を入力してください")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前(名)を入力してください")
    end
    it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前(性)は全角(漢字・ひらがな・カタカナ)で入力してください')
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = 'Test'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前(名)は全角(漢字・ひらがな・カタカナ)で入力してください')
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前カナ(性)を入力してください")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前カナ(名)を入力してください")
    end
    it 'last_name_kanaは全角（カタカナ）でなければ登録できない' do
      @user.last_name_kana = '漢字'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ(性)は全角で入力してください')
    end
    it 'first_name_kanaは全角（カタカナ）でなければ登録できない' do
      @user.first_name_kana = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ(名)は全角で入力してください')
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end
