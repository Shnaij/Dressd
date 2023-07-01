module MetaTagsHelper
  def set_meta_tags(title, description)
    content_for(:meta_title, title)
    content_for(:meta_description, description)
  end
end
