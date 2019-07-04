class Ad < ApplicationRecord
	belongs_to :category
	belongs_to :user
	
	mount_uploaders :photos, ProfileUploader
	

	validates_presence_of :title, message: 'Não pode ser deixado em branco'
	validates_presence_of :description, message: 'Não pode ser deixado em branco'
	validates_presence_of :price, message: 'Não pode ser deixado em branco'
	validates_presence_of :quantity, message: 'Não pode ser deixado em branco'
end
