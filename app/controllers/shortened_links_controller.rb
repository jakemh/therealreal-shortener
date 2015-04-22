class ShortenedLinksController < ApplicationController

  def index
    @shortened_links = ShortenedLink.all
    @shortened_link = ShortenedLink.new
  end

  def new
  
  end

  def create
  
  end

  def show
    # instead of querying directly for the decoded ID, query by
    # encoded string for generalized base support
    shortened_link = ShortenedLink.first(encoded_string: params[:id])
    if shortened_link
      redirect_to shortend_link.url
    else 
      flash[:error] = "Sorry, this link does not exist!"
    end
  end

end
