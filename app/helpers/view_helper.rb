module ViewHelper
	def bool_str(val)
    val ? 'Si' : 'No'
  end

  def bool_t(val)
    t("bool.#{val == true}val")
  end

  def flash_class(level)
    case level
      when "notice" then "alert alert-info"
      when "success" then "alert alert-success"
      when "error" then "alert alert-warning"
      when "alert" then "alert alert-warning"
    end
  end

  def is_nested_model?(string)
    ['vehicle_stop_period_observation', 'car', 'credit_card'].include?(string)
  end

  def model_has_show?(string)
    ['vehicle_stop_period', 'car_brand', 'bank'].include?(string)
  end

  def index_attribute_renderer(item, object)
    if lookup_context.template_exists?("#{@object.class.columns_hash[item.first].type}", "shared/attributes/index/", true)
      render partial: "shared/attributes/index/#{@object.class.columns_hash[item.first].type}", locals: {object: @object, item: @item}
    else
      render html: "<td>#{@item.last}</td>".html_safe
    end
  end

  def actions_available(name)
    actions = Action.select {|action| action.code.include?(name)}.map(&:code)
    result = ""
    actions.each{|action| result << "#{action}, "}
    result[0..-3]
  end

  def flash_success(name, action)
    { success: t('flash.successful', name: t("activerecord.models.#{name.singularize}.one"), action: t("flash.#{action}.done")) }
  end

  def flash_errors(object)
    object.errors.full_messages
  end

  def form_inputs(object)
     if object.try(:form_inputs)
      object.form_inputs
    else
      object.attribute_names - ['id']
    end
  end

  def render_index(objects, params)
    render "shared/index",  locals: { objects: objects, path: params[:controller] }
  end

  def render_form(object, params)
    render 'shared/form', locals: { object: object, path: params[:controller] }
  end

  def render_show(object, params, subclass)
    render 'shared/show', locals: {object: object, path: params[:controller], subclass: subclass}
  end
end