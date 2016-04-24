require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#tern_chat?' do
    context 'idが1の場合に' do
      it 'trueを返すこと' do
        room = Room.new(id: 1)
        expect(room.tern_chat?).to eq true
      end
    end
  end
end
