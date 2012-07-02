class DropboxesController < ApplicationController
  # GET /dropboxes
  # GET /dropboxes.json
  def index
    @dropboxes = Dropbox.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dropboxes }
    end
  end

  # GET /dropboxes/1
  # GET /dropboxes/1.json
  def show
    @dropbox = Dropbox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dropbox }
    end
  end

  # GET /dropboxes/new
  # GET /dropboxes/new.json
  def new
    @dropbox = Dropbox.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dropbox }
    end
  end

  # GET /dropboxes/1/edit
  def edit
    @dropbox = Dropbox.find(params[:id])
  end

  # POST /dropboxes
  # POST /dropboxes.json
  def create
    @dropbox = Dropbox.new(params[:dropbox])

    respond_to do |format|
      if @dropbox.save
        format.html { redirect_to @dropbox, notice: 'Dropbox was successfully created.' }
        format.json { render json: @dropbox, status: :created, location: @dropbox }
      else
        format.html { render action: "new" }
        format.json { render json: @dropbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dropboxes/1
  # PUT /dropboxes/1.json
  def update
    @dropbox = Dropbox.find(params[:id])

    respond_to do |format|
      if @dropbox.update_attributes(params[:dropbox])
        format.html { redirect_to @dropbox, notice: 'Dropbox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dropbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dropboxes/1
  # DELETE /dropboxes/1.json
  def destroy
    @dropbox = Dropbox.find(params[:id])
    @dropbox.destroy

    respond_to do |format|
      format.html { redirect_to dropboxes_url }
      format.json { head :no_content }
    end
  end
end
