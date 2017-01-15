module Budgets
  class GroupsController < ApplicationController
    before_action :load_budget
    before_action :load_group
    load_and_authorize_resource :budget
    load_and_authorize_resource :group, class: "Budget::Group"

    before_action :set_default_budget_filter, only: :show
    has_filters %w[not_unfeasible feasible unfeasible unselected selected winners], only: [:show]

    def show
    end

    private

      def load_budget
        @budget = Budget.find_by(slug: params[:budget_id]) || Budget.find_by(id: params[:budget_id])
      end

      def load_group
        @group = Budget::Group.find_by(slug: params[:id]) || Budget.find_by(id: params[:id])
      end
  end
end