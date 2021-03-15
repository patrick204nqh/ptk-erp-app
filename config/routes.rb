Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Dir.glob(Rails.root.join('engines').to_s + "/*") do |d|
  #   eg = d.split(/[\/\\]/).last
	# 	if eg != "backend" and Erp::Backend.available?(eg)
	# 		mount "Erp::#{eg.camelize}::Engine".constantize => "/", as: 'erp_' + eg
	# 	end
  # end
  mount Erp::Backend::Engine => "/", as: "erp"
end
