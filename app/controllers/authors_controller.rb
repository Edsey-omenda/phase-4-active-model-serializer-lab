# class AuthorsController < ApplicationController
#   rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

#   def index
#     authors = Author.all 
#     render json: authors.to_json(except: [:id, :created_at, :updated_at],include: [posts:{only:[:title]}, profile:{ only: [:username, :email, :bio, :avatar_url]}])
#   end

#   def show
#     author = Author.find(params[:id])
#     render json: author.to_json(except: [:id, :created_at, :updated_at],include: [ posts:{only:[:title]}, profile:{ only: [:username, :email, :bio, :avatar_url]}])
#   end

#   private

#   def render_not_found_response
#     render json: { error: "Author not found" }, status: :not_found
#   end


# end

class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    authors = Author.all 
    render json: authors, include: ['profile', 'posts', 'posts.tags']
  end

  def show
    author = Author.find(params[:id])
    render json: author, include: ['profile', 'posts', 'posts.tags']
  end

  private

  def render_not_found_response
    render json: { error: "Author not found" }, status: :not_found
  end

end
