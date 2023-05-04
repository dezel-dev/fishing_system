---@author Dezel

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Dezel'
description 'ESX Fisher System'
version '1.0.0'

shared_script 'shared/*.lua'
client_script {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
    'client/*.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}