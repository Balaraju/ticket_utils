require "ticket_utils/version"

module TicketUtils
  autoload :Client, 'ticket_utils/client'
  autoload :ApiError, 'ticket_utils/errors'

  def self.new
    TicketUtils::Client.new
  end

end
