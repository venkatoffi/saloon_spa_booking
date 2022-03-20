module Blending

  def self.included(base)
    base.class_eval do
      after_save :make_juice if self.to_s == 'Apple'
    end
  end

  def make_juice
    p 'Do after save call back action here for Apple model only'
  end
end