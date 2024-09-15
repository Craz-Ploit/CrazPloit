-- Get the local player
local player = game.Players.LocalPlayer

-- Create a function to find the closest player
local function findClosestPlayer()
    local closestPlayer = nil
    local closestDistance = math.huge
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local distance = (otherPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = otherPlayer
            end
        end
    end
    return closestPlayer
end

-- Create a function to aim at the closest player
local function aimAtClosestPlayer()
    local closestPlayer = findClosestPlayer()
    if closestPlayer then
        local character = player.Character
        local humanoid = character.Humanoid
        local rootPart = character.HumanoidRootPart
        local targetPosition = closestPlayer.Character.HumanoidRootPart.Position
        local direction = (targetPosition - rootPart.Position).unit
        humanoid.WalkToPoint = rootPart.Position + direction * 10
    end
end

-- Listen for right click input
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton3 then
        -- Hold right click to aim at closest player
        while input.UserInputState == Enum.UserInputState.Begin then
            aimAtClosestPlayer()
            wait()
        end
    end
end)
