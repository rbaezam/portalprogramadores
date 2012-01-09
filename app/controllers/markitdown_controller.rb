class MarkitdownController < ApplicationController
	def preview
		markdown = RDiscount.new(params[:data])
		render :text => markdown.to_html
	end
end
