class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @people = Person.order(:name)
    csv_content = gerar_csv()
    attachments['fileBalances.csv'] = {mime_type: 'text/csv', content: csv_content}
    mail(to: @user.email, subject: 'Segue anexo de relatório', attachments:attachments)
  end

  require 'csv'

    def gerar_csv()
        CSV.generate(headers: true) do |csv|
        csv << ['Nome', 'Saldo']
        @people.each do |person| 
            csv << [person.name, person.balance]
        end
    end
  end
end
