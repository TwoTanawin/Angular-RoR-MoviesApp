class MoviesController < ApplicationController
  def index
    movies = Movie.all
    render json: { movies: movies.as_json }, status: :ok
  end

  def show
    movies = Movie.find(params[:id])
    render json: { movies: movies.as_json }, status: :ok
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Notfound" }, status: :not_found
  end

  def create
    movie = Movie.new(movie_params)
    if movie.save
      render json: { movie: movie.as_json }, status: :created
    else
      render json: { errors: movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end

end
