class Deployment < ActiveRecord::Base
 
  scope :mci_on, where(:mci => true)
  scope :mci_off, where(:mci => false)
  scope :security_on, where(:security => true)
  scope :security_off, where(:security => false)
  scope :fdsh_on, where(:fdsh => true)
  scope :fdsh_off, where(:fdsh => false)
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
