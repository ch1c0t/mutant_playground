require 'mutant'
require 'pry'

source = <<~S
  module M
    def im
      1 == 1
    end

    def self.sm
      :symbol
    end
  end
S

binding.pry
nodes = Parser::CurrentRuby.parse source
mutations = Mutant::Mutator.mutate nodes
mutations
# Unparser.unparse node
