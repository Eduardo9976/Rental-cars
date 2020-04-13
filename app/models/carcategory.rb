class Carcategory < ApplicationRecord
  validates :name, :dialyrate, :insurance, :thirdinsurance, presence: {message: 'O campo não pode ficar em branco'}
  validates :name, uniqueness: {message: 'Categoria já cadastrada'}
end
