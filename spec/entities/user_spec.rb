module Entities
  describe User do
    describe '#nil_user?' do
      subject(:nil_user?) { user.nil_user? }

      let(:user) { described_class.new }

      context 'when id, name and email are blank' do
        before do
          user.id = nil
          user.name = nil
          user.email = nil
        end

        it { is_expected.to be_truthy }
      end

      context 'when id and name are blank, but email' do
        before do
          user.id = nil
          user.name = nil
          user.email = 'account@domain.tld'
        end

        it { is_expected.to be_falsy }
      end

      context 'when id and email are blank, but name' do
        before do
          user.id = nil
          user.name = 'jonh'
          user.email = nil
        end

        it { is_expected.to be_falsy }
      end

      context 'when id is blank, but name and email' do
        before do
          user.id = nil
          user.name = 'jonh'
          user.email = 'account@domain.tld'
        end

        it { is_expected.to be_falsy }
      end

      context 'when name and email are blank, but id' do
        before do
          user.id = 1
          user.name = nil
          user.email = nil
        end

        it { is_expected.to be_falsy }
      end

      context 'when name is blank, but id and email' do
        before do
          user.id = 1
          user.name = nil
          user.email = 'account@domain.tld'
        end

        it { is_expected.to be_falsy }
      end

      context 'when email is blank, but id and name' do
        before do
          user.id = 1
          user.name = 'jonh'
          user.email = nil
        end

        it { is_expected.to be_falsy }
      end

      context 'when id, name and email are not blank' do
        before do
          user.id = 1
          user.name = 'jonh'
          user.email = 'account@domain.tld'
        end

        it { is_expected.to be_falsy }
      end
    end

    describe '.nil' do
      subject(:nil_user) { described_class.nil }

      it 'creates a user with blank id' do
        expect(nil_user.id).to be_blank
      end

      it 'creates a user with blank name' do
        expect(nil_user.name).to be_blank
      end

      it 'creates a user with blank email' do
        expect(nil_user.email).to be_blank
      end
    end
  end
end
