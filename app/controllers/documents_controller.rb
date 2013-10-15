class DocumentsController < ApplicationController

	before_action :authenticate_user!

	private 

		#def load_photoable
		  #resource, id = request.path.split('/')[1, 2]
		  #@photoable = resource.singularize.classify.constantize.find(id)
		#end

		def document_params
		  params.require(:document).permit!
		end
end
