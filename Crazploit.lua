-- Check if the script is running on the client
if not game:GetService("RunService"):IsClient() then
    print("Script is not running on the client!")
    return
end

print("Script is running on the client!")

-- Check if the game.Players service is available
if game.Players then
    print("game.Players service is available")
else
    print("game.Players service is not available")
    return
end

print("game.Players service is available!")

-- Wait for the PlayerAdded event to ensure the local player is available
-- game.Players.PlayerAdded:Wait()

print("Waiting for local player...")

-- Get the local player
local player = game.Players.LocalPlayer
if player then
    print("Local player is available: " .. player.Name)
else
    print("Local player is not available")
    return
end

print("Local player is available!")

-- Example code: Print the local player's username and character
print("Local player's username: " .. player.Name)
print("Local player's character: " .. player.Character.Name)

-- Example code: Get the local player's character's humanoid
local character = player.Character
if character then
    print("Local player's character is available: " .. character.Name)
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        print("Local player's humanoid is available: " .. humanoid.Name)
    else
        print("Local player's humanoid is not available")
    end
else
    print("Local player's character is not available")
end
