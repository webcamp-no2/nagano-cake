class Admin::GenresController < Admin::BaseController
  def index
  	@genres = Genre.all
  	@genre = Genre.new
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  		flash[:notice] = "You have creatad new genre successfully."
  		redirect_to admin_genres_path
  	else
  		@genres = Genre.all
  		render action: :index
  	end
  end

  def edit
  		@genre = Genre.find(params[:id])
  end

  def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
			flash[:notice] = "You have edited genre successfully."
			@genre = Genre.find(params[:id])
			redirect_to admin_genres_path
		else
			render action: :edit
		end
  end

private
	def genre_params
		params.require(:genre).permit(:active_status, :name)
	end

end
