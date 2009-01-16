class Dojo < ActiveRecord::Base
  has_many :participants
  
  validates_presence_of :date
  
  def self.next_date
     dojo = Dojo.find(:first, :conditions => ["date > ?", Time.now - 7.days], :order => "date DESC")
     
     if dojo.nil?
       now = Time.now
       date = Time.gm(now.year, now.month, now.day, 19, 0)
     else
       date = dojo.date
     end
     
     date = date + 7.days
  end
end