RegisterCommand("changesound", function(source, args, rawCommand)
    local veh = GetVehiclePedIsIn(GetPlayerPed(source))
    if args[1] ~= nil and veh ~= 0 then
        plate = string.gsub(GetVehicleNumberPlateText(veh), "%s+", "")
        TriggerClientEvent("engine:sound", -1, tostring(args[1]),plate)
    end
end, false)

-- Sets server list convar
SetConvarServerInfo('tags', 'FiveM Engine Sound Pack')
-- Setup for the version check
updatePath = "/SpiritsCreations/FiveM-Engine-Sound-Pack" -- your git user/repo path
-- Console stuff
Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "FiveM Engine Sound Pack" then
        print("FiveM Engine Sound Pack Loaded.")
    end
    if GetCurrentResourceName() == 'FiveM Engine Sound Pack' then
        function checkVersion(_, responseText)
            curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

            if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
                print("Uh Oh! Looks like FiveM Engine Sound Pack is outdated")
                print("Should be: "..responseText..", currently is: "..curVersion..". Please update it from https://github.com"..updatePath.."")
            elseif tonumber(curVersion) > tonumber(responseText) then
                print("Uh Oh! You somehow skipped a few versions of FiveM Engine Sound Pack")
                print("or the git went offline, if it's still online I advise you to update (or downgrade?)")
            else
                print("It looks like FiveM Engine Sound Pack is up to date, have fun!")
            end
        end
    end

    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version", checkVersion, "GET")
end)