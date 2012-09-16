module StringHelper
  def name_or_empty(instance)
    instance ? instance.name : I18n.t('helpers.empty')
  end
end