# Copyright (c) 2022 sweecm Software

require 'the_dog_api/client'

class DogController < ApplicationController
  def initialize(*)
    # Client used for communicating with thedogapi.com
    @client = ::TheDogApi::Client.new
  end

  def index; end

  # Called when user hits 'Apply Here'
  def apply
    @dog_picture_url = @client.images_search[0]['url']
  end
end
