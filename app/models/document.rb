class Document < ActiveRecord::Base

	mount_uploader :doc, DocUploader
	belongs_to :documentable, :polymorphic => true
end
