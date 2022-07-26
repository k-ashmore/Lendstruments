module ApplicationHelper
  def format_price(number)
    number_to_currency(number, unit:'¥', delimiter:',', strip_insignificant_zeros: true)
  end
end
