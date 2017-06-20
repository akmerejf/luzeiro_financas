module AtivosHelper
	def sti_ativo_path(type = "ativo", ativo = nil, action = nil)
	  send "#{format_sti(action, type, ativo)}_path", ativo
	end

	def format_sti(action, type, ativo)
	  action || ativo ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
	end

	def format_action(action)
	  action ? "#{action}_" : ""
	end
end
