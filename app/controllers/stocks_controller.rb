class StocksController < ApplicationController
	def search
		if params[:stock].present?
			@stock = Stock.new_from_lookup(params[:stock])
			if @stock
				render partial: 'users/result'
			else
				flash[:danger] = "você digitou um simbolo incorreto"
				redirect_to my_portfolio_path	
			end	
		else
			flash[:danger] = "você digitou uma string vazia!"
			redirect_to my_portfolio_path
		end		
	end	

end
