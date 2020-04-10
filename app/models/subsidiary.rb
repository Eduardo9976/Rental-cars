class Subsidiary < ApplicationRecord
  validates :name, :cnpj, :address,  presence: {message: 'O campo não pode ficar em branco'}
  validates :cnpj, uniqueness: {message: 'CNPJ já cadastrado'}
  
  validate :cnpj_validation
  def cnpj_validation
    if !CNPJ.valid?(cnpj)
      errors.add(:cnpj, 'CNPJ inválido--Exemplo:xx.xxx.911/0001-xx')
    end
  end

end
