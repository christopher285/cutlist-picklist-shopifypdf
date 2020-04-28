class ListPdf < Prawn::Document

def initialize(list)
   super(top_margin: 70)
   @list = list
   @sortedlist = @list.cuts.sort_by{|a| a.product} 
   order_number
   line_items
   line_item_rows
end

def order_number

   text "Cutlist \##{@list.listnumber}", size: 30, Style: :bold

end

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
    [["Order id", "Product","Size", "Quantity"]] +
    @sortedlist.map do |item|
     [item.orderid, item.product,item.size, item.quantity]
    end
  end

end
