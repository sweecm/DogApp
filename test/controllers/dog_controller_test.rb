# Copyright (c) 2022 sweecm Software

require 'test_helper'

class DogControllerTest < ActionDispatch::IntegrationTest
  # Test to ensure root page returns a successful return code
  test 'Root page exists' do
    get '/'
    assert_response :success
  end

  # Test to ensure the following:
  # * An 'Apply Here' button exists on the page
  # * The form surrounding the button navigates to the /dog/apply endpoint
  test "'Apply Here' button exists on root page" do
    get '/'

    assert_select 'button' do |elements|
      elements.each do |element|
        assert_equal element.text, 'Apply Here'
        assert_equal element['type'], 'submit'
      end
    end

    assert_select 'form' do |elements|
      action_elements = elements.collect { |element| element['action'] }\
      # Ensure /dog/apply action is included in form on page
      assert_includes action_elements, '/dog/apply'
    end
  end

  # Test to ensure the following:
  # * The text of 'Congrats!' is displayed on the page
  # * An img element exists that references an image from thedogapi.com
  test "'Apply Here' returns appropriate content" do
    post '/dog/apply'
    assert_match 'Congrats!', @response.body
    assert_select 'img' do |elements|
      # Only one image expected on page and should reference thedogapi.com
      dog_img_element = elements.first
      assert_match(%r{.*thedogapi.com/.*}, dog_img_element['src'])
      assert_includes %w[.jpg .gif .jpeg .png], File.extname(dog_img_element['src']).downcase
    end
  end
end
