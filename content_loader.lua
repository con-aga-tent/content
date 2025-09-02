local r = "https://raw.githubusercontent.com/con-aga-tent/Script-Games/main/Games/"

local success, result = pcall(function()
    return game:HttpGet(r .. "Uni.lua", true)
end)

if success and result and result ~= "" then
    loadstring(result)()
end
