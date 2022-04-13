class ActivitiesController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    def index
        act = Activity.all
        render json: act
    end

    def destroy
        act = Activity.find(params[:id])
        act.destroy
        head :no_content
    end

    private

    def unprocessable_entity_response invalid
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def not_found_response
        render json: {error: "Activity not found"}, status: :not_found
    end
end
