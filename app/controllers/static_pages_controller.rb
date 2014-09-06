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
    when 'hupa'
      @folder = params[:id]
    else
      @folder = 'propose'
    end
  end
end
