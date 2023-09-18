require 'spec_helper'

RSpec.describe Item do
  let(:item) {Item.new({name: 'Peach', price: '$0.75'})}
  it 'can initialize' do
    expect(item).to be_an(Item)
    expect(item.name).to eq('Peach')
    expect(item.price).to eq('$0.75')
  end
end