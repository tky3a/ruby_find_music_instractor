RailsAdmin.config do |config|

    ## == Devise ==
    config.authenticate_with do
      warden.authenticate! scope: :user
    end
    config.current_user_method(&:current_user)

    ## == Cancan ==
    config.authorize_with :cancan

    config.actions do
      dashboard                     # mandatory
      index                         # mandatory
      new
      export
      bulk_delete
      show
      edit
      delete
      show_in_app
    end

    config.model 'User' do
      LABEL_id = 'ユーザID'
      LABEL_email = 'メールアドレス'
      LABEL_admin = '管理者フラグ'
      LABEL_role = '権限'
      LABEL_created_at = '作成日時'
      LABEL_updated_at = '更新日時'

      # ここに指定した項目が表示される。include_all_fieldsをすれば全て表示。
      list do
        field :id do
          label LABEL_id
        end
        field :email do
          label LABEL_email
        end
        field :admin do
          label LABEL_admin
        end
        include_fields :role do
          label LABEL_role
        end
        field :created_at do
          label LABEL_created_at
        end
        field :updated_at do
          label LABEL_updated_at
        end
      end
    end

    config.model 'Role' do
      LABEL_id = '権限ID'
      LABEL_name = '権限名'
      LABEL_created_at = '作成日時'
      LABEL_updated_at = '更新日時'
      list do
        field :id do
          label LABEL_id
        end
        field :name do
          label LABEL_name
        end
        field :created_at do
          label LABEL_created_at
        end
        field :updated_at do
          label LABEL_updated_at
        end
      end
      show do
        field :id do
          label LABEL_id
        end
        field :name do
          label LABEL_name
        end
        field :created_at do
          label LABEL_created_at
        end
        field :updated_at do
          label LABEL_updated_at
        end
      end
      create do
        field :name do
          label LABEL_name
          # helpを指定することにより、項目説明を入れることが可能
          help "最大文字数: 255"
        end
      end
      update do
        field :id do
          label LABEL_id
          read_only true
          help ""
        end
        field :name do
          label LABEL_name
          help "最大文字数: 255"
        end
      end
    end
  end
