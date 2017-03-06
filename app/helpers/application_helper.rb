module ApplicationHelper
  def make_active_if_is(path)
    'active' if request.env['PATH_INFO'] == path
  end
end
