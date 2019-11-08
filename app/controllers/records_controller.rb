class RecordsController < ApplicationController
  before_action :require_user_logged_in
  before_action set_records, only: [:show,:edit,:update]

  def index
    if logged in?
      @records = current_user.records.order('created_at DESC')
    end
  end

  def show
  end

  def new
    @record = curent_user.records.build
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save
      flash[:success] = '投稿しました'
      redirect_to @record
    else
      @records = current_user.feed_records.order('created_at DESC')
      flash.now[:danger] = '投稿出来ませんでした'
      render 'toppages/index'
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      flash[:success] = '投稿を編集しました'
      redirect_to @record
    else
      flash.now[:danger] = '投稿を編集出来ませんでした'
      render :edit
    end
  end

  def destroy
    @record.destroy
    flash[:success] = '投稿を削除しました'
    redirect_back(fallback_location root_path)
  end

  private

  def set_records
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:name,:size,:weight,:place,:weather,:lure,:image)
  end

  def correct_user
    @record = current_user.records.find_by(id: params[:id])
    unless @record
      redirect_to root_url
    end
  end
end
