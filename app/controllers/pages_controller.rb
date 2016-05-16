class PagesController < ApplicationController
	def index
		@pages = Page.all
	end

	def new
		@page = Page.new
		@post = Post.new

	end

	def blog
		@posts = Post.all
	end

	def temrs
	end

	def create
		@page = Page.new(page_params)

		if @page.save
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

end
