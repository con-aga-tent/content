local repo = "https://raw.githubusercontent.com/MicrosoftExcelHub/Script-Games/refs/heads/main/
local Games = {
    [127707120843339] = repo .. "MathMurder.lua",
    [12361295702] = repo .. "NCT.lua"
}
local currentPlaceId = game.PlaceId
local scriptUrl = Games[currentPlaceId]
if scriptUrl then
    loadstring(game:HttpGet(scriptUrl))()
else
    loadstring(game:HttpGet(repo .. "Uni.lua"))()
end
