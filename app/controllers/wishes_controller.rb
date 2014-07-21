class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy]

  def index
    @wishes = Wish.paginate(:page => params[:page]).order("created_at DESC")
  end

  def show
  end

  def new
    @wish = Wish.new
  end

  def edit
  end

  def create
    @wish = Wish.new(wish_params)

    respond_to do |format|
      if verify_recaptcha(:model => @wish, :message => "טעות באימות המספרים") && @wish.save
        format.html { redirect_to wishes_path, notice: 'תודה על הברכה!' }
        format.json { render :show, status: :created, location: @wish }
      else
        format.html { render :new }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if verify_recaptcha(:model => @wish, :message => "טעות באימות המספרים") && @wish.update(wish_params)
        format.html { redirect_to wishes_path, notice: 'הברכה עודכנה' }
        format.json { render :show, status: :ok, location: @wish }
      else
        format.html { render :edit }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wish.destroy
    respond_to do |format|
      format.html { redirect_to wishes_url, notice: 'Wish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish
      @wish = Wish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wish_params
      params.require(:wish).permit(:content, :name)
    end
end
