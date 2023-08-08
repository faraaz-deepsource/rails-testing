# module FinancialType
#   def self.find_by_name(name)
#     # do something
#   end
# end

def pending_changes_financial_types(types)
  types.map { |ft| FinancialType.find_by_name(ft) }
end
