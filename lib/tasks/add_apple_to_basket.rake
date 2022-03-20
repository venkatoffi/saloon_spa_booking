namespace :add_apple_to_basket do 
  desc "Addming apple to basket"
  task :add, [:variety, :count] => [:environment] do |task, args|
    begin
      data = args.to_a
      range = Basket.limit_check('capacity').present? ? (1..data[1].to_i).to_a : []
      raise StandardError.new "All baskets are full. We couldn't find the place for #{data[1]} apples." unless range.present?
      remaining_apples = 0
      cut_off = false
      range.each do |rec|
        zero_or_one = Basket.limit_check(2) unless cut_off
        capacity_check = Basket.limit_check('capacity')
        if zero_or_one.present?
          Apple.create(variety: data[0], basket_id: zero_or_one.first.id)
        elsif capacity_check.present?
          cut_off = true
          Apple.create(variety: data[0], basket_id:capacity_check.first.id)
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