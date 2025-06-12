local repo = "https://raw.githubusercontent.com/MicrosoftExcelHub/Script-Games/refs/heads/main/Games/"
local Games = "https://raw.githubusercontent.com/MicrosoftExcelHub/GameList/refs/heads/main/Games.lua"

local currentPlaceId = game.PlaceId
local scriptUrl = Games[currentPlaceId]

if scriptUrl then
    -- Game-specific script
    loadstring(game:HttpGet(scriptUrl))()
else
    -- Fallback: universal script
	    loadstring(game:HttpGet(repo .. "Uni.lua"))()
end
