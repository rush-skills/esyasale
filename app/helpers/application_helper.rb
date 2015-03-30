module ApplicationHelper
	def current_sale
		@current_sale = Sale.where("start < ? AND end > ?",Time.now,Time.now).first
	end
	def current_sale?
		current_sale.present?
	end
	def future_sale
		@future_sale = Sale.where("start > ?", Time.now).first
	end
	def tickets_left
		current_sale.quantity - Ticket.where(sale_id: current_sale.id).count
	end
end
