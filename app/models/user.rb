class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
     has_many :conversations, :foreign_key => :sender_id
     after_create :create_default_conversation
     scope :online_users_list, -> { where(status:true)}
 enum role: [:admin]
     private

     # for demo purposes

     def create_default_conversation
       Conversation.create(sender_id: 1, recipient_id: self.id) unless self.id == 1
     end
end
