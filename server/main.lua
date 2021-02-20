print("^0======================================================================^7")
print("^3Copyright 2021 esx_Floto ^5V1.0 ^3by ^1FproGeek^0")
print("^5https://github.com/FproGeek/esx_Floto^0")
print("^0======================================================================^7")


ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('elec:participer')
AddEventHandler('elec:participer', function(participer)
    local src_ = source --On met source en mémoire pour eviter les bug.
    local identifier = GetPlayerIdentifiers(src_)[1] --On recupére la license du joueur.
    local name = GetPlayerName(src_) --On recupére le nom du joueur.
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll("SELECT * FROM user_loterie WHERE steamid = @steamid", {["steamid"] = identifier}, function(result)--On recupére tout la table "user_loterie" avec la license qui et dans la column "steamid"
        if result[1] then --Si il y a un resulta alors
            --Notification qui dit que le joueur participe deja a la loterie
            	TriggerClientEvent('esx:showNotification', src_, "Vous participé(e) déja à la loterie !")
        else --Sinon
            MySQL.Async.execute("INSERT INTO user_loterie (steamid, name) VALUES (@steamid, @name)", {["steamid"] = identifier, ["name"] = name}, function() --Ajoute une ligne a user_loterie avec comme valeur l'identifier qui et égale a "steamid"
            	xPlayer.removeMoney(5000)
            	TriggerClientEvent('esx:showNotification', src_, "Merci pour votre participation et bonne chance !")
            end)
        end
    end)
end)


function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end
