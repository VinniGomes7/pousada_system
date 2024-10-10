require 'rails_helper'

RSpec.describe "/users", type: :request do
  let(:valid_attributes) {
    { nome: "Admin", email: "admin@exemplo.com", password: "senha_secreta", role: "admin" }
  }

  let(:invalid_attributes) {
    { nome: "", email: "emailinvalido", password: "", role: "" }
  }

  describe "GET /index" do
    it "retorna sucesso na listagem de usuários" do
      User.create! valid_attributes
      get users_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "com parâmetros válidos" do
      it "cria um novo Usuário" do
        expect {
          post users_url, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
        expect(response).to redirect_to(user_url(User.last))
      end
    end

    context "com parâmetros inválidos" do
      it "não cria um novo Usuário" do
        expect {
          post users_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH /update" do
    context "com parâmetros válidos" do
      let(:new_attributes) {
        { nome: "Admin Modificado", email: "admin_modificado@exemplo.com", password: "nova_senha", role: "superadmin" }
      }

      it "atualiza o usuário solicitado" do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(user.nome).to eq("Admin Modificado")
        expect(user.email).to eq("admin_modificado@exemplo.com")
        expect(user.role).to eq("superadmin")
        # Verifique se a senha foi alterada, se necessário, dependendo da lógica de negócio
      end

      it "redireciona para o usuário" do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: new_attributes }
        expect(response).to redirect_to(user_url(user))
      end
    end

    context "com parâmetros inválidos" do
      it "renderiza uma resposta bem-sucedida (ou seja, para exibir o template 'edit')" do
        user = User.create! valid_attributes
        patch user_url(user), params: { user: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destrói o usuário solicitado" do
      user = User.create! valid_attributes
      expect {
        delete user_url(user)
      }.to change(User, :count).by(-1)
    end

    it "redireciona para a lista de usuários" do
      user = User.create! valid_attributes
      delete user_url(user)
      expect(response).to redirect_to(users_url)
    end
  end
end