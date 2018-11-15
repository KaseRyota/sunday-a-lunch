class Shop < ActiveRecord::Base
    attr_accessor :photo
    mount_uploader :photo, PhotoUploader
end
