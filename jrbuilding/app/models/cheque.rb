class Cheque < ApplicationRecord

	belongs_to :tenant

	validates_presence_of :amount, :postdate
	validates :amount, :numericality => { only_integer: false }, :allow_nil => true

end
