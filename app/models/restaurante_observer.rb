class RestauranteObserver < ActiveRecord::Observer
	def before_create(r)
		puts "Gravando - #{r.nome}"
	end
end
