class UsersController < InheritedResources::Base

  private

    def user_params
      params.require(:user).permit(:name, :date_of_birth, :gender, :role, :attachment)
    end
end

