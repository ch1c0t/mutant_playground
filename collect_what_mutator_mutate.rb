require 'mutant'
require 'pry'

module Spy
  ELEMENTS = []

  def mutate node, parent = nil
    ELEMENTS << [node, parent]
    super
  end
end

Mutant::Mutator.singleton_class.prepend Spy

module M
  def im
    1 == 1
  end

  def self.sm
    :symbol
  end
end

c = Mutant::Config::DEFAULT
config = c.with \
  matcher: c.matcher.add(:match_expressions, c.expression_parser.(M.name)),
  integration: Mutant::Integration.setup(Kernel, 'rspec')

Mutant::Runner.call Mutant::Env::Bootstrap.call config

binding.pry
Spy::ELEMENTS
