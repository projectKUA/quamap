class Qua < ActiveRecord::Base
  def self.random
    order("random()").limit(1)
  end
  def self.center
    random = Qua.random
    center = random[0] unless random.nil? 
    if center.nil? || center["latitude"] == nil || center["longitude"] == nil
      q = Qua.new
      q.latitude = 38.743224
      q.longitude = 140.715955
      center = q
    end
    center
  end
end
