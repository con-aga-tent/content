-- Wait for LocalPlayer (avoids nil error)
-- Load Obsidian UI Library
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()

-- Blocked User Table (UserId → Info)
local blockedUsers = {
    [8528151423] = {
        reason = "This Script Was Blocked By Delta, Most Likely, It Was Because This Is Malware. If you Believe This Was A Mistake, Please Contact msxcl in Discord. Reason: Unknown",
        duration = "INF", -- or number in minutes
        method = "kick" -- Options: notify, kick, shutdown
    },
    [5804512706] = {
        reason = "Bypass attempt",
        duration = "INF",
        method = "shutdown"
    }
}

local player = game.Players.LocalPlayer
local userId = player.UserId

-- If user is blocked
if blockedUsers[userId] then
    local banData = blockedUsers[userId]
    local reason = banData.reason or "No reason provided"
    local duration = banData.duration or "INF"
    local method = (banData.method or "notify"):lower()
    local durationText = (duration == "INF") and "Indefinite Ban" or (tostring(duration) .. " minute(s)")

    local message = string.format(
        "Display Name: %s\nUsername: %s\nReason: %s\nBan Time: %s",
        player.DisplayName,
        player.Name,
        reason,
        durationText
    )

    if method == "notify" then
        Library:Notify({
            Title = "You're Blocked",
            Description = message,
            Time = 10,
            SoundId = 8578195318
        })
    elseif method == "kick" then
        player:Kick("You're blocked from using this script:\n" .. message)
    elseif method == "shutdown" then
        while true do
            task.spawn(function()
                while true do end
            end)
        end
    end

    return -- Stop script execution
end

-- Continue script for allowed users
local scriptRepo = "https://raw.githubusercontent.com/MicrosoftExcelHub/Script-Games/main/Games/"

-- Game-specific scripts
local Games = {
    [127707120843339] = scriptRepo .. "MathMurder.lua",
    [12361295702] = scriptRepo .. "NCT.lua"
}

local scriptUrl = Games[game.PlaceId]

if scriptUrl then
    loadstring(game:HttpGet(scriptUrl))()
else
    loadstring(game:HttpGet(scriptRepo .. "Uni.lua"))()
end
