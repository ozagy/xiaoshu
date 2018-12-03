class Application < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :intro_about_yourself,     :validate => true
  attribute :personal_website_or_profile
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Application from Xiaoshu Website",
      :to => "mayijun1203@live.cn",
      :from => %("#{name}" <#{email}>)
    }
  end
end