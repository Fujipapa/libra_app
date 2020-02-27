module ApplicationHelper

    def full_title(page_title = '')
        base_title = 'LIBRA'
        if page_title.empty?
            base_title
        else
            "#{page_title} | #{base_title}"
        end
    end

    def propriety_char(bool)
        bool ? "可" : "不可"
		end

end
