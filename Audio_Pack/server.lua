RegisterCommand("changesound", function(source, args, rawCommand)
    local veh = GetVehiclePedIsIn(GetPlayerPed(source))
    if args[1] ~= nil and veh ~= 0 then
        plate = string.gsub(GetVehicleNumberPlateText(veh), "%s+", "")
        TriggerClientEvent("engine:sound", -1, tostring(args[1]),plate)
    end
end, false)

-- Sets server list convar
SetConvarServerInfo('tags', 'Audio_Pack')
-- Setup for the version check
updatePath = "/SpiritsCreations/FiveM-Engine-Sound-Pack" -- your git user/repo path
-- Console stuff
Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "Audio_Pack" then
        print("Please Don't Change the resource name to avoid errors.")
    end
    if GetCurrentResourceName() == 'Audio_Pack' then
        function checkVersion(_, responseText)
            curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

            if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
                print("      _/_/_/    _/_/_/ ║                   Hey there! Yeah you, thanks for using my Audio Pack!")
                print("   _/        _/        ║")
                print("    _/_/    _/         ║")
                print("       _/  _/          ║                       Uh Oh! Looks like FiveM-Engine-Sound-Pack is outdated")
                print("_/_/_/      _/_/_/     ║ Should be: "..responseText..", currently is: "..curVersion..". Please update it from https://github.com"..updatePath.."")
            elseif tonumber(curVersion) > tonumber(responseText) then
                print("      _/_/_/    _/_/_/ ║                   Hey there! Yeah you, thanks for using my Audio Pack!")
                print("   _/        _/        ║")
                print("    _/_/    _/         ║")
                print("       _/  _/          ║           Uh Oh! You somehow skipped a few versions of FiveM-Engine-Sound-Pack")
                print("_/_/_/      _/_/_/     ║  or the git went offline, if it's still online I advise you to update (or downgrade?)")
            else
                print("      _/_/_/    _/_/_/ ║                   Hey there! Yeah you, thanks for using my Audio Pack!")
                print("   _/        _/        ║")
                print("    _/_/    _/         ║")
                print("       _/  _/          ║")
                print("_/_/_/      _/_/_/     ║             It looks like FiveM-Engine-Sound-Pack is up to date, have fun!")
            end
        end
    end

    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/Audio_Pack/version", checkVersion, "GET")
end)