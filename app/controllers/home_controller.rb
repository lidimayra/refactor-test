class HomeController < ApplicationController

  expose :makes, ->{ Make.all }

  def index
    Make.persist_if_absent
  end
end
