--[[
  _  ___    _ ____          _   _    _____  ________      ________ _      ____  _____  __  __ ______ _   _ _______ _____ 
 | |/ / |  | |  _ \   /\   | \ | |  |  __ \|  ____\ \    / /  ____| |    / __ \|  __ \|  \/  |  ____| \ | |__   __/ ____|
 | ' /| |  | | |_) | /  \  |  \| |  | |  | | |__   \ \  / /| |__  | |   | |  | | |__) | \  / | |__  |  \| |  | | | (___  
 |  < | |  | |  _ < / /\ \ | . ` |  | |  | |  __|   \ \/ / |  __| | |   | |  | |  ___/| |\/| |  __| | . ` |  | |  \___ \ 
 | . \| |__| | |_) / ____ \| |\  |  | |__| | |____   \  /  | |____| |___| |__| | |    | |  | | |____| |\  |  | |  ____) |
 |_|\_\\____/|____/_/    \_\_| \_|  |_____/|______|   \/   |______|______\____/|_|    |_|  |_|______|_| \_|  |_| |_____/ 
                                                                                                                                                                                                                                                 
https://discord.gg/HncSBc47Pr | @Kuban
]]--
fx_version 'cerulean'
game 'gta5'
author 'KubanScripts'
description 'Spawnselector'
version '1.0.0'
lua54 'yes'

client_scripts {
    'config.lua',
    'client.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
}


dependencies {
    'qb-core',
    'ox_lib'
}
