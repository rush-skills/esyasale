class TicketsController < ApplicationController
  before_action :set_ticket, only: [:paid, :blocked]
  after_action :verify_authorized
  before_filter :authenticate_user!

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
    authorize @tickets
  end


  # GET /tickets/new
  def new
    if current_sale?
      @ticket = Ticket.new
      authorize @ticket
      @ticket.user = current_user
      @ticket.sale = current_sale
      if @ticket.save
        redirect_to dashboard_path
      else
        flash[:error] = "Sorry all tickets sold out"
        redirect_to dashboard_path
      end
    end
  end

  #GET /tickets/:id/paid
  def paid
    authorize @ticket
    @ticket.paid = true
    @ticket.save!
    redirect_to tickets_path
  end

  #GET /tickets/:id/blocked
  def blocked
    authorize @ticket
    @ticket.blocked = true
    @ticket.save!
    redirect_to tickets_path
  end

  #get /dashboard
  def dashboard
    @tickets = Ticket.all
    authorize @tickets
    @ticket = current_user.ticket
    render(layout: false)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

end
