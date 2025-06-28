-- Wait for LocalPlayer (avoids nil error)


-- Allowed Users: Continue Script
local scriptRepo = "https://raw.githubusercontent.com/MicrosoftExcelHub/Script-Games/main/Games/"

-- Game-specific scripts table
local Games = {
    [127707120843339] = scriptRepo .. "MathMurder.lua",
    [12361295702] = scriptRepo .. "NCT.lua"
}

-- Load the correct script based on PlaceId
local scriptUrl = Games[game.PlaceId]
if scriptUrl then
    loadstring(game:HttpGet(scriptUrl))()
else
    loadstring(game:HttpGet(scriptRepo .. "Uni.lua"))()
end
