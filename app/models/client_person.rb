class ClientPerson < ActiveRecord::Base
	def index
	end

	def new
	end

	def create
		@client_person = ClientPerson.new
	end

	def show
	end
end
