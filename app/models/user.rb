class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :private_messages, class_name: 'Private::Message'
  has_many :private_conversations, class_name: 'Private::Conversation', foreign_key: :sender_id
end
