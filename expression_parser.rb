require 'mutant'
require 'pry'

expression_parser = Mutant::Expression::Parser.new [
  Mutant::Expression::Method,
  Mutant::Expression::Methods,
  Mutant::Expression::Namespace::Exact,
  Mutant::Expression::Namespace::Recursive,
]

string = 'invalid'

binding.pry
expression = expression_parser.call string
expression
