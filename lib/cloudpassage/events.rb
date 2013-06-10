module Cloudpassage
  class Events < Base
    include Collection

    def singleton_class
      Event
    end
  end

  class Event < Single
  end
end