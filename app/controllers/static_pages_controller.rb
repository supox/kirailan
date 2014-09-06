class StaticPagesController < ApplicationController
  def home
  end

  def hotels
  end

  def getting_there
  end

  def program
  end

  def wedding
  end

  def gallery
    case params[:id]
    when 'hupa', 'propose'
      @folder = params[:id]
    else
     @folder = 'hupa'
    end
  end
end
