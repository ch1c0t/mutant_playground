require 'mutant'
require 'pry'

module M
end

c = Mutant::Config::DEFAULT
config = c.with \
  matcher: c.matcher.add(:match_expressions, c.expression_parser.(M.name)),
  integration: Mutant::Integration.setup(Kernel, 'rspec')

binding.pry
env = Mutant::Env::Bootstrap.call config
env
