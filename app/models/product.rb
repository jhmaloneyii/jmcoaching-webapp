class Product < ApplicationRecord
  belongs_to :product_type
  serialize :properties, Hash

  validates :product_type_id, presence: true

  validate :validate_required

  def validate_required
    product_type.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must not be blank"
      end
    end

  end

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from Cart"
    else
      "Add to Cart"
    end
  end
end
