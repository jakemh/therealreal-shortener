require 'http'
class ShortenedLinksController < ApplicationController

  def index
    @shortened_links = ShortenedLink.all.reverse
    @shortened_link = ShortenedLink.new
  end

  def create

    shortened_link = ShortenedLink.build_from_uri(whitelist[:url])
    if shortened_link.save
      flash[:notice] = "Your link is updated"
    else 
      
      flash[:error] = "Unable to save link"
    end

    redirect_to [:shortened_links]
  end

  def show
    # instead of querying directly for the decoded ID, query by
    # encoded string for generalized base support
    shortened_link = ShortenedLink.where(encoded_string: params[:id]).first
    if shortened_link
      redirect_to shortened_link.url
    else 
      flash[:error] = "Sorry, this link does not exist!"
      redirect_to [:shortened_links]
    end
  end

  private

  def whitelist
    params.require(:shortened_link).permit(:url)
  end
end
