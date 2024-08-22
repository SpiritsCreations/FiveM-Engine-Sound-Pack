-- Sets server list convar
SetConvarServerInfo('tags', 'Audio_Pack')

-- Setup for the version check
updatePath = "/SpiritsCreations/FiveM-Engine-Sound-Pack" -- your git user/repo path
versionFile = "/Audio_Pack/version" -- path to the version file

-- Console stuff
Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "Audio_Pack" then
        print("-----------------------------------------------------")
        print("Please Dont Change the resource name to avoid errors.")
        print("-----------------------------------------------------")
    end
    if GetCurrentResourceName() == 'Audio_Pack' then
        function checkVersion(_, responseText)
            local curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

            if curVersion and responseText then
                if tonumber(curVersion) and tonumber(responseText) then
                    if tonumber(curVersion) < tonumber(responseText) then
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
                else
                    print("Error: Unable to parse version numbers.")
                end
            else
                print("Error: Unable to load version file or receive response from GitHub API.")
            end
        end

        PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/main"..versionFile, checkVersion, "GET")
    end
end)