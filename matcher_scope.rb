require 'mutant'
require 'pry'

module M
  def m
  end
end

binding.pry
scope = Mutant::Matcher::Scope.new M
scope
