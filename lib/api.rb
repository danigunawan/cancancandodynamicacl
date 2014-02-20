class AwesomestAPI < Grape::API
  version "v1"
  format :json

  helpers do
    def current_user
      env['warden'].user
    end
  end

  resource :users do
    desc "A collection of registered users."
    get do
      User.all
    end
  end

  resource :reports do
    desc "Get a report"
    get "/" do
      Report.all
    end

    get "/:id" do
      @report = Report.find(params[:id])
      Ability.new(current_user).authorize! :read, @report unless Ability.new(current_user).can? :read, :admin
    end
  end
end
