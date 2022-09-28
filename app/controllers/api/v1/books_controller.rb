module Api
  module V1
    class BooksController < ApplicationController
      # ALLOWED_DATA = %[title author rating].freeze

      def index
        books = Book.all
        render json: books
      end

      def show
        book = Book.find(params[:id])
        render json: book
      end

      def create
        book = Book.create(
          title: params[:title], 
          author: params[:author], 
          rating: params[:rating]
        )
        render json: book
      end

      def update
        book = Book.find(params[:id])
        book.update(
          title: params[:title],
          author: params[:author],
          rating: params[:rating]
        )
        render json: book
      end

      def destroy
        books = Book.all
        book = Book.find(params[:id])
        book.destroy
        render json: books
      end

    end
  end
end

