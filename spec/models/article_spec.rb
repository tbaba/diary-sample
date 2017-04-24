require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do
    let(:article) { FactoryGirl.build_stubbed :article }

    describe 'presence of' do
      describe '#title' do
        subject { article.errors[:title] }

        context 'when the title is blank' do
          before do
            article.title = nil
            article.valid?
          end

          it { is_expected.to include "can't be blank" }
        end

        context 'when the title is NOT blank' do
          before do
            article.title = 'タイトル'
            article.valid?
          end

          it { is_expected.to be_empty }
        end
      end

      describe '#body' do
        subject { article.errors[:body] }

        context 'when the body is blank' do
          before do
            article.body = nil
            article.valid?
          end

          it { is_expected.to include "can't be blank" }
        end

        context 'when the body is NOT blank' do
          before do
            article.body = '本文'
            article.valid?
          end

          it { is_expected.to be_empty }
        end
      end
    end
  end
end
