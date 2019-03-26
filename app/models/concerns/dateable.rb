module Dateable
  extend ActiveSupport::Concern

  included do
    scope :by_date, -> (initial_date, final_date) { where('opening_date <= ? AND closing_date >= ?', initial_date.to_date, final_date.to_date) }
  end
end
