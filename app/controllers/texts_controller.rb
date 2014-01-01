class TextsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]
  before_action :authenticate!, only: [:new, :edit, :create, :update, :destroy]
  before_action :check_permission!, only: [:edit, :update, :destroy]

  # GET /texts
  # GET /texts.json
  def index
    @texts = Text.all
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
  end

  # GET /texts/new
  def new
    @text = Text.new
  end

  # GET /texts/1/edit
  def edit
  end

  # POST /texts
  # POST /texts.json
  def create
    result = Dee['text.poster'].create(
      user: current_user,
      params: text_params,
    )
    @text = result.text

    respond_to do |format|
      if result.ok?
        format.html { redirect_to @text, notice: 'Text was successfully created.' }
        format.json { render action: 'show', status: :created, location: @text }
      else
        format.html { render action: 'new' }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texts/1
  # PATCH/PUT /texts/1.json
  def update
    @text.update_attributes(text_params)

    result = Dee['text.poster'].update(
      user: current_user,
      text: @text,
      params: text_params,
      message: params[:commit_message]
    )

    respond_to do |format|
      if result.ok?
        format.html { redirect_to @text, notice: 'Text was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @text.destroy
    respond_to do |format|
      format.html { redirect_to texts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text
      @text = Text.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_params
      params.require(:text).permit(:subject, :body)
    end

    def authenticate!
      raise 'You should be logged in' unless user_signed_in?
    end

    def check_permission!
      raise 'Not permitted' unless current_user.id == @text.user_id
    end
end
