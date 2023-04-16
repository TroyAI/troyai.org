require "application_system_test_case"

class AiModelsTest < ApplicationSystemTestCase
  setup do
    @ai_model = ai_models(:one)
  end

  test "visiting the index" do
    visit ai_models_url
    assert_selector "h1", text: "Ai models"
  end

  test "should create ai model" do
    visit ai_models_url
    click_on "New ai model"

    fill_in "Description", with: @ai_model.description
    fill_in "Name", with: @ai_model.name
    fill_in "Score", with: @ai_model.score
    fill_in "User", with: @ai_model.user_id
    click_on "Create Ai model"

    assert_text "Ai model was successfully created"
    click_on "Back"
  end

  test "should update Ai model" do
    visit ai_model_url(@ai_model)
    click_on "Edit this ai model", match: :first

    fill_in "Description", with: @ai_model.description
    fill_in "Name", with: @ai_model.name
    fill_in "Score", with: @ai_model.score
    fill_in "User", with: @ai_model.user_id
    click_on "Update Ai model"

    assert_text "Ai model was successfully updated"
    click_on "Back"
  end

  test "should destroy Ai model" do
    visit ai_model_url(@ai_model)
    click_on "Destroy this ai model", match: :first

    assert_text "Ai model was successfully destroyed"
  end
end
