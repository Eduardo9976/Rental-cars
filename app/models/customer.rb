class Customer < ApplicationRecord
  has_many :rentals
  validates :name, :cpf, :email,  presence: true
  validates :cpf, :email, uniqueness: true
  validates :email, :email_format => { :message => ' inválido' }


  validate :cpf_validation
  def cpf_validation
    if !CPF.valid?(cpf)
      errors.add(:cpf, 'inválido--Exemplo:xxx.xxx.911-xx')
    end
  end

  

  def identification
    "#{name} - #{cpf}"
  end  
end
