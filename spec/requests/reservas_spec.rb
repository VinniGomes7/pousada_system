RSpec.describe "/reservas", type: :request do
  let(:valid_attributes) {
    { hospede_id: create(:hospede).id, quarto_id: create(:quarto).id, data_entrada: Date.today, data_saida: Date.tomorrow }
  }

  let(:invalid_attributes) {
    { hospede_id: nil, quarto_id: nil, data_entrada: nil, data_saida: nil }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Reserva.create! valid_attributes
      get reservas_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      reserva = Reserva.create! valid_attributes
      get reserva_url(reserva)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_reserva_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      reserva = Reserva.create! valid_attributes
      get edit_reserva_url(reserva)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Reserva" do
        expect {
          post reservas_url, params: { reserva: valid_attributes }
        }.to change(Reserva, :count).by(1)
      end

      it "redirects to the created reserva" do
        post reservas_url, params: { reserva: valid_attributes }
        expect(response).to redirect_to(reserva_url(Reserva.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Reserva" do
        expect {
          post reservas_url, params: { reserva: invalid_attributes }
        }.to change(Reserva, :count).by(0)
      end

      it "renders an unprocessable entity response" do
        post reservas_url, params: { reserva: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity) # Correção mantida
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { data_entrada: Date.tomorrow, data_saida: Date.tomorrow + 2.days }
      }

      it "updates the requested reserva" do
        reserva = Reserva.create! valid_attributes
        patch reserva_url(reserva), params: { reserva: new_attributes }
        reserva.reload
        expect(reserva.data_entrada).to eq(Date.tomorrow)
      end

      it "redirects to the reserva" do
        reserva = Reserva.create! valid_attributes
        patch reserva_url(reserva), params: { reserva: new_attributes }
        reserva.reload
        expect(response).to redirect_to(reserva_url(reserva))
      end
    end

    context "with invalid parameters" do
      it "renders an unprocessable entity response" do
        reserva = Reserva.create! valid_attributes
        patch reserva_url(reserva), params: { reserva: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity) # Correção mantida
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested reserva" do
      reserva = Reserva.create! valid_attributes
      expect {
        delete reserva_url(reserva)
      }.to change(Reserva, :count).by(-1)
    end

    it "redirects to the reservas list" do
      reserva = Reserva.create! valid_attributes
      delete reserva_url(reserva)
      expect(response).to redirect_to(reservas_url)
    end
  end
end