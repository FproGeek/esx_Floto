description 'ESX Floto'

version '1.0.0'

author 'FproGeek'

client_script {
	"config.lua",
	"client/main.lua"
}
server_script {
	"@mysql-async/lib/MySQL.lua",
	"server/main.lua"	
}
