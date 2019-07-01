class Category < ApplicationRecord
	has_many :ads

	validates_presence_of :description, message: 'Não pode ser deixado em branco'
end
