class HitchhikesController < ApplicationController
  before_action :set_hitchhike, only: [:show, :edit, :update, :destroy]

  def index
    @hitchhikes = Hitchhike.all
  end

  def new
    @hitchhike = Hitchhike.new(taking:true)
  end

  def edit
  end

  def create
    @hitchhike = Hitchhike.new(hitchhike_params)

    respond_to do |format|
      if verify_recaptcha(:model => @hitchhike, :message => "טעות באימות המספרים") && @hitchhike.save
        format.html { redirect_to hitchhikes_url, notice: 'הטרמפ נוצר בהצלחה' }
        format.json { render :show, status: :created, location: @hitchhike }
      else
        format.html { render :new }
        format.json { render json: @hitchhike.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if verify_recaptcha(:model => @hitchhike, :message => "טעות באימות המספרים") && @hitchhike.update(hitchhike_params)
        format.html { redirect_to hitchhikes_url, notice: 'הטרמפ עודכן בהצלחה' }
        format.json { render :show, status: :ok, location: @hitchhike }
      else
        format.html { render :edit }
        format.json { render json: @hitchhike.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @hitchhike.destroy
    respond_to do |format|
      format.html { redirect_to hitchhikes_url, notice: 'Hitchhike was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hitchhike
      @hitchhike = Hitchhike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hitchhike_params
      params.require(:hitchhike).permit(:name, :phone, :from, :hour, :comments, :taking)
    end
end
