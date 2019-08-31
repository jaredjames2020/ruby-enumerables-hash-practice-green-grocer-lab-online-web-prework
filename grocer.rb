require 'pry'

def consolidate_cart(cart)
  # code here
  new_cart = {}
  cart.each do |item| #goes through OG array
    item.each do |key, value| #take key and values from hash of first Array
      if new_cart[key] == nil   #if first hash has no key
          new_cart[key] = value #assign first hash key a value
          new_cart[key][:count] = 1 #add the count plus 1
      else 
          new_cart[key][:count] += 1
      end
    end
  end  
  new_cart
end

def apply_coupons(cart, coupons)
  # code here
  coupons.each do |coupon|
    item = coupon[:item]
      if cart.has_key?(item)
        if cart[item][:count] >= coupon[:num] && !cart.has_key?("#{item} W/COUPON")
          cart["#{item} W/COUPON"] = {
                                      :price => coupon[:cost] / coupon[:num], 
                                      :clearance => cart[item][:clearance], 
                                      :count => coupon[:num]
                                      }
        elsif cart[item][:count] >= coupon[:num] #&& cart.has_key?["#{item} W/COUPON"]
          cart["#{item} W/COUPON"][:count] += coupon[:num]
        end
          cart[item][:count] -= coupon[:num]
      end
    end 
  cart  
end

def apply_clearance(cart)
  # code here
  cart.each do |key, value|
    if cart[key][:clearance] == true
    cart[key][:price] = (cart[key][:price] * 0.8).round(2)
    #binding.pry
   end
  end
end

def checkout(cart, coupons)
  # code here
  consol_cart = consolidate_cart(cart)
  cart_with_coupons_applied = apply_coupons(consol_cart, coupons)
  cart_with_discounts_applied = apply_clearance(cart_with_coupons_applied)

  total = 0.0
  cart_with_discounts_applied.keys.each do |item|
    total += cart_with_discounts_applied[item][:price]*cart_with_discounts_applied[item][:count]
    binding.pry
  end
  total > 100.00 ? (total * 0.90).round : total
end


#def consolidate_cart(cart)
  # code here
#end

# def apply_coupons(cart, coupons)
#   # code here
# end

# def apply_clearance(cart)
#   # code here
# end

# def checkout(cart, coupons)
#   # code here
# end
