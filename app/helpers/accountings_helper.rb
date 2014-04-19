module AccountingsHelper
  
  def money(amount)
    output = "<span class='money-"
    if(amount.nil?)
        output += "zero'>0.00</span>"
      else
      if(!amount.nil? && amount >= 0)
        output += "positive'>"
      else
        output += "negative'>"
      end
      output += number_to_currency(amount.round(2) ,:unit=>'€', :separator=>",",delimiter:".", format: "%n %u")
      output += "</span>"
    end
      
    return output.html_safe
  end
end
