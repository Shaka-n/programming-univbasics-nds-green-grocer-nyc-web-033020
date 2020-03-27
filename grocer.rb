def find_item_by_name_in_collection(name, collection)
  index = 0
  while index < collection.size do 
    if collection[index][:item] == name
      return collection[index]
    else
      index += 1
    end
  end
  return nil
end

def consolidate_cart(cart)
  con_cart = []
  index = 0 
  while index < cart.size do 
    con_cart[index] = cart[index]
    if con_cart[index][:count]
      con_cart[index][:count] += 1 
      index += 1
    else 
      con_cart[index][:count] = 1 
      index += 1
    end 
  end
return con_cart
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end

def apply_coupons(cart, coupons)
  new_items=[]
  coupon_index = 0 
  while coupon_index < coupons.size do 
    item = find_item_by_name_in_collection(coupons[coupon_index][:item], cart)
    couponed_item_name =
    while cart_index < cart_size do 
      if coupons[coupon_index][:item] == cart[cart_index][:item] && cart[cart_index][:count] >= coupons[coupon_index][:num]
       item[:item] << cart[cart_index][:item] << " W/COUPON"
       item[:clearance] = cart[cart_index][:clearance]
        while cart[cart_index][:count] >= coupons[coupon_index][:num] do
          item[:count] = item[:count] + coupons[coupon_index][:num]
          cart[cart_index][:count] = cart[cart_index][:count] - coupons[coupon_index][:num]
        end
        item[:price] = (item[:count] / coupons[coupon_index][:cost])
        new_items << item
        coupon_index += 1
        cart_index = 0 
      else
        cart_index += 1
      end 
    end
    coupon_index+=1 
  end
  return cart

end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
