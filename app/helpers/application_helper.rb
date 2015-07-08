module ApplicationHelper

  def select_options_category(value)
    if value == "Stay"
      select_options_category = ['Accommodation', 'Hotel']
    elsif value == "Eat"
      select_options_category = ['Restaurant', 'Bar/cafe']
    elsif value == "Fun"
      select_options_category = ['Cinema','Cultural site','Museum/Gallery','Park',]
    elsif value == "Move"
      select_options_category = ['Public transport','Private transport']
    else
      select_options_category = ['Accommodation', 'Hotel','Bar/cafe','Cinema','Cultural site',
      'Museum/Gallery','Park','Public transport','Private transport','Restaurant']
    end
  end
end
