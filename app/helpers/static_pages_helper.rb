module StaticPagesHelper
  
  def show_label_tag(label)
    label_tag label, label+":", :class => "strong"
  end  
end
