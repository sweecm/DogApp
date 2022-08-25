# Copyright (c) 2022 sweecm Software

require 'json'
require 'net/http'

module TheDogApi
  class Client
    # Perform images search and return all results as JSON
    def images_search
      response = Net::HTTP.get_response(URI('https://api.thedogapi.com/v1/images/search'))

      JSON.parse(response.body)
    end
  end
end
