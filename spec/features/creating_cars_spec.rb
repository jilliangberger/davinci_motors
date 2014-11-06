require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create and save a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang 2300.0 created')

    visit '/'
    expect(page).to have_content('Ford')
    expect(page).to have_content('Mustang')
    expect(page).to have_content('1967')
    expect(page).to have_content('2300')
  end
end

feature 'Viewing Cars' do
  scenario 'can view a list of cars' do
    car = Car.create(make:'Ford', model:'Mustang', year:'1967', price:'2300')
    car_2 = Car.create(make:'Subaru', model:'Legacy', year:'2003', price:'4500')
    visit '/'
    expect(page).to have_content(car.model)
    expect(page).to have_content(car.make)
    expect(page).to have_content(car.year)
    expect(page).to have_content(car.price)
    expect(page).to have_content(car_2.model)
    expect(page).to have_content(car_2.make)
    expect(page).to have_content(car_2.year)
    expect(page).to have_content(car_2.price)
  end
end

feature 'Editing a car' do
  scenario 'can edit a car' do
    car = Car.create(id:1, make:'Ford', model:'Mustang', year:'1967', price:'2300')
    visit '/cars/1/edit'

    fill_in 'Make', with: 'Toyota'
    fill_in 'Model', with: 'Camry'
    fill_in 'Year', with: '2013'
    fill_in 'Price', with: '7000'

    click_button 'Update'
    expect(page).to have_content('2013 Toyota Camry 7000.0 updated')

    expect(page).to have_content('Toyota')
    expect(page).to have_content('Camry')
    expect(page).to have_content('2013')
    expect(page).to have_content('7000')
  end
end

