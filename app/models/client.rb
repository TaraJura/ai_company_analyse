class Client < ApplicationRecord
  has_many :extension_data, class_name: 'ExtensionData'
  belongs_to :user, primary_key: 'extension_user_id', foreign_key: 'token_identifier', class_name: 'User', optional: true
end
