require 'rails_helper'

RSpec.describe "/quartos", type: :request do
  let(:valid_attributes) {
    { numero: 101, descricao: "Quarto com vista para o mar", preco_diaria: 200.0, capacidade_maxima: 2 }
  }

  let(:invalid_attributes) {
    { numero: nil, descricao: "", preco_diaria: -50.0, capacidade_maxima: -1 }
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
    context "com parâmetros válidos" do
      it "cria um novo Quarto" do
        expect {
          post quartos_url, params: { quarto: valid_attributes }
        }.to change(Quarto, :count).by(1)
      end

      it "redireciona para o quarto criado" do
        post quartos_url, params: { quarto: valid_attributes }
        expect(response).to redirect_to(quarto_url(Quarto.last))
      end
    end

    context "com parâmetros inválidos" do
      it "não cria um novo Quarto" do
        expect {
          post quartos_url, params: { quarto: invalid_attributes }
        }.not_to change(Quarto, :count)
      end

      it "renderiza uma resposta bem-sucedida (ou seja, para exibir o template 'new')" do
        post quartos_url, params: { quarto: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "com parâmetros válidos" do
      let(:new_attributes) {
        { numero: 202, descricao: "Quarto de luxo", preco_diaria: 350.0, capacidade_maxima: 3 }
      }

      it "atualiza o quarto solicitado" do
        quarto = Quarto.create! valid_attributes
        patch quarto_url(quarto), params: { quarto: new_attributes }
        quarto.reload
        expect(quarto.numero).to eq(202)
      end

      it "redireciona para o quarto" do
        quarto = Quarto.create! valid_attributes
        patch quarto_url(quarto), params: { quarto: new_attributes }
        expect(response).to redirect_to(quarto_url(quarto))
      end
    end

    context "com parâmetros inválidos" do
      it "renderiza uma resposta bem-sucedida (ou seja, para exibir o template 'edit')" do
        quarto = Quarto.create! valid_attributes
        patch quarto_url(quarto), params: { quarto: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destrói o quarto solicitado" do
      quarto = Quarto.create! valid_attributes
      expect {
        delete quarto_url(quarto)
      }.to change(Quarto, :count).by(-1)
    end

    it "redireciona para a lista de quartos" do
      quarto = Quarto.create! valid_attributes
      delete quarto_url(quarto)
      expect(response).to redirect_to(quartos_url)
    end
  end
end