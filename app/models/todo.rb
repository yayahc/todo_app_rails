class Todo < ApplicationRecord
    belongs_to :user

    validates_presence_of :title

    has_rich_text :description

    # Ennumerate status
    enum status: {
        incomplete: false,
        complete: true
    }
end