class ClickController < ApplicationController

  def create
    shortened_link = ShortenedLink.find(params[:shortened_link_id])

    click = shortened_link.clicks.build
    click.save
    redirect_to shortened_link.url

  end
end
