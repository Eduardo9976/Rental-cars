class Customer < ApplicationRecord
  has_many :rentals
  validates :name, :cpf, :email,  presence: true

  def identification
    "#{name} - #{cpf}"
  end  
end
