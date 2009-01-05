Given %r{зарегистрирован пользователь "([^/\s]+)/(\S+)"$}i do |email, password|  
  Если %{я пытаюсь зарегистрироваться как "#{email}/#{password}"}
  То %{То я должен быть перенаправлен на /dashboard}
  И %{я должен быть залогинен как #{email}}
  Допустим %{я разлогиниваюсь}
end

Given %r{залогинен как "([^/\s]+)/(\S+)"$}i do |email, password|
  Если %{я пытаюсь зарегистрироваться как "#{email}/#{password}"}
  То %{То я должен быть перенаправлен на /dashboard}
  И %{я должен быть залогинен как #{email}}
end

When %r{пытаюсь зарегистрироваться как "([^/\s]+)/(\S+)"}i do |email, password|
  Допустим %{я захожу по адресу /signup}
  Если %{ввожу "#{email}" в поле "Email"}
  И %{ввожу "#{password}" в поле "Пароль"}
  И %{ввожу "#{password}" в поле "Подтверждение"}
  И %{нажимаю "Зарегистрироваться"}
end

Then %r{могу зарегистрироваться как "([^/\s]+)/(\S+)"} do |email, password|
  Если %{я пытаюсь зарегистрироваться как "#{email}/#{password}"}
  То %{я я должен быть перенаправлен на /dashboard}
  И %{должен увидеть "#{email}"}
end