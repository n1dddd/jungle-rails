class Admin::AdminCategoriesController < ApplicationController
    http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
  password: ENV["HTTP_BASIC_PASSWORD"]
    
    def index
        @categories = Category.order(id: :desc).all
    end

    def new
    end

    def create
    end

end
