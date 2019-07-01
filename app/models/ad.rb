class Ad < ApplicationRecord
	belongs_to :category
	mount_uploaders :photos, PhotoUploader

	validates_presence_of :title, message: 'Não pode ser deixado em branco'
	validates_presence_of :description, message: 'Não pode ser deixado em branco'
	validates_presence_of :price, message: 'Não pode ser deixado em branco'
	validates_presence_of :quantity, message: 'Não pode ser deixado em branco'
end
