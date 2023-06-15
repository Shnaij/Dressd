json.top render(partial: "outfits/items_carousel", formats: :html, locals: {items: @tops, message: @tops_message, category: "Tops"})
json.bottom render(partial: "outfits/items_carousel", formats: :html, locals: {items: @bottoms, message: @bottoms_message, category: "Bottoms"})
json.shoes render(partial: "outfits/items_carousel", formats: :html, locals: {items: @shoes, message: @shoes_message, category: "Shoes"})
json.dresses render(partial: "outfits/items_carousel", formats: :html, locals: {items: @dresses, message: @dresses_message, category: "Dresses"})
