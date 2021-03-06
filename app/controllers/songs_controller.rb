class SongsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  
  # GET /songs/toggle_found.json
  def toggle_found
    @song = Song.find(params[:id])
    @song.found = !@song.found
    @song.save
    render :nothing => true
  end
  
  # GET /songs
  def index
    @songs = Song.search(params[:search]).order("found asc, " + sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])
    
    respond_to do |format|
      format.html # index.html.erb
      format.js # index.js.erb
      format.xml  { render :xml => @genres }
    end
    
  end

  # GET /songs/1
  # GET /songs/1.xml
  def show
    @song = Song.find(params[:id])

  end

  # GET /songs/new
  # GET /songs/new.xml
  def new
    @song = Song.new
    @genres = Genre.order("name ASC")
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
    @genres = Genre.order("name ASC")
  end

  # POST /songs
  # POST /songs.xml
  def create
    @song = Song.new(params[:song])
    respond_to do |format|
      if @song.save
        format.html { redirect_to(@song, :notice => 'Song was successfully created.') }
        format.xml  { render :xml => @song, :status => :created, :location => @song }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.xml
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to(@song, :notice => 'Song was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.xml
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to(songs_url) }
      format.xml  { head :ok }
    end
  end
  
  
  private
  
  def sort_column
    Song.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
