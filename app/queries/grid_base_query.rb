class GridBaseQuery < BaseQuery

  attr_accessor  :per_page, :params, :sort, :page
  def initialize(params)
    super
    @per_page = params[:per_page] || 5
    @sort = params[:sort] || 'created_at'
    @page = params[:page]
  end

  def execute_defaults 
    super
    self.relation = self.relation.order("#{sort} DESC") if sort.present?
    self.relation = self.relation.page(page).per(per_page)
  end
end
