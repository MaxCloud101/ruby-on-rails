class WelcomeController < ApplicationController
    def hello
        @variable = Pet.first.name
        @credentials = Rails.application.credentials.hello
    end
end