module Api
  class UsersController < Api::BaseController

    private

      def user_params
        params.require(:user).permit(:email, :password)
      end

      def query_params
        params.permit(:id)
      end

  end
end