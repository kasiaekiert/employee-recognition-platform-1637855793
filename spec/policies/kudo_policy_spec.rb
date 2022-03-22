# frozen_string_literal: true

describe KudoPolicy do
  let!(:employee) { create(:employee) }
  let!(:kudo1) { create(:kudo, created_at: Time.zone.now - 10.minutes) }
  let!(:kudo2) { create(:kudo, created_at: Time.zone.now - 3.minutes) }
  let!(:kudo3) { create(:kudo, created_at: Time.zone.now - 5.minutes) }

  permissions :update?, :edit? do
    it 'denies access if kudo was published 10 minutes ago' do
      expect(described_class).not_to permit(employee, kudo1)
    end

    it 'grants access if kudo was published less than 5 minutes' do
      expect(described_class).to permit(employee, kudo2)
    end

    it 'denies access if kudo was published 5 minutes ago' do
      expect(described_class).not_to permit(employee, kudo3)
    end
  end
end
