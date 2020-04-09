class Subsidiary < ApplicationRecord
  validates :name, :cnpj, :address,  presence: {message: 'O campo não pode ficar em branco'}
  validates :cnpj, length: { is: 14 }
  validates :cnpj, uniqueness: {message: 'CNPJ já cadastrado'}
end
