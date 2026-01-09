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
    screenGui.Name = "Syllinse"
    screenGui.Parent = CoreGui
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local screenSize = workspace.CurrentCamera.ViewportSize
    local isMobile = UserInputService.TouchEnabled
    
    local function calculateScale()
       local baseResolution = Vector2.new(1920, 1080)
       local currentResolution = screenSize
       local scaleX = currentResolution.X / baseResolution.X
       local scaleY = currentResolution.Y / baseResolution.Y
       local minScale = math.min(scaleX, scaleY)
    
       if currentResolution.X > 3840 then  -- 4K
            return minScale * 1.1  -- 110% (bigger than normal!)
       elseif currentResolution.X > 2560 then
            return minScale * 1.0  -- 100%
       elseif currentResolution.X > 1920 then
            return minScale * 0.9  -- 90%
       else
            return minScale * 0.85  -- 85%
       end
    end

    
    local uiScale = calculateScale()
    
    local baseWidth = math.floor(380 * uiScale)
    local baseHeight = math.floor(450 * uiScale)
    
    local toggleSize = math.floor(50 * uiScale)

    local toggleCircle = Instance.new("ImageButton")
    toggleCircle.Name = "ToggleCircle"
    toggleCircle.Size = UDim2.new(0, toggleSize, 0, toggleSize)
    toggleCircle.Position = UDim2.new(0, 20, 0, 20)
    toggleCircle.Image = "rbxassetid://96928078987243"
    toggleCircle.ImageColor3 = Color3.fromRGB(255, 255, 255)
    toggleCircle.BackgroundTransparency = 1
    toggleCircle.Parent = screenGui
    toggleCircle.ZIndex = 100

    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleCircle

    local toggleAcrylic = Instance.new("Frame")
    toggleAcrylic.Parent = toggleCircle
    toggleAcrylic.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    toggleAcrylic.BackgroundTransparency = 1
    toggleAcrylic.Size = UDim2.new(1, 0, 1, 0)
    toggleAcrylic.BorderSizePixel = 0
    toggleAcrylic.ZIndex = -1

    local toggleAcrylicCorner = Instance.new("UICorner")
    toggleAcrylicCorner.CornerRadius = UDim.new(1, 0)
    toggleAcrylicCorner.Parent = toggleAcrylic

    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Parent = toggleCircle
    toggleStroke.Color = Color3.fromRGB(110, 110, 130)
    toggleStroke.Thickness = 1.5
    toggleStroke.Transparency = 0.08

    local toggleInnerStroke = Instance.new("UIStroke")
    toggleInnerStroke.Parent = toggleAcrylic
    toggleInnerStroke.Color = Color3.fromRGB(255, 255, 255)
    toggleInnerStroke.Thickness = 1
    toggleInnerStroke.Transparency = 0.7

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, baseWidth, 0, baseHeight)
    mainFrame.Position = UDim2.new(0.5, -baseWidth/2, 0.5, -baseHeight/2)
    mainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    mainFrame.BackgroundTransparency = 0.02
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Visible = false
    mainFrame.ClipsDescendants = true

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 10)
    mainCorner.Parent = mainFrame

    local acrylicLayer = Instance.new("Frame")
    acrylicLayer.Parent = mainFrame
    acrylicLayer.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
    acrylicLayer.BackgroundTransparency = 0.08
    acrylicLayer.Size = UDim2.new(1, 0, 1, 0)
    acrylicLayer.BorderSizePixel = 0
    acrylicLayer.ZIndex = 0

    local acrylicCorner = Instance.new("UICorner")
    acrylicCorner.CornerRadius = UDim.new(0, 10)
    acrylicCorner.Parent = acrylicLayer

    local stroke = Instance.new("UIStroke")
    stroke.Parent = mainFrame
    stroke.Color = Color3.fromRGB(110, 110, 130)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.04

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Parent = acrylicLayer
    innerStroke.Color = Color3.fromRGB(255, 255, 255)
    innerStroke.Thickness = 1
    innerStroke.Transparency = 0.7

    local header = Instance.new("Frame")
    header.Parent = mainFrame
    header.BackgroundTransparency = 1
    header.Size = UDim2.new(1, 0, 0, math.floor(50 * uiScale))
    header.ZIndex = 10

    local headerAccent = Instance.new("Frame")
    headerAccent.Parent = header
    headerAccent.BackgroundColor3 = Color3.fromRGB(90, 210, 255)
    headerAccent.BackgroundTransparency = 0.35
    headerAccent.Position = UDim2.new(0, math.floor(20 * uiScale), 1, -1)
    headerAccent.Size = UDim2.new(1, -math.floor(40 * uiScale), 0, 1)
    headerAccent.BorderSizePixel = 0
    headerAccent.ZIndex = 10

    local titleContainer = Instance.new("Frame")
    titleContainer.Parent = header
    titleContainer.BackgroundTransparency = 1
    titleContainer.Position = UDim2.new(0, math.floor(20 * uiScale), 0, 0)
    titleContainer.Size = UDim2.new(1, -math.floor(70 * uiScale), 1, 0)
    titleContainer.ZIndex = 10

    local title = Instance.new("TextLabel")
    title.Parent = titleContainer
    title.Text = "SYLLINSE"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = math.floor(22 * uiScale)
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 1, 0)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 10

    local titleGradient = Instance.new("UIGradient")
    titleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 220, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 180, 255))
    })
    titleGradient.Parent = title

    local controls = Instance.new("Frame")
    controls.Size = UDim2.new(0, math.floor(50 * uiScale), 1, 0)
    controls.Position = UDim2.new(1, -math.floor(50 * uiScale), 0, 0)
    controls.BackgroundTransparency = 1
    controls.Parent = header
    controls.ZIndex = 10

    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Size = UDim2.new(0, math.floor(24 * uiScale), 0, math.floor(24 * uiScale))
    minimizeBtn.Position = UDim2.new(0, 2, 0, math.floor(12 * uiScale))
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
    minimizeBtn.BackgroundTransparency = 0.12
    minimizeBtn.BorderSizePixel = 0
    minimizeBtn.Text = "−"
    minimizeBtn.TextColor3 = Color3.fromRGB(235, 235, 255)
    minimizeBtn.Font = Enum.Font.GothamMedium
    minimizeBtn.TextSize = math.floor(18 * uiScale)
    minimizeBtn.ZIndex = 10
    minimizeBtn.Parent = controls

    local minimizeBtnCorner = Instance.new("UICorner")
    minimizeBtnCorner.CornerRadius = UDim.new(0, 5)
    minimizeBtnCorner.Parent = minimizeBtn

    local minimizeBtnStroke = Instance.new("UIStroke")
    minimizeBtnStroke.Parent = minimizeBtn
    minimizeBtnStroke.Color = Color3.fromRGB(120, 120, 140)
    minimizeBtnStroke.Thickness = 1
    minimizeBtnStroke.Transparency = 0.08

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, math.floor(24 * uiScale), 0, math.floor(24 * uiScale))
    closeBtn.Position = UDim2.new(0, math.floor(26 * uiScale), 0, math.floor(12 * uiScale))
    closeBtn.BackgroundColor3 = Color3.fromRGB(52, 42, 47)
    closeBtn.BackgroundTransparency = 0.12
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.fromRGB(255, 195, 195)
    closeBtn.Font = Enum.Font.GothamMedium
    closeBtn.TextSize = math.floor(18 * uiScale)
    closeBtn.ZIndex = 10
    closeBtn.Parent = controls

    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 5)
    closeBtnCorner.Parent = closeBtn

    local closeBtnStroke = Instance.new("UIStroke")
    closeBtnStroke.Parent = closeBtn
    closeBtnStroke.Color = Color3.fromRGB(160, 110, 120)
    closeBtnStroke.Thickness = 1
    closeBtnStroke.Transparency = 0.08

    local buttonStates = {}

    local contentContainer = Instance.new("ScrollingFrame")
    contentContainer.Parent = mainFrame
    contentContainer.BackgroundTransparency = 1
    contentContainer.Size = UDim2.new(1, -math.floor(20 * uiScale), 1, -math.floor(70 * uiScale))
    contentContainer.Position = UDim2.new(0, math.floor(10 * uiScale), 0, math.floor(60 * uiScale))
    contentContainer.ZIndex = 10
    contentContainer.ScrollBarThickness = math.floor(5 * uiScale)
    contentContainer.ScrollBarImageColor3 = Color3.fromRGB(120, 130, 160)
    contentContainer.ScrollBarImageTransparency = 0.35
    contentContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
    contentContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y

    local contentLayout = Instance.new("UIGridLayout")
    contentLayout.Parent = contentContainer
    contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.CellPadding = UDim2.new(0, math.floor(8 * uiScale), 0, math.floor(8 * uiScale))
    contentLayout.CellSize = UDim2.new(0.5, -math.floor(4 * uiScale), 0, math.floor(45 * uiScale))

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
                        keybindButtons[id].toggleSwitch.Position = UDim2.new(0.55, 0, 0.5, 0)
                        keybindButtons[id].toggleSwitch.AnchorPoint = Vector2.new(0, 0.5)
                        keybindButtons[id].toggleSwitch.BackgroundColor3 = Color3.fromRGB(55, 230, 130)
                        keybindButtons[id].toggleFrame.BackgroundColor3 = Color3.fromRGB(40, 70, 60)
                        if keybindButtons[id].callback then
                            keybindButtons[id].callback(state)
                        end
                    else
                        keybindButtons[id].toggleSwitch.Position = UDim2.new(0.05, 0, 0.5, 0)
                        keybindButtons[id].toggleSwitch.AnchorPoint = Vector2.new(0, 0.5)
                        keybindButtons[id].toggleSwitch.BackgroundColor3 = Color3.fromRGB(170, 55, 55)
                        keybindButtons[id].toggleFrame.BackgroundColor3 = Color3.fromRGB(60, 50, 50)
                        if keybindButtons[id].callback then
                            keybindInfo.callback(false)
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
        buttonContainer.Size = UDim2.new(1, 0, 1, 0)
        buttonContainer.BackgroundTransparency = 1
        buttonContainer.Parent = parent

        local containerBackground = Instance.new("Frame")
        containerBackground.Size = UDim2.new(1, 0, 1, 0)
        containerBackground.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
        containerBackground.BackgroundTransparency = 0.65
        containerBackground.BorderSizePixel = 0
        containerBackground.Parent = buttonContainer
        containerBackground.ZIndex = 1

        local backgroundCorner = Instance.new("UICorner")
        backgroundCorner.CornerRadius = UDim.new(0, 8)
        backgroundCorner.Parent = containerBackground

        local backgroundStroke = Instance.new("UIStroke")
        backgroundStroke.Parent = containerBackground
        backgroundStroke.Color = Color3.fromRGB(110, 120, 150)
        backgroundStroke.Thickness = 1
        backgroundStroke.Transparency = 0.3

        local contentFrame = Instance.new("Frame")
        contentFrame.Size = UDim2.new(1, -math.floor(18 * uiScale), 1, 0)
        contentFrame.Position = UDim2.new(0, math.floor(9 * uiScale), 0, 0)
        contentFrame.BackgroundTransparency = 1
        contentFrame.Parent = buttonContainer
        contentFrame.ZIndex = 2

        local labelContainer = Instance.new("Frame")
        labelContainer.Size = UDim2.new(0.6, 0, 1, 0)
        labelContainer.BackgroundTransparency = 1
        labelContainer.Parent = contentFrame

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.Text = text
        textLabel.Font = Enum.Font.GothamSemibold
        textLabel.TextSize = math.floor(14 * uiScale)
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Parent = labelContainer
        textLabel.ZIndex = 2

        local toggleContainer = Instance.new("Frame")
        toggleContainer.Size = UDim2.new(0.4, 0, 1, 0)
        toggleContainer.Position = UDim2.new(0.6, 0, 0, 0)
        toggleContainer.BackgroundTransparency = 1
        toggleContainer.Parent = contentFrame

        local toggleFrame = Instance.new("ImageButton")
        toggleFrame.Size = UDim2.new(0.5, 0, 0.38, 0)
        toggleFrame.Position = UDim2.new(0, 0, 0.5, 0)
        toggleFrame.AnchorPoint = Vector2.new(0, 0.5)
        toggleFrame.BackgroundColor3 = Color3.fromRGB(60, 50, 50)
        toggleFrame.BackgroundTransparency = 0.05
        toggleFrame.BorderSizePixel = 0
        toggleFrame.ImageTransparency = 1
        toggleFrame.Parent = toggleContainer
        toggleFrame.ZIndex = 2

        local toggleSwitch = Instance.new("Frame")
        toggleSwitch.Size = UDim2.new(0.32, 0, 0.78, 0)
        toggleSwitch.Position = UDim2.new(0.06, 0, 0.5, 0)
        toggleSwitch.AnchorPoint = Vector2.new(0, 0.5)
        toggleSwitch.BackgroundColor3 = Color3.fromRGB(170, 55, 55)
        toggleSwitch.BackgroundTransparency = 0.05
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
        keybindButton.Size = UDim2.new(0.5, 0, 0.65, 0)
        keybindButton.Position = UDim2.new(0.5, 0, 0.5, 0)
        keybindButton.AnchorPoint = Vector2.new(0, 0.5)
        keybindButton.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
        keybindButton.BackgroundTransparency = 0.1
        keybindButton.BorderSizePixel = 0
        keybindButton.TextColor3 = Color3.fromRGB(225, 235, 255)
        keybindButton.Text = defaultKey and tostring(defaultKey) or "NONE"
        keybindButton.Font = Enum.Font.GothamMedium
        keybindButton.TextSize = math.floor(11 * uiScale)
        keybindButton.Parent = toggleContainer
        keybindButton.ZIndex = 2

        local keybindCorner = Instance.new("UICorner")
        keybindCorner.CornerRadius = UDim.new(0, 5)
        keybindCorner.Parent = keybindButton

        local keybindStroke = Instance.new("UIStroke")
        keybindStroke.Parent = keybindButton
        keybindStroke.Color = Color3.fromRGB(120, 130, 150)
        keybindStroke.Thickness = 0.8
        keybindStroke.Transparency = 0.15

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
                TweenService:Create(toggleSwitch, TweenInfo.new(0.07), {
                    Position = UDim2.new(0.62, 0, 0.5, 0),
                    BackgroundColor3 = Color3.fromRGB(55, 230, 130)
                }):Play()
                TweenService:Create(toggleFrame, TweenInfo.new(0.07), {
                    BackgroundColor3 = Color3.fromRGB(40, 70, 60)
                }):Play()
            else
                TweenService:Create(toggleSwitch, TweenInfo.new(0.07), {
                    Position = UDim2.new(0.06, 0, 0.5, 0),
                    BackgroundColor3 = Color3.fromRGB(170, 55, 55)
                }):Play()
                TweenService:Create(toggleFrame, TweenInfo.new(0.07), {
                    BackgroundColor3 = Color3.fromRGB(60, 50, 50)
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
                    keybindButton.TextColor3 = Color3.fromRGB(225, 235, 255)
                    updateKeybind(toggleId, key)
                    connection:Disconnect()
                end
            end)
        end)

        buttonContainer.MouseEnter:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.07), {
                Color = Color3.fromRGB(130, 190, 255),
                Transparency = 0.1
            }):Play()
        end)

        buttonContainer.MouseLeave:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.07), {
                Color = Color3.fromRGB(110, 120, 150),
                Transparency = 0.3
            }):Play()
        end)

        table.insert(allButtonFrames, buttonContainer)
        return buttonContainer
    end

    local function createButton(parent, text, callback, defaultKey)
        local buttonContainer = Instance.new("Frame")
        buttonContainer.Size = UDim2.new(1, 0, 1, 0)
        buttonContainer.BackgroundTransparency = 1
        buttonContainer.Parent = parent

        local containerBackground = Instance.new("Frame")
        containerBackground.Size = UDim2.new(1, 0, 1, 0)
        containerBackground.BackgroundColor3 = Color3.fromRGB(32, 32, 40)
        containerBackground.BackgroundTransparency = 0.65
        containerBackground.BorderSizePixel = 0
        containerBackground.Parent = buttonContainer
        containerBackground.ZIndex = 1

        local backgroundCorner = Instance.new("UICorner")
        backgroundCorner.CornerRadius = UDim.new(0, 8)
        backgroundCorner.Parent = containerBackground

        local backgroundStroke = Instance.new("UIStroke")
        backgroundStroke.Parent = containerBackground
        backgroundStroke.Color = Color3.fromRGB(110, 120, 150)
        backgroundStroke.Thickness = 1
        backgroundStroke.Transparency = 0.3

        local contentFrame = Instance.new("Frame")
        contentFrame.Size = UDim2.new(1, -math.floor(18 * uiScale), 1, 0)
        contentFrame.Position = UDim2.new(0, math.floor(9 * uiScale), 0, 0)
        contentFrame.BackgroundTransparency = 1
        contentFrame.Parent = buttonContainer
        contentFrame.ZIndex = 2

        local labelContainer = Instance.new("Frame")
        labelContainer.Size = UDim2.new(0.6, 0, 1, 0)
        labelContainer.BackgroundTransparency = 1
        labelContainer.Parent = contentFrame

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.Text = text
        textLabel.Font = Enum.Font.GothamSemibold
        textLabel.TextSize = math.floor(14 * uiScale)
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Parent = labelContainer
        textLabel.ZIndex = 2

        local buttonContainerRight = Instance.new("Frame")
        buttonContainerRight.Size = UDim2.new(0.4, 0, 1, 0)
        buttonContainerRight.Position = UDim2.new(0.6, 0, 0, 0)
        buttonContainerRight.BackgroundTransparency = 1
        buttonContainerRight.Parent = contentFrame

        local actionButton = Instance.new("TextButton")
        actionButton.Size = UDim2.new(0.5, 0, 0.65, 0)
        actionButton.Position = UDim2.new(0, 0, 0.5, 0)
        actionButton.AnchorPoint = Vector2.new(0, 0.5)
        actionButton.BackgroundColor3 = Color3.fromRGB(48, 58, 78)
        actionButton.BackgroundTransparency = 0.05
        actionButton.BorderSizePixel = 0
        actionButton.TextColor3 = Color3.fromRGB(235, 245, 255)
        actionButton.Text = "RUN"
        actionButton.Font = Enum.Font.GothamMedium
        actionButton.TextSize = math.floor(11 * uiScale)
        actionButton.Parent = buttonContainerRight
        actionButton.ZIndex = 2

        local actionCorner = Instance.new("UICorner")
        actionCorner.CornerRadius = UDim.new(0, 5)
        actionCorner.Parent = actionButton

        local actionStroke = Instance.new("UIStroke")
        actionStroke.Parent = actionButton
        actionStroke.Color = Color3.fromRGB(120, 160, 220)
        actionStroke.Thickness = 0.8
        actionStroke.Transparency = 0.15

        local keybindButton = Instance.new("TextButton")
        keybindButton.Size = UDim2.new(0.5, 0, 0.65, 0)
        keybindButton.Position = UDim2.new(0.5, 0, 0.5, 0)
        keybindButton.AnchorPoint = Vector2.new(0, 0.5)
        keybindButton.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
        keybindButton.BackgroundTransparency = 0.1
        keybindButton.BorderSizePixel = 0
        keybindButton.TextColor3 = Color3.fromRGB(225, 235, 255)
        keybindButton.Text = defaultKey and tostring(defaultKey) or "NONE"
        keybindButton.Font = Enum.Font.GothamMedium
        keybindButton.TextSize = math.floor(11 * uiScale)
        keybindButton.Parent = buttonContainerRight
        keybindButton.ZIndex = 2

        local keybindCorner = Instance.new("UICorner")
        keybindCorner.CornerRadius = UDim.new(0, 5)
        keybindCorner.Parent = keybindButton

        local keybindStroke = Instance.new("UIStroke")
        keybindStroke.Parent = keybindButton
        keybindStroke.Color = Color3.fromRGB(120, 130, 150)
        keybindStroke.Thickness = 0.8
        keybindStroke.Transparency = 0.15

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
            TweenService:Create(actionButton, TweenInfo.new(0.07), {
                BackgroundColor3 = Color3.fromRGB(58, 78, 118)
            }):Play()
            TweenService:Create(actionStroke, TweenInfo.new(0.07), {
                Color = Color3.fromRGB(140, 220, 255)
            }):Play()
        end)

        actionButton.MouseLeave:Connect(function()
            TweenService:Create(actionButton, TweenInfo.new(0.07), {
                BackgroundColor3 = Color3.fromRGB(48, 58, 78)
            }):Play()
            TweenService:Create(actionStroke, TweenInfo.new(0.07), {
                Color = Color3.fromRGB(120, 160, 220)
            }):Play()
        end)

        buttonContainer.MouseEnter:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.07), {
                Color = Color3.fromRGB(130, 190, 255),
                Transparency = 0.1
            }):Play()
        end)

        buttonContainer.MouseLeave:Connect(function()
            TweenService:Create(backgroundStroke, TweenInfo.new(0.07), {
                Color = Color3.fromRGB(110, 120, 150),
                Transparency = 0.3
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
                    keybindButton.TextColor3 = Color3.fromRGB(225, 235, 255)
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
    local minimizedSize = UDim2.new(0, baseWidth, 0, math.floor(50 * uiScale))

    local function toggleMinimize()
        isMinimized = not isMinimized

        if isMinimized then
            for _, buttonFrame in ipairs(allButtonFrames) do
                buttonFrame.Visible = false
            end
            contentContainer.Visible = false
            acrylicLayer.Visible = false

            TweenService:Create(mainFrame, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = minimizedSize
            }):Play()
            minimizeBtn.Text = "+"
        else
            for _, buttonFrame in ipairs(allButtonFrames) do
                buttonFrame.Visible = true
            end

            contentContainer.Visible = true
            acrylicLayer.Visible = true

            TweenService:Create(mainFrame, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = originalSize
            }):Play()
            minimizeBtn.Text = "−"
        end
    end

    minimizeBtn.MouseButton1Click:Connect(toggleMinimize)

    local function setupControlButton(button, hoverColor)
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.07), {
                BackgroundColor3 = hoverColor,
                BackgroundTransparency = 0.02
            }):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.07), {
                BackgroundColor3 = button == minimizeBtn and Color3.fromRGB(42, 42, 52) or Color3.fromRGB(52, 42, 47),
                BackgroundTransparency = 0.12
            }):Play()
        end)
    end

    setupControlButton(minimizeBtn, Color3.fromRGB(68, 88, 128))
    setupControlButton(closeBtn, Color3.fromRGB(210, 80, 80))

    closeBtn.MouseButton1Click:Connect(function()
        TweenService:Create(mainFrame, TweenInfo.new(0.16), {
            BackgroundTransparency = 1
        }):Play()
        TweenService:Create(acrylicLayer, TweenInfo.new(0.16), {
            BackgroundTransparency = 1
        }):Play()
        wait(0.16)
        screenGui:Destroy()
    end)

    local menuVisible = false
    local lastPosition = mainFrame.Position

    local function toggleMenu()
        menuVisible = not menuVisible

        if menuVisible then
            mainFrame.Visible = true
            mainFrame.Position = lastPosition

            TweenService:Create(mainFrame, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = originalSize,
                BackgroundTransparency = 0.02
            }):Play()

            TweenService:Create(acrylicLayer, TweenInfo.new(0.16), {
                BackgroundTransparency = 0.08
            }):Play()

            TweenService:Create(toggleCircle, TweenInfo.new(0.16), {
                ImageColor3 = Color3.fromRGB(90, 210, 255)
            }):Play()
        else
            lastPosition = mainFrame.Position

            TweenService:Create(mainFrame, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1
            }):Play()

            TweenService:Create(acrylicLayer, TweenInfo.new(0.16), {
                BackgroundTransparency = 1
            }):Play()

            TweenService:Create(toggleCircle, TweenInfo.new(0.16), {
                ImageColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()

            wait(0.16)
            mainFrame.Visible = false
        end
    end

    toggleCircle.MouseButton1Click:Connect(toggleMenu)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then
            return
        end
        if input.KeyCode == Enum.KeyCode.LeftControl then
            toggleMenu()
        end
    end)

    toggleCircle.MouseEnter:Connect(function()
        TweenService:Create(toggleCircle, TweenInfo.new(0.07), {
            Size = UDim2.new(0, math.floor(toggleSize * 1.1), 0, math.floor(toggleSize * 1.1))
        }):Play()
    end)

    toggleCircle.MouseLeave:Connect(function()
        TweenService:Create(toggleCircle, TweenInfo.new(0.07), {
            Size = UDim2.new(0, toggleSize, 0, toggleSize)
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
        
        uiScale = calculateScale()
        
        baseWidth = math.floor(380 * uiScale)
        baseHeight = math.floor(450 * uiScale)
        toggleSize = math.floor(50 * uiScale)
        
        originalSize = UDim2.new(0, baseWidth, 0, baseHeight)
        minimizedSize = UDim2.new(0, baseWidth, 0, math.floor(50 * uiScale))
        
        if not isMinimized then
            mainFrame.Size = originalSize
        else
            mainFrame.Size = minimizedSize
        end
        
        mainFrame.Position = UDim2.new(0.5, -baseWidth/2, 0.5, -baseHeight/2)
        
        toggleCircle.Size = UDim2.new(0, toggleSize, 0, toggleSize)
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
