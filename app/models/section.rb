class Section < ActiveRecord::Base
 
 	belongs_to :pages
 	has_many :section_edits
 	has_many :editors, :through => :section_edits, :class_name => "AdminUser"
end
