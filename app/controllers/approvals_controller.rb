class ApprovalsController < ApplicationController
  def index
    @approvals = Approval.all
    respond_to do |format|
      format.html
      format.csv { send_data @approvals.to_csv }
    end 
  end

  def new
    @approval = Approval.new
  end

  def create
    @approval = Approval.new(approval_params)

    respond_to do |format|
      if verify_recaptcha(:model => @approval, :message => "Oh! It's error with reCAPTCHA!") && @approval.save
        format.html { redirect_to root_path, notice: 'תודה על האישור!' }
        format.json { render :show, status: :created, location: @approval }
      else
        format.html { render :new }
        format.json { render json: @approval.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approval
      @approval = Approval.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approval_params
      params.require(:approval).permit(:name, :guests, :comments)
    end
end
