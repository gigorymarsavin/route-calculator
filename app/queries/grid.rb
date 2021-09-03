class Grid
  attr_accessor :sort, :per_page, :page, :current_user

  def initialize(params)
    @page = params[:page]
    @per_page = params[:per_page] || 5
    @sort = params[:sort] || 'created_at'
    @current_user = params[:current_user]
  end

  def self.call(params)
    new(params).call
  end

  def call 
    base_relation
    execute_sort 
    execute_paginate
  end

  def execute_sort 
    raise NotImplementedError, "#{self.class} has not method: #{__method__}"
  end

  def execute_paginate
    raise NotImplementedError, "#{self.class} has not method: #{__method__}"
  end
  

end