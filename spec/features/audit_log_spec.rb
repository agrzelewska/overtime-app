require 'rails_helper'

RSpec.describe 'AuditLog features', type: :feature do
  let!(:audit_log) { create(:audit_log) }
  let(:admin_user) { create(:admin_user) }

  describe 'index' do
    before { login_as(admin_user, scope: :user) }

    it 'has an index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      visit audit_logs_path
      expect(page).to have_content("SNOW, JON")
    end

    xit 'cannot be accessed by a non admin user' do

    end
  end
end
