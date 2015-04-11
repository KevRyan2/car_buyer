module Api
  class UsersController < Api::BaseController

    def destroy
      @user.destroy

      head :no_content
    end  


    def update
      if @user.update(user_params)
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end    
    end

    def create
      @user = User.new(params[:user])

      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity  
      end

    end



    private

      def user_params
        params.require(:user).permit(:email, :password)
      end

      def query_params
        params.permit(:id)
      end

  end
end