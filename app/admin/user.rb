ActiveAdmin.register User do
    permit_params :name, :email, :password, :password_confirmation, :superadmin, :date_of_birth, :gender, :role

  index do
    selectable_column
    id_column
    column :name
    column :gender
    column :role
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :superadmin
    # column :created_at
    actions
  end

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :gender, as: :select, collection: (["Male", "Female"]),default: "Male",  include_blank: false
      f.input :role, as: :select, collection: (["Student", "Instructor","Administrator"]), include_blank: false, allow_blank: false
      f.input :email
      f.input :date_of_birth
      f.input :password
      f.input :password_confirmation
      f.input :superadmin, :label => "Super Administrator"
    end
    # f.buttons
    f.actions
  end

  # create_or_edit = Proc.new {
  #   @user            = User.where(id: params[:id]).first_or_create
  #   @user.superadmin = params[:user][:superadmin]
  #   # @user.attributes = params[:user].delete_if do |k, v|
  #   #   (k == "superadmin") ||
  #   #   (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
  #   # end
  #   if @user.save
  #     redirect_to :action => :show, :id => @user.id
  #   else
  #     render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb'),  :layout=>false
  #   end
  # }
  # member_action :create, :method => :post, &create_or_edit
  # member_action :update, :method => :put, &create_or_edit

end
