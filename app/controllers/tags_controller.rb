class TagsController < ApplicationController

  ActsAsTaggableOn.remove_unused_tags = true

  before_action :set_tag, only: [:show]

  def show
  end



  private
    def set_tag
      @tag = ActsAsTaggableOn::Tag.find(params[:id])
    end
end
