module ApplicationHelper
	def current_sale
		@current_sale = Sale.where("start < ? AND end > ?",Time.now,Time.now)
	end
	def current_sale?
		current_sale.present?
	end
end
