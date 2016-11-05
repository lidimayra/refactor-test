class HomeController < ApplicationController

  def index
    Make.persist_if_absent
  end
end
