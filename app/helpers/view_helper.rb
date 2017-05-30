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
end