 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/templates", type: :request do
  
  # Template. As you add validations to Template, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Template.create! valid_attributes
      get templates_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      template = Template.create! valid_attributes
      get template_url(template)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_template_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      template = Template.create! valid_attributes
      get edit_template_url(template)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Template" do
        expect {
          post templates_url, params: { template: valid_attributes }
        }.to change(Template, :count).by(1)
      end

      it "redirects to the created template" do
        post templates_url, params: { template: valid_attributes }
        expect(response).to redirect_to(template_url(Template.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Template" do
        expect {
          post templates_url, params: { template: invalid_attributes }
        }.to change(Template, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post templates_url, params: { template: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested template" do
        template = Template.create! valid_attributes
        patch template_url(template), params: { template: new_attributes }
        template.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the template" do
        template = Template.create! valid_attributes
        patch template_url(template), params: { template: new_attributes }
        template.reload
        expect(response).to redirect_to(template_url(template))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        template = Template.create! valid_attributes
        patch template_url(template), params: { template: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested template" do
      template = Template.create! valid_attributes
      expect {
        delete template_url(template)
      }.to change(Template, :count).by(-1)
    end

    it "redirects to the templates list" do
      template = Template.create! valid_attributes
      delete template_url(template)
      expect(response).to redirect_to(templates_url)
    end
  end
end