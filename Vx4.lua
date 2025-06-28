local repo = "https://raw.githubusercontent.com/MicrosoftExcelHub/Script-Games/refs/heads/main/Games/"

-- Game-specific scripts table (PlaceId → Script URL)
local Games = {
    [127707120843339] = repo .. "MathMurder.lua",
    [12361295702] = repo .. "NCT.lua
}

local currentPlaceId = game.PlaceId
local scriptUrl = Games[currentPlaceId]

if scriptUrl then
    -- Load game-specific script
    loadstring(game:HttpGet(scriptUrl))()
else
    -- Load universal fallback script
    loadstring(game:HttpGet(repo .. "Uni.lua"))()
end
