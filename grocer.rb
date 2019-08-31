require 'pry'

def consolidate_cart(cart)
  # code here
  new_cart = Hash.new
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
                                      price => coupon[:cost] / coupon[:num], 
                                      clearance => cart[item][:clearance], 
                                      count => [coupon][:num]
                                      }
        elsif cart[item][:count] >= coupon[:num] && cart.has_key?["#{item} W/COUPON"]
          cart["#{item} W/COUPON"][:count] += coupon[:num]
        end
          cart[item][:count] -= coupon[:num]
      end
    end 
  cart  
end








#def consolidate_cart(cart)
  # code here
#end

# def apply_coupons(cart, coupons)
#   # code here
# end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
