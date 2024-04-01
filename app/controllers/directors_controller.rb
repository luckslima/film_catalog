class DirectorsController < ApplicationController

    def index
        @directors = Director.all
    end

    def show
        @director = Director.find(params[:id])
        @films = @director.films
    end

    def new 
        @director = Director.new
    end

    def create
        @director = Director.new(name: params[:director][:name])

        if @director.save
           flash.notice = 'Diretor cadastrado com sucesso!'
           return redirect_to(new_director_path)
        end

        render :new
    end

    def edit
        @director = Director.find(params[:id])
    end

    def update
        @director = Director.find(params[:id])

        if @director.update(name: params[:director][:name])
            flash.notice = 'Editado com sucesso!'
            return redirect_to(edit_director_path)
            end
    
            render :edit

    end

end