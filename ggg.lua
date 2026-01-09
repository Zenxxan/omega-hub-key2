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

    local player = Players.LocalPlayer
    local CoreGui = game:GetService("CoreGui")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ShadowStealHelper"
    screenGui.Parent = CoreGui
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local toggleCircle = Instance.new("ImageButton")
    toggleCircle.Name = "ToggleCircle"
    toggleCircle.Size = UDim2.new(0, 50, 0, 50)
    toggleCircle.Position = UDim2.new(0, 20, 0, 20)
    toggleCircle.Image = "rbxassetid://96928078987243"
    toggleCircle.ImageColor3 = Color3.fromRGB(255, 255, 255)
    toggleCircle.BackgroundTransparency = 1
    toggleCircle.Parent = screenGui
    toggleCircle.ZIndex = 10

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleCircle

    local toggleAcrylic = Instance.new("Frame")
    toggleAcrylic.Parent = toggleCircle
    toggleAcrylic.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    toggleAcrylic.BackgroundTransparency = 0.25
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
    toggleNoise.ImageTransparency = 0.92
    toggleNoise.ScaleType = Enum.ScaleType.Tile
    toggleNoise.TileSize = UDim2.new(0, 50, 0, 50)
    toggleNoise.ZIndex = -1

    local toggleGradient = Instance.new("UIGradient")
    toggleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 28, 36)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 20, 26)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 16, 22))
    })
    toggleGradient.Rotation = 135
    toggleGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.45),
        NumberSequenceKeypoint.new(0.4, 0.65),
        NumberSequenceKeypoint.new(1, 0.8)
    })
    toggleGradient.Parent = toggleAcrylic

    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Parent = toggleCircle
    toggleStroke.Color = Color3.fromRGB(70, 70, 85)
    toggleStroke.Thickness = 1.2
    toggleStroke.Transparency = 0.3

    local toggleInnerStroke = Instance.new("UIStroke")
    toggleInnerStroke.Parent = toggleAcrylic
    toggleInnerStroke.Color = Color3.fromRGB(255, 255, 255)
    toggleInnerStroke.Thickness = 0.9
    toggleInnerStroke.Transparency = 0.88

    local toggleGlow = Instance.new("Frame")
    toggleGlow.Parent = toggleCircle
    toggleGlow.BackgroundColor3 = Color3.fromRGB(0, 175, 255)
    toggleGlow.BackgroundTransparency = 0.9
    toggleGlow.Size = UDim2.new(1.1, 0, 1.1, 0)
    toggleGlow.Position = UDim2.new(-0.05, 0, -0.05, 0)
    toggleGlow.BorderSizePixel = 0
    toggleGlow.ZIndex = -2

    local toggleGlowCorner = Instance.new("UICorner")
    toggleGlowCorner.CornerRadius = UDim.new(1, 0)
    toggleGlowCorner.Parent = toggleGlow

    local toggleIcon = Instance.new("ImageLabel")
    toggleIcon.Parent = toggleCircle
    toggleIcon.Size = UDim2.new(0.6, 0, 0.6, 0)
    toggleIcon.Position = UDim2.new(0.2, 0, 0.2, 0)
    toggleIcon.BackgroundTransparency = 1
    toggleIcon.Image = "rbxassetid://10709868101"
    toggleIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    toggleIcon.ZIndex = 5

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 360, 0, 420)
    mainFrame.Position = UDim2.new(0.5, -180, 0.5, -210)
    mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
    mainFrame.BackgroundTransparency = 0.1
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Visible = true
    mainFrame.ClipsDescendants = true

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 14)
    mainCorner.Parent = mainFrame

    local acrylicLayer = Instance.new("Frame")
    acrylicLayer.Parent = mainFrame
    acrylicLayer.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    acrylicLayer.BackgroundTransparency = 0.25
    acrylicLayer.Size = UDim2.new(1, 0, 1, 0)
    acrylicLayer.BorderSizePixel = 0
    acrylicLayer.ZIndex = 0

    local acrylicCorner = Instance.new("UICorner")
    acrylicCorner.CornerRadius = UDim.new(0, 14)
    acrylicCorner.Parent = acrylicLayer

    local noiseOverlay = Instance.new("ImageLabel")
    noiseOverlay.Parent = acrylicLayer
    noiseOverlay.BackgroundTransparency = 1
    noiseOverlay.Size = UDim2.new(1, 0, 1, 0)
    noiseOverlay.Image = "rbxassetid://8992230677"
    noiseOverlay.ImageColor3 = Color3.fromRGB(255, 255, 255)
    noiseOverlay.ImageTransparency = 0.92
    noiseOverlay.ScaleType = Enum.ScaleType.Tile
    noiseOverlay.TileSize = UDim2.new(0, 100, 0, 100)
    noiseOverlay.ZIndex = 1

    local glassShine = Instance.new("Frame")
    glassShine.Parent = mainFrame
    glassShine.BackgroundTransparency = 1
    glassShine.Size = UDim2.new(1, 0, 0.4, 0)
    glassShine.ZIndex = 2
    glassShine.ClipsDescendants = true

    local shineGrad = Instance.new("UIGradient")
    shineGrad.Parent = glassShine
    shineGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    })
    shineGrad.Rotation = 175
    shineGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.85),
        NumberSequenceKeypoint.new(0.4, 0.95),
        NumberSequenceKeypoint.new(1, 1)
    })

    local innerGlow = Instance.new("Frame")
    innerGlow.Parent = mainFrame
    innerGlow.BackgroundColor3 = Color3.fromRGB(0, 175, 255)
    innerGlow.BackgroundTransparency = 0.92
    innerGlow.Size = UDim2.new(1, 0, 1, 0)
    innerGlow.BorderSizePixel = 0
    innerGlow.ZIndex = 1

    local innerGlowCorner = Instance.new("UICorner")
    innerGlowCorner.CornerRadius = UDim.new(0, 14)
    innerGlowCorner.Parent = innerGlow

    local outerGlow = Instance.new("Frame")
    outerGlow.Parent = mainFrame
    outerGlow.BackgroundColor3 = Color3.fromRGB(0, 140, 220)
    outerGlow.BackgroundTransparency = 0.94
    outerGlow.Size = UDim2.new(1.03, 0, 1.03, 0)
    outerGlow.Position = UDim2.new(-0.015, 0, -0.015, 0)
    outerGlow.BorderSizePixel = 0
    outerGlow.ZIndex = -1

    local outerGlowCorner = Instance.new("UICorner")
    outerGlowCorner.CornerRadius = UDim.new(0, 16)
    outerGlowCorner.Parent = outerGlow

    local stroke = Instance.new("UIStroke")
    stroke.Parent = mainFrame
    stroke.Color = Color3.fromRGB(70, 70, 85)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.25

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Parent = acrylicLayer
    innerStroke.Color = Color3.fromRGB(255, 255, 255)
    innerStroke.Thickness = 0.9
    innerStroke.Transparency = 0.88

    local mainGrad = Instance.new("UIGradient")
    mainGrad.Parent = mainFrame
    mainGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 22, 30)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(14, 14, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 16))
    })
    mainGrad.Rotation = 135
    mainGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.45),
        NumberSequenceKeypoint.new(0.4, 0.65),
        NumberSequenceKeypoint.new(1, 0.8)
    })

    local header = Instance.new("Frame")
    header.Parent = mainFrame
    header.BackgroundTransparency = 1
    header.Size = UDim2.new(1, 0, 0, 52)
    header.ZIndex = 10

    local headerAccent = Instance.new("Frame")
    headerAccent.Parent = header
    headerAccent.BackgroundColor3 = Color3.fromRGB(0, 175, 255)
    headerAccent.BackgroundTransparency = 0.7
    headerAccent.Position = UDim2.new(0, 16, 1, -2)
    headerAccent.Size = UDim2.new(1, -32, 0, 1)
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
    title.Text = "SHADOW STEAL HELPER"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 20
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 0.6, 0)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 10

    local titleGrad = Instance.new("UIGradient")
    titleGrad.Parent = title
    titleGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 220, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 180, 255))
    })

    local subtitle = Instance.new("TextLabel")
    subtitle.Parent = titleContainer
    subtitle.Text = "Professional Utility Suite"
    subtitle.Font = Enum.Font.GothamMedium
    subtitle.TextSize = 12
    subtitle.TextColor3 = Color3.fromRGB(160, 170, 200)
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
    minimizeBtn.Size = UDim2.new(0, 22, 0, 22)
    minimizeBtn.Position = UDim2.new(0, 2, 0, 10)
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    minimizeBtn.BackgroundTransparency = 0.4
    minimizeBtn.BorderSizePixel = 0
    minimizeBtn.Text = "−"
    minimizeBtn.TextColor3 = Color3.fromRGB(220, 220, 240)
    minimizeBtn.Font = Enum.Font.GothamMedium
    minimizeBtn.TextSize = 18
    minimizeBtn.ZIndex = 10
    minimizeBtn.Parent = controls

    local minimizeBtnCorner = Instance.new("UICorner")
    minimizeBtnCorner.CornerRadius = UDim.new(0, 5)
    minimizeBtnCorner.Parent = minimizeBtn

    local minimizeBtnStroke = Instance.new("UIStroke")
    minimizeBtnStroke.Parent = minimizeBtn
    minimizeBtnStroke.Color = Color3.fromRGB(80, 80, 100)
    minimizeBtnStroke.Thickness = 1
    minimizeBtnStroke.Transparency = 0.3

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 22, 0, 22)
    closeBtn.Position = UDim2.new(0, 26, 0, 10)
    closeBtn.BackgroundColor3 = Color3.fromRGB(40, 30, 35)
    closeBtn.BackgroundTransparency = 0.4
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.fromRGB(240, 180, 180)
    closeBtn.Font = Enum.Font.GothamMedium
    closeBtn.TextSize = 18
    closeBtn.ZIndex = 10
    closeBtn.Parent = controls

    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 5)
    closeBtnCorner.Parent = closeBtn

    local closeBtnStroke = Instance.new("UIStroke")
    closeBtnStroke.Parent = closeBtn
    closeBtnStroke.Color = Color3.fromRGB(120, 80, 90)
    closeBtnStroke.Thickness = 1
    closeBtnStroke.Transparency = 0.3

    local buttonStates = {}

    local contentContainer = Instance.new("ScrollingFrame")
    contentContainer.Parent = mainFrame
    contentContainer.BackgroundTransparency = 1
    contentContainer.Size = UDim2.new(1, -24, 1, -76)
    contentContainer.Position = UDim2.new(0, 12, 0, 64)
    contentContainer.ZIndex = 10
    contentContainer.ScrollBarThickness = 3
    contentContainer.ScrollBarImageColor3 = Color3.fromRGB(80, 90, 120)
    contentContainer.ScrollBarImageTransparency = 0.7
    contentContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    contentContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y

    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Parent = contentContainer
    contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.Padding = UDim.new(0, 10)

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
                        keybindButtons[id].toggleSwitch.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
                        keybindButtons[id].toggleFrame.BackgroundColor3 = Color3.fromRGB(20, 50, 40)
                        if keybindButtons[id].callback then
                            keybindButtons[id].callback(state)
                        end
                    else
                        keybindButtons[id].toggleSwitch.Position = UDim2.new(0.05, 0, 0.15, 0)
                        keybindButtons[id].toggleSwitch.BackgroundColor3 = Color3.fromRGB(120, 30, 30)
                        keybindButtons[id].toggleFrame.BackgroundColor3 = Color3.fromRGB(40, 30, 30)
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
        buttonContainer.Size = UDim2.new(1, 0, 0, 40)
        buttonContainer.BackgroundTransparency = 1
        buttonContainer.Parent = parent

        local containerBackground = Instance.new("Frame")
        containerBackground.Size = UDim2.new(1, 0, 1, 0)
        containerBackground.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
        containerBackground.BackgroundTransparency = 0.85
        containerBackground.BorderSizePixel = 0
        containerBackground.Parent = buttonContainer
        containerBackground.ZIndex = 1

        local backgroundCorner = Instance.new("UICorner")
        backgroundCorner.CornerRadius = UDim.new(0, 8)
        backgroundCorner.Parent = containerBackground

        local backgroundStroke = Instance.new("UIStroke")
        backgroundStroke.Parent = containerBackground
        backgroundStroke.Color = Color3.fromRGB(70, 80, 100)
        backgroundStroke.Thickness = 1
        backgroundStroke.Transparency = 0.6

        local textContainer = Instance.new("Frame")
        textContainer.Size = UDim2.new(0.6, 0, 1, 0)
        textContainer.BackgroundTransparency = 1
        textContainer.Parent = buttonContainer

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(0.9, 0, 0.5, 0)
        textLabel.Position = UDim2.new(0.05, 0, 0.2, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
        textLabel.Text = text
        textLabel.Font = Enum.Font.GothamSemibold
        textLabel.TextSize = 14
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Parent = textContainer
        textLabel.ZIndex = 2

        local description = Instance.new("TextLabel")
        description.Size = UDim2.new(0.9, 0, 0.5, 0)
        description.Position = UDim2.new(0.05, 0, 0.6, 0)
        description.BackgroundTransparency = 1
        description.TextColor3 = Color3.fromRGB(160, 170, 200)
        description.Text = "Toggle this feature on/off"
        description.Font = Enum.Font.Gotham
        description.TextSize = 11
        description.TextXAlignment = Enum.TextXAlignment.Left
        description.Parent = textContainer
        description.ZIndex = 2

        local toggleContainer = Instance.new("Frame")
        toggleContainer.Size = UDim2.new(0.35, 0, 1, 0)
        toggleContainer.Position = UDim2.new(0.65, 0, 0, 0)
        toggleContainer.BackgroundTransparency = 1
        toggleContainer.Parent = buttonContainer

        local toggleFrame = Instance.new("ImageButton")
        toggleFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
        toggleFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
        toggleFrame.BackgroundColor3 = Color3.fromRGB(40, 30, 30)
        toggleFrame.BackgroundTransparency = 0.2
        toggleFrame.BorderSizePixel = 0
        toggleFrame.ImageTransparency = 1
        toggleFrame.Parent = toggleContainer
        toggleFrame.ZIndex = 2

        local toggleSwitch = Instance.new("Frame")
        toggleSwitch.Size = UDim2.new(0.35, 0, 0.7, 0)
        toggleSwitch.Position = UDim2.new(0.05, 0, 0.15, 0)
        toggleSwitch.BackgroundColor3 = Color3.fromRGB(120, 30, 30)
        toggleSwitch.BackgroundTransparency = 0.2
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
        keybindButton.Size = UDim2.new(0.4, 0, 0.5, 0)
        keybindButton.Position = UDim2.new(0.55, 0, 0.25, 0)
        keybindButton.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        keybindButton.BackgroundTransparency = 0.3
        keybindButton.BorderSizePixel = 0
        keybindButton.TextColor3 = Color3.fromRGB(200, 210, 230)
        keybindButton.Text = defaultKey and tostring(defaultKey) or "NONE"
        keybindButton.Font = Enum.Font.GothamMedium
        keybindButton.TextSize = 11
        keybindButton.Parent = toggleContainer
        keybindButton.ZIndex = 2

        local keybindCorner = Instance.new("UICorner")
        keybindCorner.CornerRadius = UDim.new(0, 5)
        keybindCorner.Parent = keybindButton

        local keybindStroke = Instance.new("UIStroke")
        keybindStroke.Parent = keybindButton
        keybindStroke.Color = Color3.fromRGB(80, 90, 110)
        keybindStroke.Thickness = 1
        keybindStroke.Transparency = 0.4

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
                TweenService:Create(toggleSwitch, TweenInfo.new(0.2), {
                    Position = UDim2.new(0.55, 0, 0.15, 0),
                    BackgroundColor3 = Color3.fromRGB(0, 200, 100)
                }):Play()
                TweenService:Create(toggleFrame, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(20, 50, 40)
                }):Play()
            else
                TweenService:Create(toggleSwitch, TweenInfo.new(0.2), {
                    Position = UDim2.new(0.05, 0, 0.15, 0),
                    BackgroundColor3 = Color3.fromRGB(120, 30, 30)
                }):Play()
                TweenService:Create(toggleFrame, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(40, 30, 30)
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
                    keybindButton.TextColor3 = Color3.fromRGB(200, 210, 230)
                    updateKeybind(toggleId, key)
                    connection:Disconnect()
                end
            end)
        end)

        buttonContainer.MouseEnter:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.2), {
                Color = Color3.fromRGB(100, 150, 220),
                Transparency = 0.3
            }):Play()
        end)

        buttonContainer.MouseLeave:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.2), {
                Color = Color3.fromRGB(70, 80, 100),
                Transparency = 0.6
            }):Play()
        end)

        table.insert(allButtonFrames, buttonContainer)
        return buttonContainer
    end

    local function createButton(parent, text, callback, defaultKey)
        local buttonContainer = Instance.new("Frame")
        buttonContainer.Size = UDim2.new(1, 0, 0, 40)
        buttonContainer.BackgroundTransparency = 1
        buttonContainer.Parent = parent

        local containerBackground = Instance.new("Frame")
        containerBackground.Size = UDim2.new(1, 0, 1, 0)
        containerBackground.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
        containerBackground.BackgroundTransparency = 0.85
        containerBackground.BorderSizePixel = 0
        containerBackground.Parent = buttonContainer
        containerBackground.ZIndex = 1

        local backgroundCorner = Instance.new("UICorner")
        backgroundCorner.CornerRadius = UDim.new(0, 8)
        backgroundCorner.Parent = containerBackground

        local backgroundStroke = Instance.new("UIStroke")
        backgroundStroke.Parent = containerBackground
        backgroundStroke.Color = Color3.fromRGB(70, 80, 100)
        backgroundStroke.Thickness = 1
        backgroundStroke.Transparency = 0.6

        local textContainer = Instance.new("Frame")
        textContainer.Size = UDim2.new(0.6, 0, 1, 0)
        textContainer.BackgroundTransparency = 1
        textContainer.Parent = buttonContainer

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(0.9, 0, 0.5, 0)
        textLabel.Position = UDim2.new(0.05, 0, 0.2, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(240, 240, 255)
        textLabel.Text = text
        textLabel.Font = Enum.Font.GothamSemibold
        textLabel.TextSize = 14
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Parent = textContainer
        textLabel.ZIndex = 2

        local description = Instance.new("TextLabel")
        description.Size = UDim2.new(0.9, 0, 0.5, 0)
        description.Position = UDim2.new(0.05, 0, 0.6, 0)
        description.BackgroundTransparency = 1
        description.TextColor3 = Color3.fromRGB(160, 170, 200)
        description.Text = "Click to execute"
        description.Font = Enum.Font.Gotham
        description.TextSize = 11
        description.TextXAlignment = Enum.TextXAlignment.Left
        description.Parent = textContainer
        description.ZIndex = 2

        local buttonContainerRight = Instance.new("Frame")
        buttonContainerRight.Size = UDim2.new(0.35, 0, 1, 0)
        buttonContainerRight.Position = UDim2.new(0.65, 0, 0, 0)
        buttonContainerRight.BackgroundTransparency = 1
        buttonContainerRight.Parent = buttonContainer

        local actionButton = Instance.new("TextButton")
        actionButton.Size = UDim2.new(0.5, 0, 0.5, 0)
        actionButton.Position = UDim2.new(0.25, 0, 0.25, 0)
        actionButton.BackgroundColor3 = Color3.fromRGB(30, 40, 60)
        actionButton.BackgroundTransparency = 0.2
        actionButton.BorderSizePixel = 0
        actionButton.TextColor3 = Color3.fromRGB(220, 230, 255)
        actionButton.Text = "EXECUTE"
        actionButton.Font = Enum.Font.GothamMedium
        actionButton.TextSize = 11
        actionButton.Parent = buttonContainerRight
        actionButton.ZIndex = 2

        local actionCorner = Instance.new("UICorner")
        actionCorner.CornerRadius = UDim.new(0, 6)
        actionCorner.Parent = actionButton

        local actionStroke = Instance.new("UIStroke")
        actionStroke.Parent = actionButton
        actionStroke.Color = Color3.fromRGB(80, 120, 180)
        actionStroke.Thickness = 1
        actionStroke.Transparency = 0.4

        local keybindButton = Instance.new("TextButton")
        keybindButton.Size = UDim2.new(0.4, 0, 0.5, 0)
        keybindButton.Position = UDim2.new(0.55, 0, 0.25, 0)
        keybindButton.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        keybindButton.BackgroundTransparency = 0.3
        keybindButton.BorderSizePixel = 0
        keybindButton.TextColor3 = Color3.fromRGB(200, 210, 230)
        keybindButton.Text = defaultKey and tostring(defaultKey) or "NONE"
        keybindButton.Font = Enum.Font.GothamMedium
        keybindButton.TextSize = 11
        keybindButton.Parent = buttonContainerRight
        keybindButton.ZIndex = 2

        local keybindCorner = Instance.new("UICorner")
        keybindCorner.CornerRadius = UDim.new(0, 5)
        keybindCorner.Parent = keybindButton

        local keybindStroke = Instance.new("UIStroke")
        keybindStroke.Parent = keybindButton
        keybindStroke.Color = Color3.fromRGB(80, 90, 110)
        keybindStroke.Thickness = 1
        keybindStroke.Transparency = 0.4

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
                BackgroundColor3 = Color3.fromRGB(40, 60, 90)
            }):Play()
            TweenService:Create(actionStroke, TweenInfo.new(0.1), {
                Color = Color3.fromRGB(100, 180, 255)
            }):Play()
        end)

        actionButton.MouseLeave:Connect(function()
            TweenService:Create(actionButton, TweenInfo.new(0.1), {
                BackgroundColor3 = Color3.fromRGB(30, 40, 60)
            }):Play()
            TweenService:Create(actionStroke, TweenInfo.new(0.1), {
                Color = Color3.fromRGB(80, 120, 180)
            }):Play()
        end)

        buttonContainer.MouseEnter:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.2), {
                Color = Color3.fromRGB(100, 150, 220),
                Transparency = 0.3
            }):Play()
        end)

        buttonContainer.MouseLeave:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.2), {
                Color = Color3.fromRGB(70, 80, 100),
                Transparency = 0.6
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
                    keybindButton.TextColor3 = Color3.fromRGB(200, 210, 230)
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
    local minimizedSize = UDim2.new(0, 360, 0, 52)

    local function toggleMinimize()
        isMinimized = not isMinimized

        if isMinimized then
            for _, buttonFrame in ipairs(allButtonFrames) do
                buttonFrame.Visible = false
            end
            contentContainer.Visible = false
            acrylicLayer.Visible = false
            glassShine.Visible = false
            innerGlow.Visible = false
            outerGlow.Visible = false

            TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = minimizedSize
            }):Play()
            minimizeBtn.Text = "+"
        else
            for _, buttonFrame in ipairs(allButtonFrames) do
                buttonFrame.Visible = true
            end

            contentContainer.Visible = true
            acrylicLayer.Visible = true
            glassShine.Visible = true
            innerGlow.Visible = true
            outerGlow.Visible = true

            TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
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
                BackgroundTransparency = 0.2
            }):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.1), {
                BackgroundColor3 = button.Name == "MinimizeBtn" and Color3.fromRGB(30, 30, 40) or Color3.fromRGB(40, 30, 35),
                BackgroundTransparency = 0.4
            }):Play()
        end)
    end

    minimizeBtn.Name = "MinimizeBtn"
    closeBtn.Name = "CloseBtn"
    
    setupControlButton(minimizeBtn, Color3.fromRGB(50, 70, 100))
    setupControlButton(closeBtn, Color3.fromRGB(180, 60, 60))

    closeBtn.MouseButton1Click:Connect(function()
        TweenService:Create(mainFrame, TweenInfo.new(0.2), {
            BackgroundTransparency = 1
        }):Play()
        TweenService:Create(acrylicLayer, TweenInfo.new(0.2), {
            BackgroundTransparency = 1
        }):Play()
        TweenService:Create(outerGlow, TweenInfo.new(0.2), {
            BackgroundTransparency = 1
        }):Play()
        wait(0.2)
        screenGui:Destroy()
    end)

    if UserInputService.TouchEnabled then
        mainFrame.Size = UDim2.new(0, 380, 0, 440)
        originalSize = mainFrame.Size
        minimizedSize = UDim2.new(0, 380, 0, 52)

        for _, buttonFrame in ipairs(allButtonFrames) do
            local textButton = buttonFrame:FindFirstChildOfClass("TextButton")
            if textButton and textButton.TextSize then
                textButton.TextSize = textButton.TextSize + 2
            end
        end
    end

    local menuVisible = false

    local function toggleMenu()
        menuVisible = not menuVisible

        if menuVisible then
            mainFrame.Visible = true

            TweenService:Create(mainFrame, TweenInfo.new(0.3), {
                Position = UDim2.new(0.5, -180, 0.5, -210),
                Size = originalSize,
                BackgroundTransparency = 0.1
            }):Play()

            TweenService:Create(acrylicLayer, TweenInfo.new(0.3), {
                BackgroundTransparency = 0.25
            }):Play()

            TweenService:Create(outerGlow, TweenInfo.new(0.3), {
                BackgroundTransparency = 0.94
            }):Play()

            TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
                ImageColor3 = Color3.fromRGB(0, 200, 255)
            }):Play()
            
            TweenService:Create(toggleGlow, TweenInfo.new(0.3), {
                BackgroundTransparency = 0.85
            }):Play()
        else
            TweenService:Create(mainFrame, TweenInfo.new(0.3), {
                Position = UDim2.new(0.5, -180, 0.5, -25),
                Size = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1
            }):Play()

            TweenService:Create(acrylicLayer, TweenInfo.new(0.3), {
                BackgroundTransparency = 1
            }):Play()

            TweenService:Create(outerGlow, TweenInfo.new(0.3), {
                BackgroundTransparency = 1
            }):Play()

            TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
                ImageColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
            
            TweenService:Create(toggleGlow, TweenInfo.new(0.3), {
                BackgroundTransparency = 0.95
            }):Play()

            wait(0.3)
            mainFrame.Visible = false
        end
    end

    toggleCircle.MouseButton1Click:Connect(toggleMenu)

    toggleCircle.MouseEnter:Connect(function()
        TweenService:Create(toggleCircle, TweenInfo.new(0.2), {
            Size = UDim2.new(0, 54, 0, 54)
        }):Play()
        TweenService:Create(toggleGlow, TweenInfo.new(0.2), {
            Size = UDim2.new(1.15, 0, 1.15, 0),
            Position = UDim2.new(-0.075, 0, -0.075, 0)
        }):Play()
    end)

    toggleCircle.MouseLeave:Connect(function()
        TweenService:Create(toggleCircle, TweenInfo.new(0.2), {
            Size = UDim2.new(0, 50, 0, 50)
        }):Play()
        TweenService:Create(toggleGlow, TweenInfo.new(0.2), {
            Size = UDim2.new(1.1, 0, 1.1, 0),
            Position = UDim2.new(-0.05, 0, -0.05, 0)
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
