class LabelPdf < Prawn::Document

def initialize(label)
#   cm's x pixels
# 1cm = 28.346464pixels   
@width  = 5.5*28.346464 
@height = 2.5*28.346464
   
   super(top_margin: 15, bottom_margin: 10, :page_size => [@width,@height])
   @label = label
   @sortedlist = @label.cuts.sort_by{|a| a.product} 
 #  order_number
  # line_items
   line_item_rows
end

#def order_number

#   text "Cutlist \##{@label.listnumber}", size: 30, Style: :bold
#   text "New Doc" , size: 30 , Style :bold
#end

def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..2).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def line_item_rows
@sortedlist.map do |item|

text "Order ID : #{item.orderid}", :size => 6
text "Product: #{item.product}",  :size => 6 
text "Size: #{item.size}",  :size => 6
text "Quantity: 1 of #{item.quantity}",  :size => 6
start_new_page
#text "Order id"
#    text "Product"
#    text "Size"+" "+"Quantity"

#    @sortedlist.map do |item|
 #    [item.orderid, item.product,item.size, item.quantity]
    end
  end

end
