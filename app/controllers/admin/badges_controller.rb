class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  # GET /badges
  def index
    @badges = Badge.all
  end

  # GET /badges/1
  def show
  end

  # GET /badges/new
  def new
    @badge = Badge.new
  end

  # GET /badges/1/edit
  def edit; end

  # POST /badges
  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, flash: { success: 'Badge was successfully created.' }
    else
      render :new
    end
  end

  # PATCH/PUT /badges/1
  # PATCH/PUT /badges/1.json
  def update
      if @badge.update(badge_params)
        redirect_to admin_badges_path, flash: { success: 'Badge was successfully updated.' }
      else
        render :edit
      end
  end

  # DELETE /badges/1
  # DELETE /badges/1.json
  def destroy
    @badge.destroy
    redirect_to admin_badges_path, flash: { success: 'Badge was successfully destroyed.' }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_badge
      @badge = Badge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def badge_params
      params.require(:badge).permit(:name, :filename, :rule_type, :rule_value)
    end
end
