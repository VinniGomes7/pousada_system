require 'rails_helper'

RSpec.describe "/hospedes", type: :request do
  let(:valid_attributes) {
    {
      nome: "João da Silva",
      documento: "12345678900",
      email: "joao.silva@example.com",
      telefone: "11999999999",
      endereco: "Rua A, 123, São Paulo"
    }
  }

  let(:invalid_attributes) {
    {
      nome: "", 
      documento: "123", 
      email: "email_invalido", 
      telefone: "", 
      endereco: ""
    }
  }

  describe "GET /index" do
    it "retorna sucesso na listagem de hóspedes" do
      Hospede.create! valid_attributes
      get hospedes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "retorna sucesso ao visualizar um hóspede" do
      hospede = Hospede.create! valid_attributes
      get hospede_url(hospede)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renderiza a página de novo hóspede com sucesso" do
      get new_hospede_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renderiza a página de edição com sucesso" do
      hospede = Hospede.create! valid_attributes
      get edit_hospede_url(hospede)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "com parâmetros válidos" do
      it "cria um novo Hóspede" do
        expect {
          post hospedes_url, params: { hospede: valid_attributes }
        }.to change(Hospede, :count).by(1)
        expect(response).to redirect_to(hospede_url(Hospede.last))
      end
    end

    context "com parâmetros inválidos" do
      it "não cria um novo Hóspede" do
        expect {
          post hospedes_url, params: { hospede: invalid_attributes }
        }.to change(Hospede, :count).by(0)

        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH /update" do
    context "com parâmetros válidos" do
      let(:new_attributes) {
        { nome: "Carlos Silva" }
      }

      it "atualiza o hóspede solicitado" do
        hospede = Hospede.create! valid_attributes
        patch hospede_url(hospede), params: { hospede: new_attributes }
        hospede.reload
        expect(hospede.nome).to eq("Carlos Silva")
      end

      it "redireciona para o hóspede" do
        hospede = Hospede.create! valid_attributes
        patch hospede_url(hospede), params: { hospede: new_attributes }
        expect(response).to redirect_to(hospede_url(hospede))
      end
    end

    context "com parâmetros inválidos" do
      it "renderiza uma resposta bem-sucedida (ou seja, para exibir o template 'edit')" do
        hospede = Hospede.create! valid_attributes
        patch hospede_url(hospede), params: { hospede: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destrói o hóspede solicitado" do
      hospede = Hospede.create! valid_attributes
      expect {
        delete hospede_url(hospede)
      }.to change(Hospede, :count).by(-1)
    end

    it "redireciona para a lista de hóspedes" do
      hospede = Hospede.create! valid_attributes
      delete hospede_url(hospede)
      expect(response).to redirect_to(hospedes_url)
    end
  end
end