json.extract! etudiant, :id, :nom, :prenom, :date_naissance, :master_id, :created_at, :updated_at
json.url etudiant_url(etudiant, format: :json)
