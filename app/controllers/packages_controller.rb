class PackagesController < ApplicationController
  before_action :set_package, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  include RouteCalculator

  # GET /packages or /packages.json
  def index
    @packages = Packages::GridQuery.call(params.merge(current_user: current_user)).page(params[:page])
  end

  # GET /packages/1 or /packages/1.json
  def show
  end

  # GET /packages/new
  def new
    @package = current_user.packages.build
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages or /packages.json
  def create
    api_service = Api.find_by(status: true).name
    result_hash = RouteCalculator.call(package_params.merge(service: api_service))
    @package = current_user.packages.new(result_hash.merge(package_params))

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: "Package was successfully created." }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1 or /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: "Package was successfully updated." }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1 or /packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: "Package was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def package_params
      params.require(:package).permit(:name, :surname, :midname, :phone, :email, :weight, :length, :width, :height, :addr_from, :addr_to, :user_id)
    end
end
