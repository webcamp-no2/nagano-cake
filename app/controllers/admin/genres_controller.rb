class Admin::GenresController < Admin::BaseController
  def index
  	@genres = Genre.all
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  		flash[:notice] = "You have creatad book successfully."
  		redirect_to admin_genres_path
  	else
  		@genres = Genre.all
  		render action: :index
  	end
  end

  def edit
  end

  def update
  end

private
	def genre_params
		params.require(:genre).permit(:active_status, :name)
	end

end
