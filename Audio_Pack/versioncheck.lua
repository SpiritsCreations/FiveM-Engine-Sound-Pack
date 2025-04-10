-- Sets server list convar
SetConvarServerInfo('tags', 'Audio_Pack')
-- Setup for the version check
updatePath = "/SpiritsCreations/FiveM-Engine-Sound-Pack" -- your git user/repo path
-- Console stuff
Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "Audio_Pack" then
        print("-----------------------------------------------------")
        print("Please Dont Change the resource name to avoid errors.")
        print("-----------------------------------------------------")
    end
    if GetCurrentResourceName() == 'Audio_Pack' then
        function checkVersion(_, responseText)
            curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

            if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
                print("      _/_/_/    _/_/_/ ║                   Hey there! Yeah you, thanks for using my Audio Pack!")
                print("   _/        _/        ║")
                print("    _/_/    _/         ║")
                print("       _/  _/          ║                       Uh Oh! Looks like Audio Pack is outdated")
                print("_/_/_/      _/_/_/     ║ Should be: "..responseText..", currently is: "..curVersion..". Please update it from https://github.com"..updatePath.."")
            elseif tonumber(curVersion) > tonumber(responseText) then
                print("      _/_/_/    _/_/_/ ║                   Hey there! Yeah you, thanks for using my Audio Pack!")
                print("   _/        _/        ║")
                print("    _/_/    _/         ║")
                print("       _/  _/          ║           Uh Oh! You somehow skipped a few versions of Audio Pack")
                print("_/_/_/      _/_/_/     ║  or the git went offline, if it's still online I advise you to update (or downgrade?)")
            else
                print("      _/_/_/    _/_/_/ ║              Hey there! Yeah you, thanks for using my Audio Pack!")
                print("   _/        _/        ║")
                print("    _/_/    _/         ║")
                print("       _/  _/          ║")
                print("_/_/_/      _/_/_/     ║               It looks like Audio Pack is up to date, have fun!")
            end
        end
    end

    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/main/Audio_Pack/version", checkVersion, "GET")
end)