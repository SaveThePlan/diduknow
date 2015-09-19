module PermitsAttributes
  extend ActiveSupport::Concern

  module ClassMethods
    def attributes_list
      self.attribute_names.map { |string_name| string_name.to_sym }
    end

    def nested_attributes_list
      nested_has_one_associations.inject({}) do |list,nested|
        nested_constant = nested.class_name.constantize
        list[(nested.name.to_s + '_attributes').to_sym] = nested_constant.attributes_list
        list[(nested.name.to_s + '_attributes').to_sym] << :id
        list[(nested.name.to_s + '_attributes').to_sym].uniq!
        list
      end
    end

    def nested_has_one_associations
      self.reflect_on_all_associations(:has_one).select{|a| self.nested_attributes_options.has_key? a.name}
    end

    def permits_params(params)
      if params.is_a?(ActionController::Parameters)
        params.permit(attributes_list << nested_attributes_list)
      else
        params.select { |key, value| attributes_list.include? key.to_sym }
      end
    end
  end

end
