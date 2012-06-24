# encoding: utf-8

module ApplicationHelper
  
  # Returns the full title on a per-page basis.
    def full_title(page_title)
      base_title = t("crm.title.full")
      if page_title.empty?
        base_title
      else
        "#{base_title} | #{page_title}"
      end
    end
    
    def title()
      t("crm.title.small")
    end
end
