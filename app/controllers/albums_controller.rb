class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  def index
    @albums = Album.all
  end

  # GET /albums/1
  def show
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  def create
    # @album = Album.new(album_params)
    @album = current_user.albums.build(album_params)
    @album.photos << Photo.find(params[:photos].split(","))
    # authorize @album

    # if @album.save
    #   redirect_to @album, notice: 'Album was successfully created.'
    # else
    #   render :new
    # end
    if @album.save
      flash[:notice] = "Your album has been created."
      redirect_to @album
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  # PATCH/PUT /albums/1
  def update
    # authorize @album

    # if @album.update(album_params)
    #   redirect_to @album, notice: 'Album was successfully updated.'
    # else
    #   render :edit
    # end
    if @album.update(params[:album].permit(:title,:description))
      # to handle multiple images upload on update when user add more picture
      if params[:images]
        params[:images].each { |image|
          @album.photos.create(image: image)
        }
      end
      flash[:notice] = "Album has been updated."
      redirect_to @album
    else
      render :edit
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
    redirect_to albums_url, notice: 'Album was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_params
      params.require(:album).permit(:title, :description, :user_id)
    end
end
