module CategoriesHelper

	def photo_for_category(category)
		category.photos.each do |photo|
		  if photo.present? 
		  	image_tag photo.image_url(:cat_main_thumb).to_s
		  else	 
		  	image_tag "dummy_325x210.png"
		  end 
		end
	end
end