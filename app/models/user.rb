class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :client, primary_key: 'extension_user_id', foreign_key: 'token_identifier', class_name: 'Client'
end
