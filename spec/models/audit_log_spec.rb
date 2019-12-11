require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  let(:audit_log) { create(:audit_log) }

  describe 'creation' do
    it 'can be properly created' do
      expect(audit_log).to be_valid
    end
  end

  describe 'validation' do
    it 'should require to have a user association' do
      audit_log.user = nil
      expect(audit_log).to_not be_valid
    end

    it 'should always have a status' do
      audit_log.status = nil
      expect(audit_log).to_not be_valid
    end

    it 'should require to have a start date' do
      audit_log.start_date = nil
      expect(audit_log).to_not be_valid
    end

    xit 'should have a start date equal to 6 days prior' do
      audit_log.start_date = Date.today - 12
      expect(audit_log).to_not be_valid
    end

  end
end
