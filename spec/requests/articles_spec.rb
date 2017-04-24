# frozen_string_literal: true
require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe 'GET #index' do
    let!(:old_article) { FactoryGirl.create :article, title: '記事', body: '古い記事' }
    let!(:new_article) { FactoryGirl.create :article, title: '記事その2', body: '新しい記事' }

    before do
      get root_path
    end

    it "respond with success" do
      expect(response).to be_success
    end

    it "renders the list of articles" do
      expect(response.body).to include new_article.body
      expect(response.body).to include old_article.body
    end
  end
end
