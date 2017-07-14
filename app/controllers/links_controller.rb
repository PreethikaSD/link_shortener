require 'json'
require 'byebug'

class LinksController < ApplicationController

skip_before_action :verify_authenticity_token, only: [:get_link, :shorten_link]

	def get_link
	end

	#method to shorten the link passed
  	def shorten_link
  		input_link = params[:link][:given_link]
  		render json: shorten_my_link(input_link)
  	end

  	#Return back the original url
  	def show
  		short_url = 'http://localhost:3000/'+params[:shortened_link]
  		url = Link.find_by(shortened_link: short_url)
  		if url
  			original_url = url.given_link
  			redirect_to "#{original_url}"
  		else
  			render json: "Not found"
  		end
  	end

  	private
	def link_params
		params.require(:link).permit(:given_link, :shortened_link)
	end

	def shorten_my_link(ip_link)
	    find_link = Link.find_by(given_link: ip_link)
	    if find_link
	    	json = {"success": true, "given_link": ip_link, "shortened_link": find_link.shortened_link}
	    else
	    	short_link = "http://localhost:3000/"+Link.shorten
	    	@link = Link.new(link_params)
	    	@link.shortened_link = short_link
	    	if @link.save
	    		json = {"success": true, "given_link": ip_link, "shortened_link": short_link}
	    	else
	    		json = {"success": false, "given_link": @given_link, "errors": link.errors_as_string}
	    	end	
	    end
	    json
	end
end
