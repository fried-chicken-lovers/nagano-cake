Rails.application.routes.draw do
  devise_for :member,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

end
