require 'rails_helper'

RSpec.describe "/reservas", type: :request do
  let(:hospede) { create(:hospede) }
  let(:quarto) { create(:quarto) }

  let(:valid_attributes) {
    { data_entrada: Date.tomorrow, data_saida: Date.tomorrow + 1, hospede_id: hospede.id, quarto_id: quarto.id }
  }

  let(:invalid_attributes) {
    { data_entrada: nil, data_saida: Date.tomorrow, hospede_id: nil, quarto_id: nil }
  }

  describe "GET /index" do
    it "retorna sucesso na listagem de reservas" do
      Reserva.create! valid_attributes
      get reservas_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "com parâmetros válidos" do
      it "cria uma nova Reserva" do
        expect {
          post reservas_url, params: { reserva: valid_attributes }
        }.to change(Reserva, :count).by(1)
        expect(response).to redirect_to(reserva_url(Reserva.last))
      end
    end

    context "com parâmetros inválidos" do
      it "não cria uma nova Reserva" do
        expect {
          post reservas_url, params: { reserva: invalid_attributes }
        }.to change(Reserva, :count).by(0)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH /update" do
    context "com parâmetros válidos" do
      let(:new_attributes) {
        { data_saida: Date.tomorrow + 5 }
      }

      it "atualiza a reserva solicitada" do
        reserva = Reserva.create! valid_attributes
        patch reserva_url(reserva), params: { reserva: new_attributes }
        reserva.reload
        expect(reserva.data_saida).to eq(Date.tomorrow + 5)
      end

      it "redireciona para a reserva" do
        reserva = Reserva.create! valid_attributes
        patch reserva_url(reserva), params: { reserva: new_attributes }
        expect(response).to redirect_to(reserva_url(reserva))
      end
    end

    context "com parâmetros inválidos" do
      it "renderiza uma resposta bem-sucedida (ou seja, para exibir o template 'edit')" do
        reserva = Reserva.create! valid_attributes
        patch reserva_url(reserva), params: { reserva: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destrói a reserva solicitada" do
      reserva = Reserva.create! valid_attributes
      expect {
        delete reserva_url(reserva)
      }.to change(Reserva, :count).by(-1)
    end

    it "redireciona para a lista de reservas" do
      reserva = Reserva.create! valid_attributes
      delete reserva_url(reserva)
      expect(response).to redirect_to(reservas_url)
    end
  end
end