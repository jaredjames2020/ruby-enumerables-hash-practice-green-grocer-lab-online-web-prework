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
   new_cart = Hash.new
   cart.each do |key,value|
     new_cart[key]=value
      coupons.each do |x|
  #      binding.pry
       if coupons[0][:item] == new_cart.keys
  #       binding.pry
         coupons[1][:num] 
          new_cart["AVOCADO W/COUPON"] = 0
  #   item.each do |x|
  #       if new_cart[key] == nil   
  #        new_cart[key] = value
  #       new_cart[key] = coupons
  #       binding.pry
  #     # else
  #     #   new_cart[key][:coupons]
        end
     end
   end
   new_cart
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
