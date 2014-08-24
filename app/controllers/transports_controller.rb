class TransportsController < ApplicationController
  before_action :set_transport, only: [:edit, :update, :destroy]

  # GET /transports
  # GET /transports.json
  def index
    respond_to do |format| 
      format.html {
        @transports = Transport.all
      }
      format.csv { send_data Transport.to_csv }
    end
  end

  def new
    @transport = Transport.new
  end

  def edit
  end

  def create
    @transport = Transport.new(transport_params)

    respond_to do |format|
      if @transport.save
        format.html { redirect_to transports_url, notice: 'בקשתך נרשמה' }
        format.json { render :show, status: :created, location: @transport }
      else
        format.html { render :new }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @transport.update(transport_params)
        format.html { redirect_to transports_url, notice: 'הרשומה עודכנה' }
        format.json { render :show, status: :ok, location: @transport }
      else
        format.html { render :edit }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transport.destroy
    respond_to do |format|
      format.html { redirect_to transports_url, notice: 'הרשומה נמחקה.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transport
      @transport = Transport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transport_params
      params.require(:transport).permit(:name, :direction, :comments, :phone)
    end
end
