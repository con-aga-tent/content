local r = "https://raw.githubusercontent.com/con-aga-tent/Script-Games/main/Games/",

--[[local scriptUrl = Games[game.PlaceId

if scriptUrl then
    loadstring(game:HttpGet(scriptUrl))()
else]]
    loadstring(game:HttpGet(r .. "Uni.lua"))()
--end
