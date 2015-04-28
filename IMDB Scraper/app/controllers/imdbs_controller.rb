class ImdbsController < ApplicationController
  before_action :set_imdb, only: [:show, :edit, :update, :destroy]

  # GET /imdbs
  # GET /imdbs.json
  def index
    @imdbs = Imdb.all
  end

  # GET /imdbs/1
  # GET /imdbs/1.json
  def show
  end

  # GET /imdbs/new
  def new
    @imdb = Imdb.new
  end

  # GET /imdbs/1/edit
  def edit
  end

  def gethtml
    require 'net/http'

    ids = ['tt3450650', 'tt3713166', 'tt1014763', 'tt3660770', 'tt2273657', 
      'tt2977090', 'tt2911668', 'tt3685218', 'tt1935302', 'tt3399916']

    result = []
    ids.each do |id|
      uri = URI('http://www.imdb.com/title/' + id + '/')
      source = Net::HTTP.get(uri)

      title = /<meta property='og:title' content="(.*)" \/>/.match(source)[1]
      rating = /<span itemprop="ratingValue">(.*)<\/span><\/strong>/.match(source)[1]
      voters = /<span itemprop="ratingCount">(.*)<\/span> users/.match(source)[1]

      res = (title + ' - ' + rating + ' - ' + voters)
      result.push(res)
    end
    user = Imdb.create(mov1: result[0], mov2: result[1], mov3: result[2], mov4: result[3], mov5: result[4],
      mov6: result[5], mov7: result[6], mov8: result[7], mov9: result[8], mov10: result[9])
    render :json => result
  end

  # POST /imdbs
  # POST /imdbs.json
  def create
    @imdb = Imdb.new(imdb_params)

    respond_to do |format|
      if @imdb.save
        format.html { redirect_to @imdb, notice: 'Imdb was successfully created.' }
        format.json { render :show, status: :created, location: @imdb }
      else
        format.html { render :new }
        format.json { render json: @imdb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imdbs/1
  # PATCH/PUT /imdbs/1.json
  def update
    respond_to do |format|
      if @imdb.update(imdb_params)
        format.html { redirect_to @imdb, notice: 'Imdb was successfully updated.' }
        format.json { render :show, status: :ok, location: @imdb }
      else
        format.html { render :edit }
        format.json { render json: @imdb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imdbs/1
  # DELETE /imdbs/1.json
  def destroy
    @imdb.destroy
    respond_to do |format|
      format.html { redirect_to imdbs_url, notice: 'Imdb was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imdb
      @imdb = Imdb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def imdb_params
      params[:imdb]
    end
end
