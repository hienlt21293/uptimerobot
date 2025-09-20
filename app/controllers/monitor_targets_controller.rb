class MonitorTargetsController < ApplicationController
  before_action :set_monitor_target, only: %i[ show edit update destroy ]

  # GET /monitor_targets or /monitor_targets.json
  def index
    @monitor_targets = MonitorTarget.all
  end

  # GET /monitor_targets/1 or /monitor_targets/1.json
  def show
  end

  # GET /monitor_targets/new
  def new
    @monitor_target = MonitorTarget.new
  end

  # GET /monitor_targets/1/edit
  def edit
  end

  # POST /monitor_targets or /monitor_targets.json
  def create
    @monitor_target = MonitorTarget.new(monitor_target_params)

    respond_to do |format|
      if @monitor_target.save
        format.html { redirect_to @monitor_target, notice: "Monitor target was successfully created." }
        format.json { render :show, status: :created, location: @monitor_target }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @monitor_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monitor_targets/1 or /monitor_targets/1.json
  def update
    respond_to do |format|
      if @monitor_target.update(monitor_target_params)
        format.html { redirect_to @monitor_target, notice: "Monitor target was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @monitor_target }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @monitor_target.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monitor_targets/1 or /monitor_targets/1.json
  def destroy
    @monitor_target.destroy!

    respond_to do |format|
      format.html { redirect_to monitor_targets_path, notice: "Monitor target was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monitor_target
      @monitor_target = MonitorTarget.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def monitor_target_params
      params.expect(monitor_target: [ :name, :url, :image, :status ])
    end
end
