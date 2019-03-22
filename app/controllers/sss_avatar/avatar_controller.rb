module SssAvatar
  module Account
    class AvatarController < SssAvatar::ApplicationController

      respond_to :html

      def new
        @image = scope.images.new
        respond_with(@image) do |format|
          format.html { render layout: !request.xhr? }
          format.js   { render layout: false } if request.xhr?
        end
      end

      def create
        @image = scope.images.new(permitted_image_params)
        set_viewable(@image)     
        if @image.save
          flash[:success] = Spree.t(:successfully_created, resource: @image.class.model_name.human)
          respond_with(@image) do |format|
            format.html { redirect_to account_product_images_url(@product) }
            format.js   { render layout: false }
          end
        else
          respond_with(@image) do |format|
            format.html { render action: :new }
            format.js { render layout: false }
          end
        end
      end

      def edit
        @image = Image.find(params[:id])
        respond_with(@image) do |format|
          format.html { render layout: !request.xhr? }
          format.js   { render layout: false } if request.xhr?
        end
      end

      def update
        @image = scope.images.find(params[:id])
        set_viewable(@image)
        if @image.update_attributes(permitted_image_params)
          flash[:success] = Spree.t(:successfully_updated, resource: @image.class.model_name.human)
          respond_with(@image) do |format|
            format.html { redirect_to account_product_images_url(@product) }
            format.js   { render layout: false }
          end
        else
          respond_with(@image) do |format|
            format.html { render action: :edit }
            format.js { render layout: false }
          end
        end
      end

      def destroy
        @image = scope.images.find(params[:id])
        if @image.destroy
          flash[:success] = Spree.t(:successfully_removed, resource: @image.class.model_name.human)
        else
          flash[:error] = @object.errors.full_messages.join(', ')
        end
        redirect_to account_product_images_url(@product)
      end

      private

      def load_index_data
        @product = Product.friendly.includes(*variant_index_includes).find(params[:product_id])
      end

      def load_edit_data
        @product = Product.friendly.includes(*variant_edit_includes).find(params[:product_id])
        @variants = @product.variants.map do |variant|
          [variant.sku_and_options_text, variant.id]
        end
        @variants.insert(0, [Spree.t(:all), @product.master.id])
      end

      def scope
        if params[:product_id]
          Spree::Product.friendly.find(params[:product_id])
        elsif params[:variant_id]
          Spree::Variant.find(params[:variant_id])
        end
      end

      def location_after_destroy
        admin_product_images_url(@product)
      end

      def set_viewable(image)
        image.viewable_type = 'Spree::Variant'
        image.viewable_id = params[:image][:viewable_id]
      end

      def variant_index_includes
        [
          variant_images: [viewable: { option_values: :option_type }]
        ]
      end

      def variant_edit_includes
        [
          variants_including_master: { option_values: :option_type, images: :viewable }
        ]
      end

      def permitted_image_params
        params[:image].present? ? params.require(:image).permit! : ActionController::Parameters.new
      end

    end
  end
end
