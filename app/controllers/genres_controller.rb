class GenresController < ApplicationController

    def index
        @genres = Genre.all
    end

    def show
        @genre = Genre.find(params[:id])
        @films = @genre.films
    end

    def new 
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(name: params[:genre][:name])

        if @genre.save
           flash.notice = 'Cadastrado com sucesso!'
           return redirect_to(new_genre_path)
        end

        render :new
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])

        if @genre.update(name: params[:genre][:name])
            flash.notice = 'Editado com sucesso!'
            return redirect_to(edit_genre_path)
            end
    
            render :edit

    end

end