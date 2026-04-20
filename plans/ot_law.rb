require_relative '../books'

module Plan
  module_function

  def books
    Books::OT.law.map { |book, _| book }
  end
end
