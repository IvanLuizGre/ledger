class ReportsController < ApplicationController
  def balance
    UserMailer.welcome_email(current_user).deliver_later
    redirect_to root_path, notice: 'Você receberá o relatório por e-mail!'
  end
end
