require 'spec_helper'
require 'rails_helper'


describe 'home page' do
  it 'welcomes the user' do
    visit '/'
    page.find('h1').text.should eq('Taco Quest')
  end

  it 'should not accept empty tacos' do
    visit '/'
    find('#salsa_select_all').click
    find('#city_select_all').click
    click_button('Search')
    sleep(2)

    page.find('h1').text.should eq('Taco Quest')
  end

  it 'should not accept empty salsas' do
    visit '/'
    find('#taco_select_all').click
    find('#city_select_all').click
    click_button('Search')
    sleep(2)

    page.find('h1').text.should eq('Taco Quest')
  end

  it 'should not accept empty city' do
    visit '/'
    find('#taco_select_all').click
    find('#salsa_select_all').click
    click_button('Search')
    sleep(2)

    page.find('h1').text.should eq('Taco Quest')
  end

end

describe 'taco_page' do
  it 'selects tacos', :js => true do
    visit '/'
    find('#taco_select_all').click
    find('#salsa_select_all').click
    find('#city_select_all').click
    click_button('Search')
    sleep(2)

    page.find('h1').text.should eq('Taco Results')

  end

  it 'can go back to search again', :js => true do
    visit '/'
    find('#taco_select_all').click
    find('#salsa_select_all').click
    find('#city_select_all').click

    click_button('Search')
    sleep(2)

    puts page.body

    click_link('Search Again')
    sleep(2)

    page.find('h1').text.should eq('Taco Quest')

  end
end