class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if current_user
          flash[:notice] = "ログインに成功しました" 
          user_path(@user)  #　指定したいパスに変更
        else
          flash[:notice] = "新規登録完了しました。次に名前を入力してください" 
          user_path(@user)  #　指定したいパスに変更
        end
      end

      
end
