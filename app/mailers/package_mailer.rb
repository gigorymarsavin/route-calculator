class PackageMailer < ApplicationMailer

  def package_created(params)
    @email = params['package'][:email]
    @name = params['package'][:name]
    @surname = params['package'][:surname]
    @midname = params['package'][:midname]
    @phone = params['package'][:phone]
    @weight = params['package'][:weight]
    @size = params['package'][:size]
    @addr_to = params['package'][:addr_to]
    @addr_from = params['package'][:addr_from]
    @price = params['package'][:price]

    mail(to: @email, subject: 'Package created wow')
  end

  def sent_status
    @email = params[:email]
    mail(to: @email, subject: 'Your package was sent')
  end

  def delivered_status
    @email = params[:email]
    mail(to: @email, subject: 'Your package was delivered')
  end
end
