defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Discuss do
    pipe_through :browser # Use the default browser stack

    get "/", TopicController, :index
    # resources helper will auto generate all restful handlers for us
    resources "/topics", TopicController

    #get "/topics/new", TopicController, :new
    #post "/topics/create", TopicController, :create
    #get "/topics/:id/edit", TopicController, :edit
    #put "/topics/:id/update", TopicController, :update
    #delete "/topics/:id/delete", TopicController, :delete

  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
