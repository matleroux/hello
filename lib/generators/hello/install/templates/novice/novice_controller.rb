class NoviceController < Hello::ApplicationController

  dont_kick :novice
  
  def index
  end
  
  def continue
    respond_to do |format|


      if params[:agree]
        current_user.update! role: User.user_role
        #
        format.html { redirect_to hello.current_user_path, notice: "Welcome!" }
        format.json { render json: {user: current_user.to_hash_profile}, status: :ok }
      else
        @show_agree_error = true
        #
        format.html { render action: 'index' }
        format.json { render json: {errors: "must agree to terms"}, status: :unprocessable_entity }
      end


    end
  end

end
