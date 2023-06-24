class FavoritesController < ApplicationController

  def create
    @favorite=current_user.favorites.build(blog_id: params[:blog_id])
    @blog = Blog.find(params[:blog_id])
    
    respond_to do |format|
      if @favorite.save
        format.js { render :favorite }
      end
    end
  end



  def destroy
    @favorite=current_user.favorites.find_by(id: params[:id])
    @blog = @favorite.blog

    if @favorite
      @favorite.destroy!
    end  
    respond_to do |format|     
      format.js { render :favorite }
    end
  end

end