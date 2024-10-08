json.extract! reserva, :id, :data_inicio, :data_fim, :hospede_id, :quarto_id, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
