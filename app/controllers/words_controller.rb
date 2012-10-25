class WordsController < ApplicationController

	def index
    @words = Word.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @words }
    end
  end

  def show
    @word = Word.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @words }
    end
  end

  def find
		@words = Word.where("keys_text like ?", "%#{params[:keys]}%")
    respond_to do |format|
      format.html # find.html.erb
      format.json { render json: @words }
    end
  end

  def find_in_def
		@words = Word.where("def_text like ?", "%#{params[:text]}%")
    respond_to do |format|
      format.html # find.html.erb
      format.json { render json: @words }
    end
  end

end
