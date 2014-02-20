class AwesomestAPI < Grape::API
  version "v1"
  format :json

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
      Report.find(params[:id])
    end
  end
end
