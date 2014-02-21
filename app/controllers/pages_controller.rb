class PagesController < ApplicationController
  before_filter :authenticate_user!, except: [:home]
  before_filter(only: [:admin]) { authorize! :read, :admin }
end
