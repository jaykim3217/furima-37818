class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :buy

end
