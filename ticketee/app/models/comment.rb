class Comment < ActiveRecord::Base

  belongs_to :ticket
  belongs_to :user
  
  belongs_to :state

  belongs_to :previus_state, class_name: "State"
  validates :text, presence: true
  
  before_create :set_previus_state
  after_create :set_ticket_state

  delegate :project, to: :ticket
	
	private

	def set_ticket_state
		self.ticket.state = self.state
		self.ticket.save!
	end

	def set_previus_state
		self.previus_state = ticket.state
	end
end
