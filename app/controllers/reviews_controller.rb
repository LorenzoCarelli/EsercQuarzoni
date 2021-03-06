class ReviewsController < ApplicationController
	before_action :authenticate_user!
	def new
		@users = User.all
		#default rendering
	end
	
	def create
		id_movie = params[:movie_id]
		@movie = Movie.find(id_movie)
		@review = @movie.reviews.create!(params[:review].permit(:potatoes, :comments, current_user.id))
		flash[:notice] = "A review has from #{current_user.email} been successfully added to #{@movie.title}."
		redirect_to movie_path(@movie)
	end
		
	def destroy
		id = params[:id]
		@movie = Movie.find(id)
		@movie.destroy
		flash[:notice] = "#{@movie.title} has been deleted."
		redirect_to movies_path
	end
end
