local players = game.Players
local localPlayer = players.LocalPlayer

-- Require DrawingLib
local DrawingLib = require(game.ReplicatedStorage.DrawingLib)

local function createSelectionBox(player)
    -- Create a DrawingLib object
    local drawing = DrawingLib.new()

    -- Update the drawing function
    local function updateDrawing()
        -- Calculate the position of the player's torso relative to the screen
        local screenPosition = game.Workspace.CurrentCamera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)

        -- Draw the selection box
        drawing:Clear()
        drawing:Rectangle(screenPosition.X - 25, screenPosition.Y - 25, 50, 50, Color3.new(0, 1, 0)) -- Green color
        drawing:Text(screenPosition.X + 25, screenPosition.Y + 25, player.Name, Color3.new(0, 0, 0)) -- Black text
    end

    -- Connect the update function to the RenderStepped event
    game.RunService.RenderStepped:Connect(updateDrawing)
end

players.PlayerAdded:Connect(function(player)
    if player ~= localPlayer then
        createSelectionBox(player)
    end
end)

for _, player in pairs(players:GetPlayers()) do
    if player ~= localPlayer then
        createSelectionBox(player)
    end
end
