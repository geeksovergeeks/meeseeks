defmodule Meeseeks.Selector.XPath.Expr.Predicate do
  @moduledoc false

  use Meeseeks.Selector.XPath.Expr

  alias Meeseeks.Selector.XPath.Expr

  defstruct e: nil

  def eval(expr, node, document, context) do
    case Expr.eval(expr.e, node, document, context) do
      :NaN -> false
      :Infinity -> false
      :"-Infinity" -> false
      n when is_number(n) -> n == Expr.Helpers.position(node, context)
      x -> Expr.Helpers.boolean(x, document)
    end
  end
end
