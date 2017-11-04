class EtudiantsController < ApplicationController
  before_action :set_etudiant, only: [:show, :edit, :update, :destroy]

  # GET /etudiants
  # GET /etudiants.json
  def index
    @etudiants = Etudiant.all
  end

  # GET /etudiants/1
  # GET /etudiants/1.json
  def show
  end

  # GET /etudiants/new
  def new
    @etudiant = Etudiant.new
  end

  # GET /etudiants/1/edit
  def edit
  end

  # POST /etudiants
  # POST /etudiants.json
  def create
    @etudiant = Etudiant.new(etudiant_params)

    respond_to do |format|
      if @etudiant.save
        format.html { redirect_to @etudiant, notice: 'Etudiant was successfully created.' }
        format.json { render :show, status: :created, location: @etudiant }
      else
        format.html { render :new }
        format.json { render json: @etudiant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etudiants/1
  # PATCH/PUT /etudiants/1.json
  def update
    respond_to do |format|
      if @etudiant.update(etudiant_params)
        format.html { redirect_to @etudiant, notice: 'Etudiant was successfully updated.' }
        format.json { render :show, status: :ok, location: @etudiant }
      else
        format.html { render :edit }
        format.json { render json: @etudiant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etudiants/1
  # DELETE /etudiants/1.json
  def destroy
    @etudiant.destroy
    respond_to do |format|
      format.html { redirect_to etudiants_url, notice: 'Etudiant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etudiant
      @etudiant = Etudiant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etudiant_params
      params.require(:etudiant).permit(:nom, :prenom, :date_naissance, :master_id)
    end
end
