class Customer < ApplicationRecord
  validates :name, :cpf, :email,  presence: {message: 'O campo não pode ficar em branco'}
end
