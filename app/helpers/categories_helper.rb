module CategoriesHelper

	def photo_for_category(cateory)
		category.photos.each do |photo|
		  photo.present? image_tag photo.image_url(:cat_main_thumb).to_s : image_tag "dummy_325x210.png"
		end
	end
end