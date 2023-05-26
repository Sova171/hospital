# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Give recommendation', type: :feature do
  let(:recommendation) { Faker::JapaneseMedia::OnePiece.quote }

  before do
    create(:appointment, doctor: create(:doctor))

    # Find the log in page
    visit root_path
    find('#filter-session').click
    find('.dropdown-item', text: I18n.t('form.signed_in.log_in_doctor')).click

    # Log in as a doctor
    fill_in 'floatingPhone', with: '+380674320395'
    fill_in 'floatingPassword', with: 'vlad1972'
    find("input[type=\"submit\"][value=\"#{I18n.t('form.signed_in.log_in')}\"]").click

    # Give recommendation
    click_link I18n.t('navbar.profile').to_s
    fill_in 'appointment_recommendation', with: recommendation
    find("input[type=\"submit\"][name=\"commit\"][value=\"#{I18n.t('profile.show.update_button')}\"]").click
  end

  it 'shows closed appointments' do
    expect(page).to have_content(I18n.t('profile.show.closed_appointments'))
    expect(page).to have_content(recommendation)
  end
end
