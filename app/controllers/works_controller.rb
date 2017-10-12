class WorksController < ApplicationController
  def homepage
  end

  def index
    @works = Work.order(:title)
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new work_params

    if @work.save
      flash[:success] = "Work added successfully"
      redirect_to works_path
    else
      flash.now[:error] = "Work not added successfully"
      render :new
    end
  end

  def show
    @work = Work.find_by(id: params[:id].to_i)

    unless @work
      render_404
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def render_404
      render file: "/public/404.html", status: 404
    end

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)

  end
end