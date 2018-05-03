class Product < ApplicationRecord
  belongs_to :product_type
  serialize :properties, Hash

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
      "remove_from"
    else
      "add_to"
    end
  end
end
