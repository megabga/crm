module GuaraViewsHelper
  
  def format_boolean(value)
    value ? t("yes"):t("no")
  end
  
end