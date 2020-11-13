class Api::DropsController < ApplicationController

  # before_action :ensure_logged_in, only: [:new, :create, :edit, :update]

  def index
    # index should get all of a resource and send it to user 
    # debugger
    @drops = Drop.all.includes(:author) # changed to instance variable
    # instance variables are available to our views
    # adding .includes avoids N + 1 query
    # users = User.all

    # render json: { drops: drops, users: users }
    render :index
  end

  def show 
    @drop = Drop.find(params[:id]) # instance variable accessible in our view

    # render json: @drop
    render :show
  end

  def new 
    @drop = Drop.new 
    # @drop.body = 'testing'
    # creates empty drop instance to be used by our view

    render :new
    # renders the new template to the client in order to fill in 
    # our form
  end

  def create
    # receives the request from our new form, and attempts to create
    # a drop in our database
    # debugger
    drop = Drop.new(drop_params)
    drop.author = User.first
    # we dont' want to use .save! or .create! because it would throw an error
    # we want to decide what happens if the save is successful or not
    if drop.save
      render json: drop 
      # redirect_to drop_url(drop)
    else
      render json: drop.errors.full_messages, status: 422

      # render :new, status: 422
    end
  end

  def edit
    @drop = Drop.find(params[:id])
    # find the drop we wish to edit

    render :edit
  end

  def update
    # debugger
    drop = Drop.find_by(id: params[:id])
    if drop.update(drop_params) # this is using the ActiveRecord update method 
      redirect_to drop_url(drop)
    else
      render json: drop.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    # debugger
    drop = Drop.find(params[:id])
    drop.destroy
    redirect_to drops_url
    
    # evaluates to redirect_to "/drops"
    # cannot redirect to a view/template e.g. redirect_to :index
  end

  def set_cookie
    maybe_cookie = params[:my_cookie]

    if maybe_cookie
      cookies[:my_cookie] = maybe_cookie
      render plain: "I am setting your cookie: #{maybe_cookie}"
    else
      render plain: "You must provide a cookie"
    end
  end

  def get_cookie
    my_cookie = cookies[:my_cookie]
    if my_cookie
      render plain: "Here's your cookie: #{my_cookie}"
    else
      render plain: "You haven't set a cookie called :my_cookie yet"
    end
  end

  private
  def drop_params
    params.require(:drop).permit(:body)
    # require looks for top level key of `drop` within params
    # then only grabs (permits) the keys within drop of body 
  end 
end