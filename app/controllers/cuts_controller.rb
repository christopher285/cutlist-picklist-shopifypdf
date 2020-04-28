#ApplicationController
class CutsController < ShopifyApp::AuthenticatedController

  before_action :set_cut, only: [:show, :edit, :update, :destroy]
 # before_action :set_shop, only: [:show, :edit, :update, :destroy]
  # GET /cuts
  # GET /cuts.json
  def index
    @cuts = Cut.where(done: false)
    #@orders  = ShopifyAPI::Order.find(:all)

end


  # GET /cuts/1
  # GET /cuts/1.json
  def show
  end

  # GET /cuts/new
  def new
 @cuts    = Cut.uniq.pluck(:orderid)
 @orders  = ShopifyAPI::Order.find(:all)
#.select {|order| validate_uniqueness_of() }

@orders.delete_if { |x| @cuts.include?(x.name) }

@orders.each do |element|
  
    @name = element.name
    

   element.line_items.each do |line_item|
   @cut = Cut.new	
    @cut.orderid = @name 
    @cut.product =  line_item.title
    @cut.size    =  line_item.variant_title 
    @cut.quantity = line_item.quantity
#if    Cut.exists? (:product => line_item.title) && Cut.exists?(:orderid => @name) && (:size => line_item.size) && (:quantity => line_item.quantity)
 #   else   
    @cut.save!
     
  
#  end    
  end
  end 
 redirect_to cuts_url  
end


  # GET /cuts/1/edit
  def edit
  end

  # POST /cuts
  # POST /cuts.json
  def create
    @cut = Cut.new(cut_params)

    respond_to do |format|
      if @cut.save
        format.html { redirect_to @cut, notice: 'Cut was successfully created.' }
        format.json { render :show, status: :created, location: @cut }
      else
        format.html { render :new }
        format.json { render json: @cut.errors, status: :unprocessable_entity }
      end
    end
  end

def checked
  @cut = Cut.find(params[:cut_ids])
    @newlist = List.new
      @listid = List.pluck(:listnumber).max+1
      @newlist.listnumber = @listid 
      @newlist.save

  
    @cut.each do |element|
        element.done = true
	element.list_id = @listid
        element.save
    end


redirect_to list_path(id: @listid) 

end

#def delete
#  @cut = Cut.find(params[:cut_ids])
#  @cut.each do |element|
#                element.destroy
    
#end
#respond_to do |format|
#      format.html { redirect_to cuts_url, notice: 'some cuts were successfully destroyed.' }
#      format.json { head :no_content }
#end
#end


  # PATCH/PUT /cuts/1
  # PATCH/PUT /cuts/1.json
  def update
    respond_to do |format|
      if @cut.update(cut_params)
        format.html { redirect_to @cut, notice: 'Cut was successfully updated.' }
        format.json { render :show, status: :ok, location: @cut }
      else
        format.html { render :edit }
        format.json { render json: @cut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuts/1
  # DELETE /cuts/1.json
  def destroy
    @cut.destroy
    respond_to do |format|
      format.html { redirect_to cuts_url, notice: 'Cut was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cut
      @cut = Cut.find(params[:id])
    end
   # def set_shop
   #   shop = Shop.find(1)
   #   ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
   # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cut_params
      params.require(:cut).permit(:orderid, :product, :quantity)
    end
end
