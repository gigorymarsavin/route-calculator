class PackageMailer < ApplicationMailer

  def package_created
    @defaults = PackageBase.new(params) 
    mail(to: @defaults.email, subject: 'Package created wow')
  end

  def sent_status
    @defaults = PackageBase.new(params)
    mail(to: @defaults.email, subject: 'Your package was sent')
  end

  def delivered_status
    @defaults = PackageBase.new(params)
    mail(to: @defaults.email, subject: 'Your package was delivered')
  end
end
