class PhotosController < ApplicationController

	before_action :authenticate_user!
	#before_action :find_photoable
	#layout :resolve_layout
	
	def new
	  @photo = @photoable.photos.build
	end

	def create
	  @photo = @photoable.photos.build(photo_params)

	  if @photo.save
	    redirect_to @photoable
	  else
	    render :new
	  end
	end

	def index
		@photoable = find_photoable
		@photos = @photoable.photos
	end

	private 

		#def load_photoable
		  #resource, id = request.path.split('/')[1, 2]
		  #@photoable = resource.singularize.classify.constantize.find(id)
		#end

		def photo_params
		  params.require(:photo).permit!
		end
end
