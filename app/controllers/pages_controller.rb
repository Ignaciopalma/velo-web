class PagesController < ApplicationController
	def index
		@pages = Page.all
	end

	def new
		@page = Page.new
		@biker = Biker.new
	end

	def create
		@page = Page.new(page_params)

		if @page.save
			redirect_to root_path
		else
			redirect_to root_path
		end

		@biker = Biker.new(biker_params)

		if @biker.save
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	def soy_ciclista
	end

	private
  	def page_params
    	params.require(:page).permit(:name, :email, :number)
  	end

  	def biker_params
  		params.require(:biker).permit(:name, :email, :number)
  	end
end
