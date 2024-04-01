class FilmsController < ApplicationController

    def index
        @films = Film.all 
    end

    def show
        @film = Film.find(params[:id])
    end

    def new 
        @film = Film.new
    end

    def create
        @film = Film.new(name: params[:film][:name],
                         year: params[:film][:year],
                         genre_id: params[:film][:genre_id],
                         director_id: params[:film][:director_id]       
                  )

        if @film.save
            return redirect_to film_path(@film.id)
        end

        render :new
    end

    def edit
        @film = Film.find(params[:id])
    end

    def update
        @film = Film.find(params[:id])

        if @film.update(name: params[:film][:name],
                        year: params[:film][:year],
                        genre_id: params[:film][:genre_id],
                        director_id: params[:film][:director_id]       
                       )
             return redirect_to film_path(@film.id)
            end
    
            render :edit

    end

end