require 'rails_helper'

RSpec.describe "/funcionarios", type: :request do
  let(:valid_attributes) {
    { nome: "João Silva", cargo: "Recepcionista", documento: "123456789", email: "joao@exemplo.com", telefone: "11999999999", salario: 3000 }
  }

  let(:invalid_attributes) {
    { nome: "", cargo: "", documento: "123", email: "emailinvalido", telefone: "000", salario: -1000 }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Funcionario.create! valid_attributes
      get funcionarios_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_funcionario_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      funcionario = Funcionario.create! valid_attributes
      get edit_funcionario_url(funcionario)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "com parâmetros válidos" do
      it "cria um novo Funcionário" do
        expect {
          post funcionarios_url, params: { funcionario: valid_attributes }
        }.to change(Funcionario, :count).by(1)
      end

      it "redireciona para o funcionário criado" do
        post funcionarios_url, params: { funcionario: valid_attributes }
        expect(response).to redirect_to(funcionario_url(Funcionario.last))
      end
    end

    context "com parâmetros inválidos" do
      it "não cria um novo Funcionário" do
        expect {
          post funcionarios_url, params: { funcionario: invalid_attributes }
        }.not_to change(Funcionario, :count)
      end

      it "renderiza uma resposta bem-sucedida (ou seja, para exibir o template 'new')" do
        post funcionarios_url, params: { funcionario: invalid_attributes }
        expect(response).to render_template(:new) # Alterado para renderizar o template
      end
    end
  end

  describe "PATCH /update" do
    context "com parâmetros válidos" do
      let(:new_attributes) {
        { nome: "Maria Souza", cargo: "Gerente", documento: "987654321", email: "maria@exemplo.com", telefone: "11988888888", salario: 3500 }
      }

      it "atualiza o funcionário solicitado" do
        funcionario = Funcionario.create! valid_attributes
        patch funcionario_url(funcionario), params: { funcionario: new_attributes }
        funcionario.reload
        expect(funcionario.nome).to eq("Maria Souza")
      end

      it "redireciona para o funcionário" do
        funcionario = Funcionario.create! valid_attributes
        patch funcionario_url(funcionario), params: { funcionario: new_attributes }
        expect(response).to redirect_to(funcionario_url(funcionario))
      end
    end

    context "com parâmetros inválidos" do
      it "renderiza uma resposta bem-sucedida (ou seja, para exibir o template 'edit')" do
        funcionario = Funcionario.create! valid_attributes
        patch funcionario_url(funcionario), params: { funcionario: invalid_attributes }
        expect(response).to render_template(:edit) # Alterado para renderizar o template
      end
    end
  end

  describe "DELETE /destroy" do
    it "destrói o funcionário solicitado" do
      funcionario = Funcionario.create! valid_attributes
      expect {
        delete funcionario_url(funcionario)
      }.to change(Funcionario, :count).by(-1)
    end

    it "redireciona para a lista de funcionários" do
      funcionario = Funcionario.create! valid_attributes
      delete funcionario_url(funcionario)
      expect(response).to redirect_to(funcionarios_url)
    end
  end
end