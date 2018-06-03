class TodosController < ApplicationController
    def index
        render all_todo_json
    end

    def add
        todo = Todo.new(todo_params)
        todo.done = false
        todo.time = Time.new
        if todo.text.nil?
            render json: {error: 'Invalid data'}
            return
        end
        if Todo.where(text: todo.text).length >= 1
            render json: {error: 'You have already added such task'}
            return
        end
        todo.save
        render all_todo_json
    end

    def change_done
        id = params.permit(:id)[:id]
        todo = Todo.find(id)
        todo.done = !todo.done
        todo.starttime = todo.time.strftime("%Y-%m-%d %H:%M:%S")
        todo.donetime = todo.time
        if todo.save
            render all_todo_json
        else
            render json: {error: 'Todo not found'}
        end
    end

    def delete_all
        Todo.delete_all
        render json: {success: true}
    end
    
    private
    def all_todo_json
        {json: TodoSerializer.new(Todo.all).serialized_json}
    end

    def todo_params
        params.permit(:text, :done, :time, :starttime, :donetime)
    end
end
