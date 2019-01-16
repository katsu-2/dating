class HomeController < ApplicationController
  def about
  end

  def contact
  end

  def top
    if user_signed_in?
      redirect_to posts_path
    else
      render 'top'
    end
  end
end
