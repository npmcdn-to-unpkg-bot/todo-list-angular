module Api
  module V1
    class TasksController < ApplicationController
      load_and_authorize_resource :project
      load_and_authorize_resource :task

      def create
        respond_with(:api, :v1, @project.tasks.create(task_params))
      end

      def update
        respond_with(:api, :v1, @task.update(task_params))
      end

      def destroy
        respond_with(:api, :v1, @task.destroy)
      end

      private

        def task_params
          params.permit(:id, :title, :position, :project_id, :completed, :end_date)
        end
    end
  end
end
