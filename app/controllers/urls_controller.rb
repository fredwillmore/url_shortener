class UrlsController < ApplicationController
  # before_action :set_url, only: [:show, :edit, :update, :destroy]

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
  end

  # GET /urls/1
  def show
    @url = Url.find_by_short params[:short]
    respond_to do |format|
      format.html do
        redirect_to @url.full 
      end
    end
  end

  # POST /urls
  def create
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        flash[:notice] = "Url was successfully created.
          Your shortened url for #{@url.full} is #{@url.short}. Well done!"
      else
        flash[:notice] = "Errors: #{@url.errors.full_messages.join ', '}"
      end
      format.html { render :index }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params[:url].permit(:full)
    end
end
