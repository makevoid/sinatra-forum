module FormHelpers

  def label(field, options)
    haml_tag(:label, for: field){ haml_concat options[:label] || field.to_s.capitalize }
  end

  def input(object, field, options={})
    label field, options
    name = object.class.name.downcase
    attributes = { type: "text", name: "#{name}[#{field}]", id: field, value: object.send(field) }
    options.delete :label
    haml_tag(:input, attributes.merge(options) )
  end

  def textarea(object, field, options={})
    label field, options
    name = object.class.name.downcase
    attributes = { name: "#{name}[#{field}]", id: field }
    options.delete :label
    haml_tag(:textarea, attributes.merge(options) ){ haml_concat object.send(field) }
  end

  def validations_for(object)
    haml_tag :div, class: "validations" do
      errors = object.errors.map{ |e| e }.flatten
      errors.each do |message|
        haml_tag(:p) { haml_concat message }
      end
    end unless object.errors.empty?
  end

end