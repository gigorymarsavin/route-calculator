class PackageMailer < ApplicationMailer

  def package_created
    @defaults = PackageMailerBase.defaults(params)
    mail(to: @defaults.email, subject: 'Package created wow')
  end

  def sent_status
    mail(to: PackageMailerBase.defaults(params).email, subject: 'Your package was sent')
  end

  def delivered_status
    mail(to: PackageMailerBase.defaults(params).email, subject: 'Your package was delivered')
  end
end
