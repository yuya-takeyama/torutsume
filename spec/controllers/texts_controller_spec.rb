describe TextsController do
  include Devise::TestHelpers

  # This should return the minimal set of attributes required to create a valid
  # Text. As you add validations to Text, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {user_id: valid_user.id, subject: 'Subject', body: 'Body'} }

  let(:valid_user) { create :user }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TextsConroller. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all texts as @texts" do
      text = Text.create! valid_attributes
      get :index, {}, valid_session
      assigns(:texts).should eq([text])
    end
  end

  describe "GET show" do
    it "assigns the requested text as @text" do
      text = Text.create! valid_attributes
      get :show, {:id => text.to_param}, valid_session
      assigns(:text).should eq(text)
    end
  end

  describe "GET new" do
    before { sign_in_as_valid_user }

    it "assigns a new text as @text" do
      get :new, {}, valid_session
      assigns(:text).should be_a_new(Text)
    end
  end

  describe "GET edit" do
    before { sign_in_as_valid_user }

    it "assigns the requested text as @text" do
      text = Text.create! valid_attributes
      get :edit, {:id => text.to_param}, valid_session
      assigns(:text).should eq(text)
    end
  end

  describe "POST create" do
    before { sign_in_as_valid_user }

    describe "with valid params" do

      it "creates a new Text" do
        expect {
          post :create, {:text => valid_attributes}, valid_session
        }.to change(Text, :count).by(1)
      end

      it "assigns a newly created text as @text" do
        post :create, {:text => valid_attributes}, valid_session
        assigns(:text).should be_a(Text)
        assigns(:text).should be_persisted
      end

      it "redirects to the created text" do
        post :create, {:text => valid_attributes}, valid_session
        response.should redirect_to(Text.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved text as @text" do
        # Trigger the behavior that occurs when invalid params are submitted
        Text.any_instance.stub(:save).and_return(false)
        post :create, {:text => { "user" => "invalid value" }}, valid_session
        assigns(:text).should be_a_new(Text)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Text.any_instance.stub(:save).and_return(false)
        post :create, {:text => { "user" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    before { sign_in_as_valid_user }

    describe "with valid params" do
      it "updates the requested text" do
        text = Text.create! valid_attributes
        # Assuming there are no other texts in the database, this
        # specifies that the Text created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Text.any_instance.should_receive(:update).with({'subject' => 'Subject', 'body' => 'Body'})
        put :update, {:id => text.to_param, :text => {subject: 'Subject', body: 'Body'}}, valid_session
      end

      it "assigns the requested text as @text" do
        text = Text.create! valid_attributes
        put :update, {:id => text.to_param, :text => valid_attributes}, valid_session
        assigns(:text).should eq(text)
      end

      it "redirects to the text" do
        text = Text.create! valid_attributes
        put :update, {:id => text.to_param, :text => valid_attributes}, valid_session
        response.should redirect_to(text)
      end
    end

    describe "with invalid params" do
      it "assigns the text as @text" do
        text = Text.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Text.any_instance.stub(:save).and_return(false)
        put :update, {:id => text.to_param, :text => { "user" => "invalid value" }}, valid_session
        assigns(:text).should eq(text)
      end

      it "re-renders the 'edit' template" do
        text = Text.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Text.any_instance.stub(:save).and_return(false)
        put :update, {:id => text.to_param, :text => { "user" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before { sign_in_as_valid_user }

    it "destroys the requested text" do
      text = Text.create! valid_attributes
      expect {
        delete :destroy, {:id => text.to_param}, valid_session
      }.to change(Text, :count).by(-1)
    end

    it "redirects to the texts list" do
      text = Text.create! valid_attributes
      delete :destroy, {:id => text.to_param}, valid_session
      response.should redirect_to(texts_url)
    end
  end

  def sign_in_as_valid_user
    sign_in valid_user
  end
end
