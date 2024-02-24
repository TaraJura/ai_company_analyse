class Client < ApplicationRecord
  has_many :extension_data, class_name: 'ExtensionData'
end
