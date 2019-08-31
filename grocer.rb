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
  coupons.each do |product|
    item = coupon_hash[:item]
    new_coupon_hash = {
      :price => coupon_hash[:cost],
      :clearance => "true",
      :count => coupon_hash[:num]
    }
    
     if cart.key?(fruit_name)
      new_coupon_hash[:clearance] = cart[fruit_name][:clearance]
      if cart[fruit_name][:count]>= new_coupon_hash[:count]
        new_coupon_hash[:count] = (cart[fruit_name][:count]/new_coupon_hash[:count]).floor
        cart[fruit_name][:count] = (coupon_hash[:num])%(cart[fruit_name][:count])
      end
      cart[fruit_name + " W/COUPON"] = new_coupon_hash 
    end
    end
  return cart
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
