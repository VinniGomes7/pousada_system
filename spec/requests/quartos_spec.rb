require 'rails_helper'

RSpec.describe "/quartos", type: :request do
  let(:valid_attributes) {
    { numero: 101, descricao: "Deluxe", preco_diaria: 200.0, capacidade_maxima: 2 }
  }

  let(:invalid_attributes) {
    { numero: nil, descricao: "", preco_diaria: -10, capacidade_maxima: nil }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Quarto.create! valid_attributes
      get quartos_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_quarto_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      quarto = Quarto.create! valid_attributes
      get edit_quarto_url(quarto)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Quarto" do
        expect {
          post quartos_url, params: { quarto: valid_attributes }
        }.to change(Quarto, :count).by(1)
      end

      it "redirects to the created quarto" do
        post quartos_url, params: { quarto: valid_attributes }
        expect(response).to redirect_to(quarto_url(Quarto.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Quarto" do
        expect {
          post quartos_url, params: { quarto: invalid_attributes }
        }.not_to change(Quarto, :count)
      end

      it "renders a successful response (i.e., to display the 'new' template)" do
        post quartos_url, params: { quarto: invalid_attributes }
        expect(response).to be_successful
        expect(response.body).to include("Novo Quarto") # Acentuação no título
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { numero: 102, descricao: "Super Deluxe", preco_diaria: 250.0, capacidade_maxima: 4 }
      }

      it "updates the requested quarto" do
        quarto = Quarto.create! valid_attributes
        patch quarto_url(quarto), params: { quarto: new_attributes }
        quarto.reload
        expect(quarto.numero).to eq(102)
      end

      it "redirects to the quarto" do
        quarto = Quarto.create! valid_attributes
        patch quarto_url(quarto), params: { quarto: new_attributes }
        expect(response).to redirect_to(quarto_url(quarto))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e., to display the 'edit' template)" do
        quarto = Quarto.create! valid_attributes
        patch quarto_url(quarto), params: { quarto: invalid_attributes }
        expect(response).to be_successful
        expect(response.body).to include("Editar Quarto") # Acentuação no título
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested quarto" do
      quarto = Quarto.create! valid_attributes
      expect {
        delete quarto_url(quarto)
      }.to change(Quarto, :count).by(-1)
    end

    it "redirects to the quartos list" do
      quarto = Quarto.create! valid_attributes
      delete quarto_url(quarto)
      expect(response).to redirect_to(quartos_url)
    end
  end
end