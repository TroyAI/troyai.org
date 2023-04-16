require "test_helper"

class AiModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ai_model = ai_models(:one)
  end

  test "should get index" do
    get ai_models_url
    assert_response :success
  end

  test "should get new" do
    get new_ai_model_url
    assert_response :success
  end

  test "should create ai_model" do
    assert_difference("AiModel.count") do
      post ai_models_url, params: { ai_model: { description: @ai_model.description, name: @ai_model.name, score: @ai_model.score, user_id: @ai_model.user_id } }
    end

    assert_redirected_to ai_model_url(AiModel.last)
  end

  test "should show ai_model" do
    get ai_model_url(@ai_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_ai_model_url(@ai_model)
    assert_response :success
  end

  test "should update ai_model" do
    patch ai_model_url(@ai_model), params: { ai_model: { description: @ai_model.description, name: @ai_model.name, score: @ai_model.score, user_id: @ai_model.user_id } }
    assert_redirected_to ai_model_url(@ai_model)
  end

  test "should destroy ai_model" do
    assert_difference("AiModel.count", -1) do
      delete ai_model_url(@ai_model)
    end

    assert_redirected_to ai_models_url
  end
end
