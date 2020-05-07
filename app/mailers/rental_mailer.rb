class RentalMailer < ApplicationMailer

  def rental_scheduled(rental_id)
    @rental = Rental.find(rental_id)
    customer = @rental.customer

    mail(to: "eduardo_2407@me.com", subject: "Confirmação de Agendamento - #{ @rental.code }" )
    #mail(to: customer.email, subject: "Confirmação de Agendamento - #{ @rental.code }" )

  end  

end  