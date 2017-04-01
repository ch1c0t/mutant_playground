require 'mutant'
require 'pry'

module M
  def a
    1 == 1
  end

  def b
    1 == 0
  end
end

c = Mutant::Config::DEFAULT
config = c.with \
  matcher: c.matcher.add(:match_expressions, c.expression_parser.(M.name)),
  integration: Mutant::Integration.setup(Kernel, 'rspec')

binding.pry
filter = Mutant::Matcher::Compiler.call config.matcher
filter
