defmodule ShopWeb.Router do
  use ShopWeb, :router

  alias ShopWeb.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ShopWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Plugs.SetConsole , "pc" # custom plug written by me
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ShopWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/products", ProductController, :index
    get "/products/:slug", ProductController, :show


    #resources "/products" , ProductController

    #this will give you all the routes needed for your app , and can check by mix phx.routes | grep products
    # automatically creates beloow routes
    # GET     /products            ShopWeb.ShopWeb.ProductController :index
    # GET     /products/:id/edit   ShopWeb.ShopWeb.ProductController :edit
    # GET     /products/new        ShopWeb.ShopWeb.ProductController :new
    # GET     /products/:id          ShopWeb.ShopWeb.ProductController :show
    # POST    /products              ShopWeb.ShopWeb.ProductController :create
    # PATCH   /products/:id          ShopWeb.ShopWeb.ProductController :update
    # PUT     /products/:id          ShopWeb.ShopWeb.ProductController :update
    # DELETE  /products/:id          ShopWeb.ShopWeb.ProductController :delete




# to get nested routes we can do
  #     resources "/user" , Usercontroller do
  #          resources "/post" , PostController
  #     end

  # you can get this routes
  # GET     /user                                   ShopWeb.Usercontroller :index
  # GET     /user/:id/edit                          ShopWeb.Usercontroller :edit
  # GET     /user/new                               ShopWeb.Usercontroller :new
  # GET     /user/:id                               ShopWeb.Usercontroller :show
  # POST    /user                                   ShopWeb.Usercontroller :create
  # PATCH   /user/:id                               ShopWeb.Usercontroller :update
  # PUT     /user/:id                               ShopWeb.Usercontroller :update
  # DELETE  /user/:id                               ShopWeb.Usercontroller :delete
  # GET     /user/:usercontroller_id/post           ShopWeb.ShopWeb.PostController :index
  # GET     /user/:usercontroller_id/post/:id/edit  ShopWeb.ShopWeb.PostController :edit
  # GET     /user/:usercontroller_id/post/new       ShopWeb.ShopWeb.PostController :new
  # GET     /user/:usercontroller_id/post/:id       ShopWeb.ShopWeb.PostController :show
  # POST    /user/:usercontroller_id/post           ShopWeb.ShopWeb.PostController :create
  # PATCH   /user/:usercontroller_id/post/:id       ShopWeb.ShopWeb.PostController :update
  # PUT     /user/:usercontroller_id/post/:id       ShopWeb.ShopWeb.PostController :update
  # DELETE  /user/:usercontroller_id/post/:id       ShopWeb.ShopWeb.PostController :delete



end

  # Other scopes may use custom stacks.
  # scope "/api", ShopWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:shop, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ShopWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
