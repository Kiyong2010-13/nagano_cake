class OrderDetali < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum making_status: { cannot_manufactured: 0, waiting_production: 1, making: 2, production_completed: 3 }
end