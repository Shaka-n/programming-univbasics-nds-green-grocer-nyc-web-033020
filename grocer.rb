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
  index = 0 
  new_items=[]
  while index < coupons.size do 
    item = find_item_by_name_in_collection(coupons[index][:item], cart)
    couponed_item_name = "#{coupons[index][:item]} W/COUPON"
    item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    if item && item[:count] >= coupons[index][:num]
      if item_with_coupon
        item_with_coupon[:count] += coupons[index][:num]
        item[:count] -= coupons[index][:num]
      else
        item_with_coupon = {
          :item => couponed_item_name,
          :price => coupons[index][:cost] / coupons[index][:num],
          :clearance => item[:clearance],
          :count => coupons[index][:num]
        }
        cart << item_with_coupon
        item[:count] -= coupons[index][:num]
      end
    end 
    index += 1
  end
  cart
end

def apply_clearance(cart)
  index = 0 
  while index < cart.length do 
    if cart[index][:clearance] == true
      cart[index][:price] = (cart[index][:price] * 0.8).round(2)
      index += 1
    else
      index += 1
    end
  end
   return cart
end

def checkout(cart, coupons)
  con_cart = consolidate_cart(cart)
  coup_cart = apply_coupons(con_cart, coupons)
  final_cart = apply_clearance(coup_cart)
  total = 0 
  index = 0 
  while index < final_cart.length do
    total += (final_cart[index][:price] * final_cart[index][:count])
    index += 1 
  end
  if total > 100 
    total -= (total * 0.10)
  end
  return total
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
