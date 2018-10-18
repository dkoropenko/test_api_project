class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_json(opts={})
    opts.merge!(:except => [:created_at, :updated_at])
    super(opts)
  end
end
