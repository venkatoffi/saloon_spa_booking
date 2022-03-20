namespace :add_apple_to_basket do 
  desc "Addming apple to basket"
  task :add, [:variety, :count] => [:environment] do |task, args|
    begin
      data = args.to_a
      range = Basket.capacity_check.present? ? (1..data[1].to_i).to_a : []
      raise StandardError.new "Alls baskets are full. We couldn't find the place for #{data[1]} apples" unless range.present?
      remaining_apples = 0
      range.each do |rec|
        if Basket.zero_or_one_apple.present?
          Apple.create(variety: data[0], basket_id: Basket.zero_or_one_apple.first.id)
        elsif Basket.capacity_check.present?
          Apple.create(variety: data[0], basket_id: Basket.capacity_check.first.id)
        else
          remaining_apples += 1
        end
      end
      raise StandardError.new "All baskets are full. We couldn't find the place for #{remaining_apples} apples" unless remaining_apples == 0
    rescue StandardError => e
      raise StandardError.new e.message 
    end
  end
end



class Basket < ApplicationRecord
  has_many :apple
  scope :zero_or_one_apple, ->(limit) { where("id NOT IN (SELECT DISTINCT(basket_id) FROM baskets inner join apples on apples.basket_id = baskets.id group by apples.basket_id having count(apples.basket_id) >= #{limit})") }
  scope :capacity_check, -> { where("id NOT IN (SELECT DISTINCT(basket_id) FROM baskets inner join apples on apples.basket_id = baskets.id group by apples.basket_id having count(apples.basket_id) >= baskets.capacity)") }
end