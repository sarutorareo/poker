require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '#tern_chat?' do
    context 'idが1の場合に' do
      it 'trueを返すこと' do
        room = Room.new(id: 1)
        expect(room).not_to be_nil
        expect(room.tern_chat?).to eq true
      end
    end
  end
  describe '#tern_chat?' do
    context 'idが2の場合に' do
      it 'falseを返すこと' do
        room = Room.new(id: 2)
        expect(room.tern_chat?).to eq false
      end
    end
  end
end
