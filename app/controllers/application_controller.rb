class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search_product

  protect_from_forgery with: :null_session

  private
    def set_search_product
      # 検索バー表示のために常に@qを生成する
      # 検索時以外params[:q]はnilだが、空のransackオブジェクト生成の動作になる
      @q = Product.ransack(params[:q])
    end


  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :address, :zip_code, :tel])
      devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :address, :zip_code, :tel])
    end

    # ログイン後に遷移するpathを設定
    def after_sign_in_path_for(resource)
      if resource.instance_of?(Admin)
        admin_homes_top_path
      elsif resource.instance_of?(Customer)
        homes_top_path
      else
        homes_top_path
      end
    end

    # ログアウト後に遷移するpathを設定
    def after_sign_out_path_for(resource)
      if resource == :admin
        admin_homes_top_path
      elsif resource == :customer
        homes_top_path
      else
        homes_top_path
      end
    end
end
