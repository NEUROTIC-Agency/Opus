class RecruitmentCompaniesController < ApplicationController
  before_action :set_recruitment_company, only: %i[ show edit update destroy ]

  # GET /recruitment_companies or /recruitment_companies.json
  def index
    @recruitment_companies = RecruitmentCompany.all
  end

  # GET /recruitment_companies/1 or /recruitment_companies/1.json
  def show
  end

  # GET /recruitment_companies/new
  def new
    @recruitment_company = RecruitmentCompany.new
  end

  # GET /recruitment_companies/1/edit
  def edit
  end

  # POST /recruitment_companies or /recruitment_companies.json
  def create
    @recruitment_company = RecruitmentCompany.new(recruitment_company_params)

    respond_to do |format|
      if @recruitment_company.save
        format.html { redirect_to recruitment_company_url(@recruitment_company), notice: "Recruitment company was successfully created." }
        format.json { render :show, status: :created, location: @recruitment_company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recruitment_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recruitment_companies/1 or /recruitment_companies/1.json
  def update
    respond_to do |format|
      if @recruitment_company.update(recruitment_company_params)
        format.html { redirect_to recruitment_company_url(@recruitment_company), notice: "Recruitment company was successfully updated." }
        format.json { render :show, status: :ok, location: @recruitment_company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recruitment_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recruitment_companies/1 or /recruitment_companies/1.json
  def destroy
    @recruitment_company.destroy

    respond_to do |format|
      format.html { redirect_to recruitment_companies_url, notice: "Recruitment company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruitment_company
      @recruitment_company = RecruitmentCompany.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recruitment_company_params
      params.require(:recruitment_company).permit(:name, :subscribed, :plan, :description, :employees_count, :website, :location, :hidden, :currency, :slug, :tenant_id)
    end
end
