-- ESP Script made by thebestpersol

local ESPEnabled = true

function createESP(player)
    local highlight = Instance.new("Highlight")
    highlight.Parent = player.Character
    highlight.FillColor = Color3.fromRGB(0, 255, 255)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESPLabel"
    billboard.Adornee = player.Character.Head
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Parent = billboard
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = player.Name
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextSize = 14 -- Adjust the size of the text
    nameLabel.Font = Enum.Font.SourceSans

    billboard.Parent = player.Character.Head
end

function removeESP(player)
    if player.Character:FindFirstChild("Highlight") then
        player.Character.Highlight:Destroy()
    end
    if player.Character.Head:FindFirstChild("ESPLabel") then
        player.Character.Head.ESPLabel:Destroy()
    end
end

function updateESP()
    while ESPEnabled do
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Head") then
                if not player.Character:FindFirstChild("Highlight") then
                    createESP(player)
                end
            end
        end

       
        for _, player in pairs(game.Players:GetPlayers()) do
            if not player.Character or not player.Character:FindFirstChild("Head") then
                removeESP(player)
            end
        end

        wait(5) 
    end
end

function showNotification()
    local starterGui = game:GetService("StarterGui")
    starterGui:SetCore("SendNotification", {
        Title = "Notification";
        Text = "Made by thebestpersol, enjoy.";
        Duration = 5; 
    })
end
