class TodoItemsController < ApplicationController
    before_action :set_todo

    def create
        @todo_item = @todo.todo_items.create(todo_item_params)
    end


    private

    def set_todo
        @todo = Todo.find(params[:todo_id])
    end

    def todo_item_params
        params.require(:todo_item).permit(:content)
    end
end