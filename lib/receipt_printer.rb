class ReceiptPrinter
  COST = {
    'meat' => 5,
    'milk' => 3,
    'candy' => 1,
  }

  TAX = 0.05
  NUM = '$%.2f'

  def initialize(output: $stdout, items:)
    @output = output
    @items = items
  end

  def print
    subtotal = items.reduce(0) do |sum, item|
      output.puts sum_calculator(item, item_cost(item))
      sum + item_cost(item).to_i
    end

    output.puts divider
    output.puts sum_calculator('subtotal', subtotal)
    output.puts sum_calculator('tax', subtotal * TAX)
    output.puts divider
    output.puts sum_calculator('total',  subtotal + (subtotal * TAX))
  end

  private

  attr_reader :output, :items

  def divider
    '-' * 13
  end

  def item_cost(item)
    COST[item]
  end

  def sum_calculator(title, value)
    "#{title}: #{sprintf(NUM, value)}"
  end
end
