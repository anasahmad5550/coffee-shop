# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include BaseHandler
      before_action :serialize_data, only: %i[index show update destroy]

      def index
        render json: serialize_data
      end

      def show
        render json: resource
      end

      def create
        if new_resource.save
          render json: new_resource, status: :created
        else
          render json: { message: new_resource.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if resource.update(permitted_params)
          render json: resource
        else
          render json: { message: resource.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if resource.destroy
          render json: { message: 'Successfully Deleted' }, status: :ok
        else
          render json: { message: resource.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def authorization
        authorize(current_user)
      end

      protected

      def new_resource
        @new_resource ||= model.new(permitted_params)
      end

      def resource
        @resource ||= model.find(params[:id])
      end

      def collection
        @collection ||= model.all
      end

      def serialize_data
        serialized_data = ActiveModelSerializers::SerializableResource.new(collection, each_serializer: serializer)
        { results: serialized_data }
      end

      def serializer
        "Api::V1::#{model}Serializer".constantize
      end
    end
  end
end
