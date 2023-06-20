--_________.__                      .__                  
--/   _____/|__| _________.__.______ |  |__  __ __  ______
--\_____  \ |  |/  ___<   |  |\____ \|  |  \|  |  \/  ___/
--/        \|  |\___ \ \___  ||  |_> >   Y  \  |  /\___ \ 
--/_______  /|__/____  >/ ____||   __/|___|  /____//____  >
--       \/         \/ \/     |__|        \/           \/ 

local QBCore = exports['qb-core']:GetCoreObject()

function enumerateIdentifiers(source)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        fivem = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local id = GetPlayerIdentifier(source, i)
        
        for key, value in pairs(identifiers) do
            if string.match(id, key) then
                identifiers[key] = id
                break
            end
        end
    end

    return identifiers
end

-- __________                 .____                 .__        
--\______   \_____    ____   |    |    ____   ____ |__| ____  
-- |    |  _/\__  \  /    \  |    |   /  _ \ / ___\|  |/ ___\ 
-- |    |   \ / __ \|   |  \ |    |__(  <_> ) /_/  >  \  \___ 
-- |______  /(____  /___|  / |_______ \____/\___  /|__|\___  >
--        \/      \/     \/          \/    /_____/         \/  
local function exploitBan(id, reason)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)',
        {
            GetPlayerName(id),
            QBCore.Functions.GetIdentifier(id, 'license'),
            QBCore.Functions.GetIdentifier(id, 'discord'),
            QBCore.Functions.GetIdentifier(id, 'ip'),
            'NuiDevTool Abuse',
            2147483647,
            'Sisyphus Nui Denial'
        })
    TriggerEvent('qb-log:server:CreateLog', 'snd', 'Player Banned', 'red',
        string.format('%s was banned by %s for %s', GetPlayerName(id), 'Sisyphus_Nui_Denial', reason), true)
    DropPlayer(id, 'You were permanently banned by the server for: Attempting to use nuidevtools to exploit the server.')
end

RegisterServerEvent(GetCurrentResourceName())
AddEventHandler(GetCurrentResourceName(), function()
    local src = source
    local identifier = enumerateIdentifiers(source)
    local identifierLicense = identifier.license
    local identifierDiscord = identifier.discord
    --local identifierNewMethod = identifier.Addnewmethod
    if permType == 'license' then
        local isInPermissions = false
        
        for _, v in pairs(permissions) do
            if v == identifierLicense then
             isInPermissions = true
                break
            end
        end
        
        if not isInPermissions then
            exploitBan(src)
        end
    elseif permType == 'discord' then
        local isInPermissions = false
    
        for _, v in pairs(permissions) do
            if v == identifierDiscord then
             isInPermissions = true
                break
            end
        end
    
        if not isInPermissions then
            exploitBan(src)
        end
    --[[ elseif checkmethod == 'Add New Method' then
        local isInPermissions = false
    
        for _, v in pairs(allowlist) do
            if v == identifierNewMethod then
             isInPermissions = true
                break
            end
        end
    
        if not isInPermissions then
            exploitBan(src)
        end ]]
    else
        -- Handle other check methods or provide an error message
        print("Invalid check method specified.")
    end
end)

