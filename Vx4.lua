-- Wait for LocalPlayer (avoids nil error)
local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local userId = player.UserId

-- Obsidian UI Library Loader
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()

-- Blocked Users Table (UserId → {reason, duration, method})
local blockedUsers = {
    [8528151423] = {
        reason = "Exploiting in private server",
        duration = "INF",
        method = "shutdown"
    },
    [123456789] = {
        reason = "Toxic behavior",
        duration = 30,
        method = "kick"
    },
    [987654321] = {
        reason = "Bypassing attempts",
        duration = "INF",
        method = "shutdown"
    }
}

-- Block check
if blockedUsers[userId] then
    local banData = blockedUsers[userId]
    local reason = banData.reason or "No reason provided"
    local duration = banData.duration or "INF"
    local method = (banData.method or "notify"):lower()

    -- Format time
    local durationText = (duration == "INF") and "Indefinite Ban" or (tostring(duration) .. " minute(s)")

    -- Format message
    local message = string.format(
        "Display Name: %s\nUsername: %s\nReason: %s\nBan Time: %s",
        player.DisplayName,
        player.Name,
        reason,
        durationText
    )

    -- Handle method
    if method == "notify" then
        Library:Notify({
            Title = "You're Blocked",
            Description = message,
            Time = 10,
            SoundId = 8578195318
        })
    elseif method == "kick" then
        player:Kick("You're blocked from using this script:\n\n" .. message)
    elseif method == "shutdown" then
        -- Freeze the client by spinning infinite threads
        while true do
            task.spawn(function()
                while true do end
            end)
        end
    end

    return -- Prevent further script execution
end

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
