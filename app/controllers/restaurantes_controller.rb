class RestaurantesController < ApplicationController
	def index
		@restaurantes = Restaurante.paginate :page=>params['page'], :per_page=>3
		respond_to do |format|
			format.html
			format.xml{render :xml=>@restaurantes}
		end
	end
	def show
		@restaurante = Restaurante.find(params[:id])
	end
	def new
		@restaurante = Restaurante.new
	end
	def create
		@restaurante = Restaurante.new(params[:restaurante])
		if @restaurante.save
			flash[:notice]="Gravado com sucesso!"
			redirect_to(:action=>"show", :id=>@restaurante)

		else
			#flash[:notice]="Verifique os dados inseridos!"
			render :action=>"new"

		end
	end
	def edit
		@restaurante = Restaurante.find(params[:id])
	end
	def update
		@restaurante = Restaurante.find(params[:id])
		if @restaurante.update_attributes(params[:restaurante])
			redirect_to(:action=>"show", :id=>@restaurante)
		else
			render :action=>"edit"
		end
	end
	def destroy
		@restaurante = Restaurante.find(params[:id])
		@restaurante.destroy
	
		redirect_to(:action=>"index")
	end
	def busca
		@restaurantes = Restaurante.find :all, :conditions=>"especialidade='#{params[:especialidade]}'"
		render :action=>"index"
	end
	def data
		puts params[:ano]
	end
end
