class Basket < ApplicationRecord
  has_many :apple
  scope :limit_check, ->(limit) { where("id NOT IN (SELECT DISTINCT(basket_id) FROM baskets inner join apples on apples.basket_id = baskets.id group by apples.basket_id having count(apples.basket_id) >= #{limit})") }
end



# "SELECT * FROM baskets WHERE id NOT IN (SELECT DISTINCT(apples.basket_id) FROM apples GROUP BY apples.basket_id HAVING (COUNT(apples.basket_id) <= 1))"