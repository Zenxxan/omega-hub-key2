if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Syllinse = {}

function Syllinse:Load()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Workspace = game:GetService("Workspace")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local UserInputService = game:GetService("UserInputService")
    local TweenService = game:GetService("TweenService")
    local Lighting = game:GetService("Lighting")
    local HttpService = game:GetService("HttpService")
    local GuiService = game:GetService("GuiService")

    local player = Players.LocalPlayer
    local CoreGui = game:GetService("CoreGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ShadowStealHelper"
    screenGui.Parent = CoreGui
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local toggleCircle = Instance.new("ImageButton")
    toggleCircle.Name = "ToggleCircle"
    toggleCircle.Size = UDim2.new(0, 56, 0, 56)
    toggleCircle.Position = UDim2.new(0, 24, 0, 24)
    toggleCircle.Image = "rbxassetid://10709868101"
    toggleCircle.ImageColor3 = Color3.fromRGB(255, 255, 255)
    toggleCircle.BackgroundTransparency = 1
    toggleCircle.Parent = screenGui
    toggleCircle.ZIndex = 100

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleCircle

    local toggleAcrylic = Instance.new("Frame")
    toggleAcrylic.Parent = toggleCircle
    toggleAcrylic.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    toggleAcrylic.BackgroundTransparency = 0.2
    toggleAcrylic.Size = UDim2.new(1, 0, 1, 0)
    toggleAcrylic.BorderSizePixel = 0
    toggleAcrylic.ZIndex = -1

    local toggleAcrylicCorner = Instance.new("UICorner")
    toggleAcrylicCorner.CornerRadius = UDim.new(1, 0)
    toggleAcrylicCorner.Parent = toggleAcrylic

    local toggleNoise = Instance.new("ImageLabel")
    toggleNoise.Parent = toggleAcrylic
    toggleNoise.BackgroundTransparency = 1
    toggleNoise.Size = UDim2.new(1, 0, 1, 0)
    toggleNoise.Image = "rbxassetid://8992230677"
    toggleNoise.ImageColor3 = Color3.fromRGB(255, 255, 255)
    toggleNoise.ImageTransparency = 0.9
    toggleNoise.ScaleType = Enum.ScaleType.Tile
    toggleNoise.TileSize = UDim2.new(0, 56, 0, 56)
    toggleNoise.ZIndex = -1

    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Parent = toggleCircle
    toggleStroke.Color = Color3.fromRGB(80, 80, 100)
    toggleStroke.Thickness = 1.5
    toggleStroke.Transparency = 0.2

    local toggleInnerStroke = Instance.new("UIStroke")
    toggleInnerStroke.Parent = toggleAcrylic
    toggleInnerStroke.Color = Color3.fromRGB(255, 255, 255)
    toggleInnerStroke.Thickness = 1
    toggleInnerStroke.Transparency = 0.85

    local screenSize = workspace.CurrentCamera.ViewportSize
    local isMobile = UserInputService.TouchEnabled
    local baseWidth = isMobile and math.min(380, screenSize.X * 0.85) or 360
    local baseHeight = isMobile and math.min(440, screenSize.Y * 0.7) or 420

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, baseWidth, 0, baseHeight)
    mainFrame.Position = UDim2.new(0.5, -baseWidth/2, 0.5, -baseHeight/2)
    mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
    mainFrame.BackgroundTransparency = 0.08
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Visible = false
    mainFrame.ClipsDescendants = true

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 12)
    mainCorner.Parent = mainFrame

    local acrylicLayer = Instance.new("Frame")
    acrylicLayer.Parent = mainFrame
    acrylicLayer.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    acrylicLayer.BackgroundTransparency = 0.2
    acrylicLayer.Size = UDim2.new(1, 0, 1, 0)
    acrylicLayer.BorderSizePixel = 0
    acrylicLayer.ZIndex = 0

    local acrylicCorner = Instance.new("UICorner")
    acrylicCorner.CornerRadius = UDim.new(0, 12)
    acrylicCorner.Parent = acrylicLayer

    local noiseOverlay = Instance.new("ImageLabel")
    noiseOverlay.Parent = acrylicLayer
    noiseOverlay.BackgroundTransparency = 1
    noiseOverlay.Size = UDim2.new(1, 0, 1, 0)
    noiseOverlay.Image = "rbxassetid://8992230677"
    noiseOverlay.ImageColor3 = Color3.fromRGB(255, 255, 255)
    noiseOverlay.ImageTransparency = 0.9
    noiseOverlay.ScaleType = Enum.ScaleType.Tile
    noiseOverlay.TileSize = UDim2.new(0, 120, 0, 120)
    noiseOverlay.ZIndex = 1

    local stroke = Instance.new("UIStroke")
    stroke.Parent = mainFrame
    stroke.Color = Color3.fromRGB(80, 80, 100)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.15

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Parent = acrylicLayer
    innerStroke.Color = Color3.fromRGB(255, 255, 255)
    innerStroke.Thickness = 1
    innerStroke.Transparency = 0.85

    local header = Instance.new("Frame")
    header.Parent = mainFrame
    header.BackgroundTransparency = 1
    header.Size = UDim2.new(1, 0, 0, isMobile and 56 or 52)
    header.ZIndex = 10

    local headerAccent = Instance.new("Frame")
    headerAccent.Parent = header
    headerAccent.BackgroundColor3 = Color3.fromRGB(60, 180, 255)
    headerAccent.BackgroundTransparency = 0.6
    headerAccent.Position = UDim2.new(0, 20, 1, -2)
    headerAccent.Size = UDim2.new(1, -40, 0, 1)
    headerAccent.BorderSizePixel = 0
    headerAccent.ZIndex = 10

    local titleContainer = Instance.new("Frame")
    titleContainer.Parent = header
    titleContainer.BackgroundTransparency = 1
    titleContainer.Position = UDim2.new(0, 20, 0, 0)
    titleContainer.Size = UDim2.new(1, -80, 1, 0)
    titleContainer.ZIndex = 10

    local title = Instance.new("TextLabel")
    title.Parent = titleContainer
    title.Text = "SYLLINSE HELPER"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = isMobile and 22 or 20
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 0.6, 0)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 10

    local subtitle = Instance.new("TextLabel")
    subtitle.Parent = titleContainer
    subtitle.Text = "Advanced Utility Suite"
    subtitle.Font = Enum.Font.GothamMedium
    subtitle.TextSize = isMobile and 13 or 12
    subtitle.TextColor3 = Color3.fromRGB(180, 190, 220)
    subtitle.BackgroundTransparency = 1
    subtitle.Position = UDim2.new(0, 0, 0.6, 0)
    subtitle.Size = UDim2.new(1, 0, 0.4, 0)
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.ZIndex = 10

    local controls = Instance.new("Frame")
    controls.Size = UDim2.new(0, 48, 1, 0)
    controls.Position = UDim2.new(1, -52, 0, 0)
    controls.BackgroundTransparency = 1
    controls.Parent = header
    controls.ZIndex = 10

    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Size = UDim2.new(0, isMobile and 26 or 22, 0, isMobile and 26 or 22)
    minimizeBtn.Position = UDim2.new(0, 2, 0, isMobile and 12 or 10)
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    minimizeBtn.BackgroundTransparency = 0.3
    minimizeBtn.BorderSizePixel = 0
    minimizeBtn.Text = "−"
    minimizeBtn.TextColor3 = Color3.fromRGB(220, 220, 240)
    minimizeBtn.Font = Enum.Font.GothamMedium
    minimizeBtn.TextSize = isMobile and 20 or 18
    minimizeBtn.ZIndex = 10
    minimizeBtn.Parent = controls

    local minimizeBtnCorner = Instance.new("UICorner")
    minimizeBtnCorner.CornerRadius = UDim.new(0, 6)
    minimizeBtnCorner.Parent = minimizeBtn

    local minimizeBtnStroke = Instance.new("UIStroke")
    minimizeBtnStroke.Parent = minimizeBtn
    minimizeBtnStroke.Color = Color3.fromRGB(90, 90, 110)
    minimizeBtnStroke.Thickness = 1
    minimizeBtnStroke.Transparency = 0.2

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, isMobile and 26 or 22, 0, isMobile and 26 or 22)
    closeBtn.Position = UDim2.new(0, isMobile and 28 or 26, 0, isMobile and 12 or 10)
    closeBtn.BackgroundColor3 = Color3.fromRGB(40, 30, 35)
    closeBtn.BackgroundTransparency = 0.3
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.fromRGB(240, 180, 180)
    closeBtn.Font = Enum.Font.GothamMedium
    closeBtn.TextSize = isMobile and 20 or 18
    closeBtn.ZIndex = 10
    closeBtn.Parent = controls

    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 6)
    closeBtnCorner.Parent = closeBtn

    local closeBtnStroke = Instance.new("UIStroke")
    closeBtnStroke.Parent = closeBtn
    closeBtnStroke.Color = Color3.fromRGB(130, 90, 100)
    closeBtnStroke.Thickness = 1
    closeBtnStroke.Transparency = 0.2

    local buttonStates = {}

    local contentContainer = Instance.new("ScrollingFrame")
    contentContainer.Parent = mainFrame
    contentContainer.BackgroundTransparency = 1
    contentContainer.Size = UDim2.new(1, -24, 1, -(isMobile and 80 or 76))
    contentContainer.Position = UDim2.new(0, 12, 0, isMobile and 68 or 64)
    contentContainer.ZIndex = 10
    contentContainer.ScrollBarThickness = isMobile and 5 or 3
    contentContainer.ScrollBarImageColor3 = Color3.fromRGB(90, 100, 130)
    contentContainer.ScrollBarImageTransparency = 0.6
    contentContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    contentContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y

    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Parent = contentContainer
    contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, isMobile and 12 or 10)

    local allButtonFrames = {}

    local keybindButtons = {}

    local loadedSettings = {
        keybinds = {},
        toggles = {}
    }

    local function saveSettings()
        if not writefile then
            return
        end

        local settingsData = {
            keybinds = {},
            toggles = {}
        }

        for id, keybindInfo in pairs(keybindButtons) do
            settingsData.keybinds[id] = keybindInfo.currentKey
            if keybindInfo.toggleSwitch then
                settingsData.toggles[id] = buttonStates[id]
            end
        end

        pcall(function()
            writefile("syllinse_settings.json", game:GetService("HttpService"):JSONEncode(settingsData))
        end)
    end

    local function loadSettings()
        if not readfile or not isfile or not isfile("syllinse_settings.json") then
            return
        end

        pcall(function()
            local data = game:GetService("HttpService"):JSONDecode(readfile("syllinse_settings.json"))

            loadedSettings.keybinds = data.keybinds or {}
            loadedSettings.toggles = data.toggles or {}

            for id, key in pairs(loadedSettings.keybinds) do
                if keybindButtons[id] then
                    keybindButtons[id].currentKey = key
                    if keybindButtons[id].button then
                        keybindButtons[id].button.Text = key
                    end
                end
            end

            for id, state in pairs(loadedSettings.toggles) do
                if keybindButtons[id] and keybindButtons[id].toggleSwitch then
                    buttonStates[id] = state

                    if state then
                        keybindButtons[id].toggleSwitch.Position = UDim2.new(0.55, 0, 0.15, 0)
                        keybindButtons[id].toggleSwitch.BackgroundColor3 = Color3.fromRGB(40, 200, 100)
                        keybindButtons[id].toggleFrame.BackgroundColor3 = Color3.fromRGB(25, 55, 45)
                        if keybindButtons[id].callback then
                            keybindButtons[id].callback(state)
                        end
                    else
                        keybindButtons[id].toggleSwitch.Position = UDim2.new(0.05, 0, 0.15, 0)
                        keybindButtons[id].toggleSwitch.BackgroundColor3 = Color3.fromRGB(140, 40, 40)
                        keybindButtons[id].toggleFrame.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
                        if keybindButtons[id].callback then
                            keybindButtons[id].callback(false)
                        end
                    end
                end
            end
        end)
    end

    local function updateKeybind(id, newKey)
        if keybindButtons[id] then
            keybindButtons[id].currentKey = tostring(newKey)
            if keybindButtons[id].button then
                keybindButtons[id].button.Text = tostring(newKey)
            end
            saveSettings()
        end
    end

    local function createToggle(parent, text, callback, defaultKey)
        local buttonContainer = Instance.new("Frame")
        buttonContainer.Size = UDim2.new(1, 0, 0, isMobile and 48 or 44)
        buttonContainer.BackgroundTransparency = 1
        buttonContainer.Parent = parent

        local containerBackground = Instance.new("Frame")
        containerBackground.Size = UDim2.new(1, 0, 1, 0)
        containerBackground.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        containerBackground.BackgroundTransparency = 0.8
        containerBackground.BorderSizePixel = 0
        containerBackground.Parent = buttonContainer
        containerBackground.ZIndex = 1

        local backgroundCorner = Instance.new("UICorner")
        backgroundCorner.CornerRadius = UDim.new(0, 8)
        backgroundCorner.Parent = containerBackground

        local backgroundStroke = Instance.new("UIStroke")
        backgroundStroke.Parent = containerBackground
        backgroundStroke.Color = Color3.fromRGB(80, 90, 120)
        backgroundStroke.Thickness = 1
        backgroundStroke.Transparency = 0.5

        local textContainer = Instance.new("Frame")
        textContainer.Size = UDim2.new(0.65, 0, 1, 0)
        textContainer.BackgroundTransparency = 1
        textContainer.Parent = buttonContainer

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(0.9, 0, 0.55, 0)
        textLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
        textLabel.Text = text
        textLabel.Font = Enum.Font.GothamSemibold
        textLabel.TextSize = isMobile and 15 or 14
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Parent = textContainer
        textLabel.ZIndex = 2

        local description = Instance.new("TextLabel")
        description.Size = UDim2.new(0.9, 0, 0.45, 0)
        description.Position = UDim2.new(0.05, 0, 0.55, 0)
        description.BackgroundTransparency = 1
        description.TextColor3 = Color3.fromRGB(170, 180, 210)
        description.Text = "Toggle feature"
        description.Font = Enum.Font.Gotham
        description.TextSize = isMobile and 12 or 11
        description.TextXAlignment = Enum.TextXAlignment.Left
        description.Parent = textContainer
        description.ZIndex = 2

        local toggleContainer = Instance.new("Frame")
        toggleContainer.Size = UDim2.new(0.35, 0, 1, 0)
        toggleContainer.Position = UDim2.new(0.65, 0, 0, 0)
        toggleContainer.BackgroundTransparency = 1
        toggleContainer.Parent = buttonContainer

        local toggleFrame = Instance.new("ImageButton")
        toggleFrame.Size = UDim2.new(0.45, 0, 0.5, 0)
        toggleFrame.Position = UDim2.new(0.05, 0, 0.25, 0)
        toggleFrame.BackgroundColor3 = Color3.fromRGB(45, 35, 35)
        toggleFrame.BackgroundTransparency = 0.15
        toggleFrame.BorderSizePixel = 0
        toggleFrame.ImageTransparency = 1
        toggleFrame.Parent = toggleContainer
        toggleFrame.ZIndex = 2

        local toggleSwitch = Instance.new("Frame")
        toggleSwitch.Size = UDim2.new(0.35, 0, 0.7, 0)
        toggleSwitch.Position = UDim2.new(0.05, 0, 0.15, 0)
        toggleSwitch.BackgroundColor3 = Color3.fromRGB(140, 40, 40)
        toggleSwitch.BackgroundTransparency = 0.15
        toggleSwitch.BorderSizePixel = 0
        toggleSwitch.Parent = toggleFrame
        toggleSwitch.ZIndex = 3

        local toggleCorner = Instance.new("UICorner")
        toggleCorner.CornerRadius = UDim.new(1, 0)
        toggleCorner.Parent = toggleFrame

        local switchCorner = Instance.new("UICorner")
        switchCorner.CornerRadius = UDim.new(1, 0)
        switchCorner.Parent = toggleSwitch

        local keybindButton = Instance.new("TextButton")
        keybindButton.Size = UDim2.new(0.45, 0, 0.5, 0)
        keybindButton.Position = UDim2.new(0.55, 0, 0.25, 0)
        keybindButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        keybindButton.BackgroundTransparency = 0.2
        keybindButton.BorderSizePixel = 0
        keybindButton.TextColor3 = Color3.fromRGB(210, 220, 240)
        keybindButton.Text = defaultKey and tostring(defaultKey) or "NONE"
        keybindButton.Font = Enum.Font.GothamMedium
        keybindButton.TextSize = isMobile and 12 or 11
        keybindButton.Parent = toggleContainer
        keybindButton.ZIndex = 2

        local keybindCorner = Instance.new("UICorner")
        keybindCorner.CornerRadius = UDim.new(0, 6)
        keybindCorner.Parent = keybindButton

        local keybindStroke = Instance.new("UIStroke")
        keybindStroke.Parent = keybindButton
        keybindStroke.Color = Color3.fromRGB(90, 100, 120)
        keybindStroke.Thickness = 1
        keybindStroke.Transparency = 0.3

        local toggleId = text
        local savedKey = loadedSettings.keybinds[toggleId]
        local savedState = loadedSettings.toggles[toggleId]
        local finalKey = savedKey or (defaultKey and tostring(defaultKey) or "NONE")
        local finalState = savedState ~= nil and savedState or false

        buttonStates[toggleId] = finalState
        keybindButtons[toggleId] = {
            button = keybindButton,
            currentKey = finalKey,
            callback = callback,
            toggleSwitch = toggleSwitch,
            toggleFrame = toggleFrame
        }

        keybindButton.Text = finalKey

        local function updateToggle(state)
            buttonStates[toggleId] = state
            if state then
                TweenService:Create(toggleSwitch, TweenInfo.new(0.15), {
                    Position = UDim2.new(0.55, 0, 0.15, 0),
                    BackgroundColor3 = Color3.fromRGB(40, 200, 100)
                }):Play()
                TweenService:Create(toggleFrame, TweenInfo.new(0.15), {
                    BackgroundColor3 = Color3.fromRGB(25, 55, 45)
                }):Play()
            else
                TweenService:Create(toggleSwitch, TweenInfo.new(0.15), {
                    Position = UDim2.new(0.05, 0, 0.15, 0),
                    BackgroundColor3 = Color3.fromRGB(140, 40, 40)
                }):Play()
                TweenService:Create(toggleFrame, TweenInfo.new(0.15), {
                    BackgroundColor3 = Color3.fromRGB(45, 35, 35)
                }):Play()
            end
            saveSettings()
            if callback then
                callback(state)
            end
        end

        toggleFrame.MouseButton1Click:Connect(function()
            updateToggle(not buttonStates[toggleId])
        end)

        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then
                return
            end
            if input.UserInputType == Enum.UserInputType.Keyboard then
                if input.KeyCode.Name == keybindButtons[toggleId].currentKey then
                    updateToggle(not buttonStates[toggleId])
                end
            end
        end)

        keybindButton.MouseButton1Click:Connect(function()
            keybindButton.Text = "..."
            keybindButton.TextColor3 = Color3.fromRGB(100, 200, 255)
            local connection
            connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then
                    return
                end
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    local key = input.KeyCode.Name
                    keybindButtons[toggleId].currentKey = key
                    keybindButton.Text = key
                    keybindButton.TextColor3 = Color3.fromRGB(210, 220, 240)
                    updateKeybind(toggleId, key)
                    connection:Disconnect()
                end
            end)
        end)

        buttonContainer.MouseEnter:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.15), {
                Color = Color3.fromRGB(100, 160, 230),
                Transparency = 0.2
            }):Play()
        end)

        buttonContainer.MouseLeave:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.15), {
                Color = Color3.fromRGB(80, 90, 120),
                Transparency = 0.5
            }):Play()
        end)

        table.insert(allButtonFrames, buttonContainer)
        return buttonContainer
    end

    local function createButton(parent, text, callback, defaultKey)
        local buttonContainer = Instance.new("Frame")
        buttonContainer.Size = UDim2.new(1, 0, 0, isMobile and 48 or 44)
        buttonContainer.BackgroundTransparency = 1
        buttonContainer.Parent = parent

        local containerBackground = Instance.new("Frame")
        containerBackground.Size = UDim2.new(1, 0, 1, 0)
        containerBackground.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        containerBackground.BackgroundTransparency = 0.8
        containerBackground.BorderSizePixel = 0
        containerBackground.Parent = buttonContainer
        containerBackground.ZIndex = 1

        local backgroundCorner = Instance.new("UICorner")
        backgroundCorner.CornerRadius = UDim.new(0, 8)
        backgroundCorner.Parent = containerBackground

        local backgroundStroke = Instance.new("UIStroke")
        backgroundStroke.Parent = containerBackground
        backgroundStroke.Color = Color3.fromRGB(80, 90, 120)
        backgroundStroke.Thickness = 1
        backgroundStroke.Transparency = 0.5

        local textContainer = Instance.new("Frame")
        textContainer.Size = UDim2.new(0.65, 0, 1, 0)
        textContainer.BackgroundTransparency = 1
        textContainer.Parent = buttonContainer

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(0.9, 0, 0.55, 0)
        textLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
        textLabel.Text = text
        textLabel.Font = Enum.Font.GothamSemibold
        textLabel.TextSize = isMobile and 15 or 14
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Parent = textContainer
        textLabel.ZIndex = 2

        local description = Instance.new("TextLabel")
        description.Size = UDim2.new(0.9, 0, 0.45, 0)
        description.Position = UDim2.new(0.05, 0, 0.55, 0)
        description.BackgroundTransparency = 1
        description.TextColor3 = Color3.fromRGB(170, 180, 210)
        description.Text = "Execute action"
        description.Font = Enum.Font.Gotham
        description.TextSize = isMobile and 12 or 11
        description.TextXAlignment = Enum.TextXAlignment.Left
        description.Parent = textContainer
        description.ZIndex = 2

        local buttonContainerRight = Instance.new("Frame")
        buttonContainerRight.Size = UDim2.new(0.35, 0, 1, 0)
        buttonContainerRight.Position = UDim2.new(0.65, 0, 0, 0)
        buttonContainerRight.BackgroundTransparency = 1
        buttonContainerRight.Parent = buttonContainer

        local actionButton = Instance.new("TextButton")
        actionButton.Size = UDim2.new(0.45, 0, 0.5, 0)
        actionButton.Position = UDim2.new(0.05, 0, 0.25, 0)
        actionButton.BackgroundColor3 = Color3.fromRGB(35, 45, 65)
        actionButton.BackgroundTransparency = 0.15
        actionButton.BorderSizePixel = 0
        actionButton.TextColor3 = Color3.fromRGB(220, 230, 255)
        actionButton.Text = "RUN"
        actionButton.Font = Enum.Font.GothamMedium
        actionButton.TextSize = isMobile and 12 or 11
        actionButton.Parent = buttonContainerRight
        actionButton.ZIndex = 2

        local actionCorner = Instance.new("UICorner")
        actionCorner.CornerRadius = UDim.new(0, 6)
        actionCorner.Parent = actionButton

        local actionStroke = Instance.new("UIStroke")
        actionStroke.Parent = actionButton
        actionStroke.Color = Color3.fromRGB(90, 130, 190)
        actionStroke.Thickness = 1
        actionStroke.Transparency = 0.3

        local keybindButton = Instance.new("TextButton")
        keybindButton.Size = UDim2.new(0.45, 0, 0.5, 0)
        keybindButton.Position = UDim2.new(0.55, 0, 0.25, 0)
        keybindButton.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        keybindButton.BackgroundTransparency = 0.2
        keybindButton.BorderSizePixel = 0
        keybindButton.TextColor3 = Color3.fromRGB(210, 220, 240)
        keybindButton.Text = defaultKey and tostring(defaultKey) or "NONE"
        keybindButton.Font = Enum.Font.GothamMedium
        keybindButton.TextSize = isMobile and 12 or 11
        keybindButton.Parent = buttonContainerRight
        keybindButton.ZIndex = 2

        local keybindCorner = Instance.new("UICorner")
        keybindCorner.CornerRadius = UDim.new(0, 6)
        keybindCorner.Parent = keybindButton

        local keybindStroke = Instance.new("UIStroke")
        keybindStroke.Parent = keybindButton
        keybindStroke.Color = Color3.fromRGB(90, 100, 120)
        keybindStroke.Thickness = 1
        keybindStroke.Transparency = 0.3

        local buttonId = text
        local savedKey = loadedSettings.keybinds[buttonId]
        local finalKey = savedKey or (defaultKey and tostring(defaultKey) or "NONE")

        keybindButtons[buttonId] = {
            button = keybindButton,
            currentKey = finalKey,
            callback = callback
        }

        keybindButton.Text = finalKey

        actionButton.MouseButton1Click:Connect(function()
            if callback then
                callback()
            end
        end)

        actionButton.MouseEnter:Connect(function()
            TweenService:Create(actionButton, TweenInfo.new(0.1), {
                BackgroundColor3 = Color3.fromRGB(45, 65, 95)
            }):Play()
            TweenService:Create(actionStroke, TweenInfo.new(0.1), {
                Color = Color3.fromRGB(110, 190, 255)
            }):Play()
        end)

        actionButton.MouseLeave:Connect(function()
            TweenService:Create(actionButton, TweenInfo.new(0.1), {
                BackgroundColor3 = Color3.fromRGB(35, 45, 65)
            }):Play()
            TweenService:Create(actionStroke, TweenInfo.new(0.1), {
                Color = Color3.fromRGB(90, 130, 190)
            }):Play()
        end)

        buttonContainer.MouseEnter:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.15), {
                Color = Color3.fromRGB(100, 160, 230),
                Transparency = 0.2
            }):Play()
        end)

        buttonContainer.MouseLeave:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.15), {
                Color = Color3.fromRGB(80, 90, 120),
                Transparency = 0.5
            }):Play()
        end)

        local listening = false
        keybindButton.MouseButton1Click:Connect(function()
            listening = true
            keybindButton.Text = "..."
            keybindButton.TextColor3 = Color3.fromRGB(100, 200, 255)

            local connection
            connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then
                    return
                end

                if input.UserInputType == Enum.UserInputType.Keyboard then
                    local key = tostring(input.KeyCode.Name)
                    updateKeybind(buttonId, key)
                    listening = false
                    keybindButton.TextColor3 = Color3.fromRGB(210, 220, 240)
                    connection:Disconnect()
                end
            end)
        end)

        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then
                return
            end

            if input.UserInputType == Enum.UserInputType.Keyboard then
                local pressedKey = tostring(input.KeyCode.Name)
                for id, keybindInfo in pairs(keybindButtons) do
                    if keybindInfo.currentKey == pressedKey and not keybindInfo.toggleSwitch then
                        if id == buttonId and keybindInfo.callback then
                            keybindInfo.callback()
                        end
                    end
                end
            end
        end)

        table.insert(allButtonFrames, buttonContainer)
        return buttonContainer
    end

    local isMinimized = false
    local originalSize = mainFrame.Size
    local minimizedSize = UDim2.new(0, baseWidth, 0, isMobile and 56 or 52)

    local function toggleMinimize()
        isMinimized = not isMinimized

        if isMinimized then
            for _, buttonFrame in ipairs(allButtonFrames) do
                buttonFrame.Visible = false
            end
            contentContainer.Visible = false
            acrylicLayer.Visible = false
            noiseOverlay.Visible = false

            TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = minimizedSize
            }):Play()
            minimizeBtn.Text = "+"
        else
            for _, buttonFrame in ipairs(allButtonFrames) do
                buttonFrame.Visible = true
            end

            contentContainer.Visible = true
            acrylicLayer.Visible = true
            noiseOverlay.Visible = true

            TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = originalSize
            }):Play()
            minimizeBtn.Text = "−"
        end
    end

    minimizeBtn.MouseButton1Click:Connect(toggleMinimize)

    local function setupControlButton(button, hoverColor)
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.1), {
                BackgroundColor3 = hoverColor,
                BackgroundTransparency = 0.1
            }):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.1), {
                BackgroundColor3 = button == minimizeBtn and Color3.fromRGB(30, 30, 40) or Color3.fromRGB(40, 30, 35),
                BackgroundTransparency = 0.3
            }):Play()
        end)
    end

    setupControlButton(minimizeBtn, Color3.fromRGB(50, 70, 100))
    setupControlButton(closeBtn, Color3.fromRGB(180, 60, 60))

    closeBtn.MouseButton1Click:Connect(function()
        TweenService:Create(mainFrame, TweenInfo.new(0.2), {
            BackgroundTransparency = 1
        }):Play()
        TweenService:Create(acrylicLayer, TweenInfo.new(0.2), {
            BackgroundTransparency = 1
        }):Play()
        wait(0.2)
        screenGui:Destroy()
    end)

    local menuVisible = false
    local lastPosition = mainFrame.Position

    local function toggleMenu()
        menuVisible = not menuVisible

        if menuVisible then
            mainFrame.Visible = true
            mainFrame.Position = lastPosition

            TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = originalSize,
                BackgroundTransparency = 0.08
            }):Play()

            TweenService:Create(acrylicLayer, TweenInfo.new(0.25), {
                BackgroundTransparency = 0.2
            }):Play()

            TweenService:Create(toggleCircle, TweenInfo.new(0.25), {
                ImageColor3 = Color3.fromRGB(60, 180, 255)
            }):Play()
        else
            lastPosition = mainFrame.Position

            TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1
            }):Play()

            TweenService:Create(acrylicLayer, TweenInfo.new(0.25), {
                BackgroundTransparency = 1
            }):Play()

            TweenService:Create(toggleCircle, TweenInfo.new(0.25), {
                ImageColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()

            wait(0.25)
            mainFrame.Visible = false
        end
    end

    toggleCircle.MouseButton1Click:Connect(toggleMenu)

    toggleCircle.MouseEnter:Connect(function()
        TweenService:Create(toggleCircle, TweenInfo.new(0.15), {
            Size = UDim2.new(0, 60, 0, 60)
        }):Play()
    end)

    toggleCircle.MouseLeave:Connect(function()
        TweenService:Create(toggleCircle, TweenInfo.new(0.15), {
            Size = UDim2.new(0, 56, 0, 56)
        }):Play()
    end)

    local toggleDragging = false
    local toggleDragInput, toggleDragStart, toggleStartPos

    local function updateToggle(input)
        local delta = input.Position - toggleDragStart
        toggleCircle.Position = UDim2.new(
            toggleStartPos.X.Scale,
            toggleStartPos.X.Offset + delta.X,
            toggleStartPos.Y.Scale,
            toggleStartPos.Y.Offset + delta.Y
        )
    end

    toggleCircle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            toggleDragging = true
            toggleDragStart = input.Position
            toggleStartPos = toggleCircle.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    toggleDragging = false
                end
            end)
        end
    end)

    toggleCircle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            toggleDragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == toggleDragInput and toggleDragging then
            updateToggle(input)
        end
    end)

    local function onScreenResize()
        screenSize = workspace.CurrentCamera.ViewportSize
        
        if isMobile then
            baseWidth = math.min(380, screenSize.X * 0.85)
            baseHeight = math.min(440, screenSize.Y * 0.7)
        else
            baseWidth = 360
            baseHeight = 420
        end
        
        originalSize = UDim2.new(0, baseWidth, 0, baseHeight)
        minimizedSize = UDim2.new(0, baseWidth, 0, isMobile and 56 or 52)
        
        if not isMinimized then
            mainFrame.Size = originalSize
        else
            mainFrame.Size = minimizedSize
        end
    end

    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(onScreenResize)

    local module = {}
    module.CreateButton = function(text, callback, defaultKey)
        return createButton(contentContainer, text, callback, defaultKey)
    end
    module.CreateToggle = function(text, callback, defaultKey)
        return createToggle(contentContainer, text, callback, defaultKey)
    end
    module.LoadSettings = loadSettings
    module.SaveSettings = saveSettings
    module.ToggleMenu = toggleMenu
    module.ToggleMinimize = toggleMinimize
    
    return module
end

return Syllinse
