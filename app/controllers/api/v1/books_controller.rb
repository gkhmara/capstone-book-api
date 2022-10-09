module Api
  module V1
    class BooksController < ApplicationController
      # ALLOWED_DATA = %[title author rating].freeze

      def index
        books = Book.all
        books = books.where(author: params[:search]) if params[:search] != ""
        books = books.sort_by{|e| e[params[:sort]]} if params[:sort] != ""

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
          rating: params[:rating],
          cover: params[:cover]
        )
        render json: book
      end

      def update
        book = Book.find(params[:id])
        book.update(
          title: params[:title],
          author: params[:author],
          rating: params[:rating],
          cover: params[:cover]
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

