class Todo < ApplicationRecord
    validates_presence_of :title

    # Ennumerate status
    enum status: {
        incomplete: false,
        complete: true
    }
end