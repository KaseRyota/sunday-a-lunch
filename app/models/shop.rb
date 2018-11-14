class Shop < ActiveRecord::Base
    mount_uploader :photo, PhotoUploader
end
