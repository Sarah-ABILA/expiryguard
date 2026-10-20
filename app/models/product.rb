class Product < ApplicationRecord
  LOCATIONS = {
    "frigo" => "🧊 Frigo",
    "congelateur" => "❄️ Congélateur",
    "placard" => "🥫 Placard"
  }.freeze

  validates :name, presence: { message: "Le nom du produit est obligatoire" }
  validates :expires_on, presence: { message: "La date de péremption est obligatoire" }
  validates :location, inclusion: { in: LOCATIONS.keys, message: "Choisis un emplacement" }

  def location_label
    LOCATIONS[location]
  end

  def days_left
    (expires_on - Date.current).to_i
  end

  def status
    return "expired" if days_left < 0
    return "soon" if days_left <= 3
    "ok"
  end

  def status_label
    case status
    when "expired" then "Périmé depuis #{-days_left} j"
    when "soon" then days_left.zero? ? "Périme aujourd'hui" : "Périme dans #{days_left} j"
    else "Encore #{days_left} j"
    end
  end
end
