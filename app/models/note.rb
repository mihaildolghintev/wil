class Note < ApplicationRecord
  has_rich_text :content

  has_one :content, class_name: 'ActionText::RichText', as: 'record'
end
