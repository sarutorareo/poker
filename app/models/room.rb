class Room < ActiveRecord::Base
  def tern_chat?
    if (id == 1)
      return true
    else
      return false
    end

  end
end
