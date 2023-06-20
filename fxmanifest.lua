fx_version 'bodacious'
game 'gta5'

author 'Sisyphus'
description 'A tool to block and ban players attempting to exploit with nuidevtools'
version '1.0.0'

shared_scripts {
	'@qb-core/shared/locale.lua',
}

client_script "client/main.lua"

server_script {
	'@oxmysql/lib/MySQL.lua',
	"server/main.lua",
	"server/permissions.lua"
}

ui_page 'html/index.html'

files {
	'html/index.html',
    'html/app.js'
    
}
