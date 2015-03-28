class TicketPolicy
  attr_reader :current_user, :model
  
  #Allow everything to admin
  def initialize(current_user, model)
    @current_user = current_user
    @model = model
  end

  def new?
    @current_user.user? and @current_user.ticket.nil?
  end

  def index?
    @current_user.admin?
  end

  def paid?
    @current_user.admin?
  end

  def blocked?
    @current_user.admin?
  end

  def dashboard?
    @current_user.user?
  end

end
