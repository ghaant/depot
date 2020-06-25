require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the index" do
    login_dave

    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    login_dave

    visit users_url
    click_on "New User"
    fill_in "Name", with: 'Vasya'
    fill_in "Password", with: 'blah'
    fill_in "Confirm", with: 'blah'
    click_on "Create User"

    assert_text "User Vasya was successfully created"
  end

  test "updating a User" do
    login_dave

    visit users_url
    all("body > section > main > table > tbody > tr").last.click_on('Edit')
    fill_in "Name", with: 'Vasya'
    fill_in "Password", with: 'blah'
    fill_in "Confirm", with: 'blah'
    click_on "Update User"

    assert_text "User Vasya was successfully updated"
  end

  test "destroying a User" do
    login_dave

    visit users_url
    user_to_destroy = all("body > section > main > table > tbody > tr").last
    user_to_destroy_name = user_to_destroy.all('td').first.text
    page.accept_confirm do
      user_to_destroy.click_on('Destroy')
    end

    assert_text "User #{user_to_destroy_name} was successfully destroyed"
  end

  def login_dave
    visit login_url
    fill_in "Name", with: 'dave'
    fill_in "Password", with: 'secret'
    click_on "Login"
  end
end
