local Syllinse = {}

function Syllinse:Load()
    local Players = game:GetService('Players')
    local RunService = game:GetService('RunService')
    local Workspace = game:GetService('Workspace')
    local ReplicatedStorage = game:GetService('ReplicatedStorage')
    local CoreGui = game:GetService('CoreGui')
    local UserInputService = game:GetService('UserInputService')
    local TweenService = game:GetService('TweenService')
    local Lighting = game:GetService('Lighting')

    local player = Players.LocalPlayer

    local screenGui = Instance.new('ScreenGui')
    screenGui.Name = 'ShadowStealHelper'
    screenGui.Parent = CoreGui
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local toggleCircle = Instance.new('ImageButton')
    toggleCircle.Name = 'ToggleCircle'
    toggleCircle.Size = UDim2.new(0, 48, 0, 48)
    toggleCircle.Position = UDim2.new(0, 20, 0, 20)
    toggleCircle.Image = 'rbxassetid://96928078987243'
    toggleCircle.ImageColor3 = Color3.fromRGB(255, 255, 255)
    toggleCircle.BackgroundTransparency = 1 
    toggleCircle.Parent = screenGui
    toggleCircle.ZIndex = 10

    local toggleCorner = Instance.new('UICorner')
    toggleCorner.CornerRadius = UDim.new(1, 0)
    toggleCorner.Parent = toggleCircle

    local toggleAcrylic = Instance.new("Frame")
    toggleAcrylic.Parent = toggleCircle
    toggleAcrylic.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    toggleAcrylic.BackgroundTransparency = 0.35
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
    toggleNoise.ImageTransparency = 0.94
    toggleNoise.ScaleType = Enum.ScaleType.Tile
    toggleNoise.TileSize = UDim2.new(0, 48, 0, 48)
    toggleNoise.ZIndex = -1

    local toggleGradient = Instance.new('UIGradient')
    toggleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 35)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(18, 18, 25)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 12, 18))
    })
    toggleGradient.Rotation = 145
    toggleGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.55),
        NumberSequenceKeypoint.new(0.4, 0.72),
        NumberSequenceKeypoint.new(1, 0.85)
    })
    toggleGradient.Parent = toggleAcrylic 

    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Parent = toggleCircle
    toggleStroke.Color = Color3.fromRGB(60, 60, 75)
    toggleStroke.Thickness = 1
    toggleStroke.Transparency = 0.4

    local toggleInnerStroke = Instance.new("UIStroke")
    toggleInnerStroke.Parent = toggleAcrylic
    toggleInnerStroke.Color = Color3.fromRGB(255, 255, 255)
    toggleInnerStroke.Thickness = 0.8
    toggleInnerStroke.Transparency = 0.92

    local toggleShine = Instance.new("Frame")
    toggleShine.Parent = toggleCircle
    toggleShine.BackgroundTransparency = 1
    toggleShine.Size = UDim2.new(1, 0, 0.5, 0)
    toggleShine.ZIndex = -1 
    toggleShine.ClipsDescendants = true

    local toggleShineGrad = Instance.new("UIGradient")
    toggleShineGrad.Parent = toggleShine
    toggleShineGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    })
    toggleShineGrad.Rotation = 180
    toggleShineGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.92),
        NumberSequenceKeypoint.new(0.5, 0.98),
        NumberSequenceKeypoint.new(1, 1)
    })

    local toggleInnerGlow = Instance.new("Frame")
    toggleInnerGlow.Parent = toggleCircle
    toggleInnerGlow.BackgroundColor3 = Color3.fromRGB(80, 180, 255)
    toggleInnerGlow.BackgroundTransparency = 0.96
    toggleInnerGlow.Size = UDim2.new(1, 0, 1, 0)
    toggleInnerGlow.BorderSizePixel = 0
    toggleInnerGlow.ZIndex = -1 

    local toggleInnerGlowCorner = Instance.new("UICorner")
    toggleInnerGlowCorner.CornerRadius = UDim.new(1, 0)
    toggleInnerGlowCorner.Parent = toggleInnerGlow

    local mainFrame = Instance.new('Frame')
    mainFrame.Size = UDim2.new(0, 320, 0, 280)
    mainFrame.Position = UDim2.new(0.9, -160, 0, 300)
    mainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
    mainFrame.BackgroundTransparency = 0.15
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Visible = true
    mainFrame.ClipsDescendants = true

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 16)
    mainCorner.Parent = mainFrame

    local acrylicLayer = Instance.new("Frame")
    acrylicLayer.Parent = mainFrame
    acrylicLayer.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    acrylicLayer.BackgroundTransparency = 0.35
    acrylicLayer.Size = UDim2.new(1, 0, 1, 0)
    acrylicLayer.BorderSizePixel = 0
    acrylicLayer.ZIndex = 0

    local acrylicCorner = Instance.new("UICorner")
    acrylicCorner.CornerRadius = UDim.new(0, 16)
    acrylicCorner.Parent = acrylicLayer

    local noiseOverlay = Instance.new("ImageLabel")
    noiseOverlay.Parent = acrylicLayer
    noiseOverlay.BackgroundTransparency = 1
    noiseOverlay.Size = UDim2.new(1, 0, 1, 0)
    noiseOverlay.Image = "rbxassetid://8992230677"
    noiseOverlay.ImageColor3 = Color3.fromRGB(255, 255, 255)
    noiseOverlay.ImageTransparency = 0.94
    noiseOverlay.ScaleType = Enum.ScaleType.Tile
    noiseOverlay.TileSize = UDim2.new(0, 96, 0, 96)
    noiseOverlay.ZIndex = 1

    local glassShine = Instance.new("Frame")
    glassShine.Parent = mainFrame
    glassShine.BackgroundTransparency = 1
    glassShine.Size = UDim2.new(1, 0, 0.5, 0)
    glassShine.ZIndex = 1
    glassShine.ClipsDescendants = true

    local shineGrad = Instance.new("UIGradient")
    shineGrad.Parent = glassShine
    shineGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    })
    shineGrad.Rotation = 180
    shineGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.92),
        NumberSequenceKeypoint.new(0.5, 0.98),
        NumberSequenceKeypoint.new(1, 1)
    })

    local innerGlow = Instance.new("Frame")
    innerGlow.Parent = mainFrame
    innerGlow.BackgroundColor3 = Color3.fromRGB(80, 180, 255)
    innerGlow.BackgroundTransparency = 0.96
    innerGlow.Size = UDim2.new(1, 0, 1, 0)
    innerGlow.BorderSizePixel = 0
    innerGlow.ZIndex = 1

    local innerGlowCorner = Instance.new("UICorner")
    innerGlowCorner.CornerRadius = UDim.new(0, 16)
    innerGlowCorner.Parent = innerGlow

    local stroke = Instance.new("UIStroke")
    stroke.Parent = mainFrame
    stroke.Color = Color3.fromRGB(60, 60, 75)
    stroke.Thickness = 1
    stroke.Transparency = 0.4

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Parent = acrylicLayer
    innerStroke.Color = Color3.fromRGB(255, 255, 255)
    innerStroke.Thickness = 0.8
    innerStroke.Transparency = 0.92

    local mainGrad = Instance.new("UIGradient")
    mainGrad.Parent = mainFrame
    mainGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 28)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(12, 12, 18)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 8, 12))
    })
    mainGrad.Rotation = 145
    mainGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.55),
        NumberSequenceKeypoint.new(0.4, 0.72),
        NumberSequenceKeypoint.new(1, 0.85)
    })

    local header = Instance.new("Frame")
    header.Parent = mainFrame
    header.BackgroundTransparency = 1
    header.Size = UDim2.new(1, 0, 0, 40)
    header.ZIndex = 10

    local headerLine = Instance.new("Frame")
    headerLine.Parent = header
    headerLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    headerLine.BackgroundTransparency = 0.9
    headerLine.Position = UDim2.new(0, 16, 1, -1)
    headerLine.Size = UDim2.new(1, -32, 0, 1)
    headerLine.BorderSizePixel = 0
    headerLine.ZIndex = 10

    local titleContainer = Instance.new("Frame")
    titleContainer.Parent = header
    titleContainer.BackgroundTransparency = 1
    titleContainer.Position = UDim2.new(0, 16, 0, 0)
    titleContainer.Size = UDim2.new(1, -72, 1, 0)
    titleContainer.ZIndex = 10

    local title = Instance.new("TextLabel")
    title.Parent = titleContainer
    title.Text = "SYLLINSE"
    title.Font = Enum.Font.GothamBlack
    title.TextSize = 24
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 0.6, 0)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 10

    local titleGrad = Instance.new("UIGradient")
    titleGrad.Parent = title
    titleGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 200, 255))
    })

    local subtitle = Instance.new("TextLabel")
    subtitle.Parent = titleContainer
    subtitle.Text = "STEAL HELPER"
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextSize = 16
    subtitle.TextColor3 = Color3.fromRGB(120, 130, 160)
    subtitle.BackgroundTransparency = 1
    subtitle.Position = UDim2.new(0, 0, 0.5, 1)
    subtitle.Size = UDim2.new(1, 0, 0.4, -1)
    subtitle.TextXAlignment = Enum.TextXAlignment.Left
    subtitle.ZIndex = 10

    local controls = Instance.new('Frame')
    controls.Size = UDim2.new(0, 40, 1, 0)
    controls.Position = UDim2.new(1, -42, 0, 0)
    controls.BackgroundTransparency = 1
    controls.Parent = header
    controls.ZIndex = 10

    local minimizeBtn = Instance.new('TextButton')
    minimizeBtn.Size = UDim2.new(0, 18, 0, 18)
    minimizeBtn.Position = UDim2.new(0, 2, 0, 8)
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    minimizeBtn.BackgroundTransparency = 0.5
    minimizeBtn.BorderSizePixel = 0
    minimizeBtn.Text = '−'
    minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeBtn.Font = Enum.Font.GothamMedium
    minimizeBtn.TextSize = 20
    minimizeBtn.ZIndex = 10
    minimizeBtn.Parent = controls

    local minimizeBtnCorner = Instance.new("UICorner")
    minimizeBtnCorner.CornerRadius = UDim.new(0, 3)
    minimizeBtnCorner.Parent = minimizeBtn

    local minimizeBtnStroke = Instance.new("UIStroke")
    minimizeBtnStroke.Parent = minimizeBtn
    minimizeBtnStroke.Color = Color3.fromRGB(60, 60, 75)
    minimizeBtnStroke.Thickness = 0.8
    minimizeBtnStroke.Transparency = 0.5

    local closeBtn = Instance.new('TextButton')
    closeBtn.Size = UDim2.new(0, 18, 0, 18)
    closeBtn.Position = UDim2.new(0, 20, 0, 8)
    closeBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    closeBtn.BackgroundTransparency = 0.5
    closeBtn.BorderSizePixel = 0
    closeBtn.Text = '×'
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Font = Enum.Font.GothamMedium
    closeBtn.TextSize = 20
    closeBtn.ZIndex = 10
    closeBtn.Parent = controls

    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 3)
    closeBtnCorner.Parent = closeBtn

    local closeBtnStroke = Instance.new("UIStroke")
    closeBtnStroke.Parent = closeBtn
    closeBtnStroke.Color = Color3.fromRGB(60, 60, 75)
    closeBtnStroke.Thickness = 0.8
    closeBtnStroke.Transparency = 0.5

    local buttonStates = {}

    local tabsContainer = Instance.new("Frame")
    tabsContainer.Parent = mainFrame
    tabsContainer.BackgroundTransparency = 1
    tabsContainer.Size = UDim2.new(1, 0, 0, 32)
    tabsContainer.Position = UDim2.new(0, 0, 0, 40)
    tabsContainer.ZIndex = 10

    local tabsLayout = Instance.new("UIListLayout")
    tabsLayout.Parent = tabsContainer
    tabsLayout.FillDirection = Enum.FillDirection.Horizontal
    tabsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    tabsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    tabsLayout.Padding = UDim.new(0, 6)
    tabsLayout.SortOrder = Enum.SortOrder.LayoutOrder  

    local tabsPadding = Instance.new("UIPadding")
    tabsPadding.Parent = tabsContainer
    tabsPadding.PaddingLeft = UDim.new(0, 16) 
    tabsPadding.PaddingRight = UDim.new(0, 16)

    local tabContentsContainer = Instance.new("Frame")
    tabContentsContainer.Parent = mainFrame
    tabContentsContainer.BackgroundTransparency = 1
    tabContentsContainer.Size = UDim2.new(1, 0, 1, -72)
    tabContentsContainer.Position = UDim2.new(0, 0, 0, 72)
    tabContentsContainer.ZIndex = 10

    local allButtonFrames = {}
    local keybindButtons = {}
    local tabs = {}
    local currentTab = "Main"

    local function createTab(tabName)
        local tabButton = Instance.new('TextButton')
        tabButton.Name = tabName
        tabButton.Size = UDim2.new(0, 56, 0, 26)
        tabButton.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
        tabButton.BackgroundTransparency = 0.15
        tabButton.BorderSizePixel = 0
        tabButton.Text = tabName
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.TextTransparency = 0
        tabButton.Font = Enum.Font.GothamSemibold
        tabButton.TextSize = 12
        tabButton.ZIndex = 20
        tabButton.Parent = tabsContainer 
        
        
        local tabUnderline = Instance.new('Frame')
        tabUnderline.Name = "Underline"
        tabUnderline.Size = UDim2.new(0.6, 0, 0, 2)
        tabUnderline.Position = UDim2.new(0.2, 0, 1, -1)
        tabUnderline.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        tabUnderline.BackgroundTransparency = 0.7
        tabUnderline.BorderSizePixel = 0
        tabUnderline.Visible = false
        tabUnderline.ZIndex = 22
        tabUnderline.Parent = tabButton
        
        local tabAcrylic = Instance.new("Frame")
        tabAcrylic.Parent = tabButton
        tabAcrylic.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
        tabAcrylic.BackgroundTransparency = 0.5
        tabAcrylic.Size = UDim2.new(1, 0, 1, 0)
        tabAcrylic.BorderSizePixel = 0
        tabAcrylic.ZIndex = 10
        
        local tabCorner = Instance.new('UICorner')
        tabCorner.CornerRadius = UDim.new(0, 6)
        tabCorner.Parent = tabButton
        
        local acrylicCorner = Instance.new('UICorner')
        acrylicCorner.CornerRadius = UDim.new(0, 6)
        acrylicCorner.Parent = tabAcrylic
        
        local tabNoise = Instance.new("ImageLabel")
        tabNoise.Parent = tabAcrylic
        tabNoise.BackgroundTransparency = 1
        tabNoise.Size = UDim2.new(1, 0, 1, 0)
        tabNoise.Image = "rbxassetid://8992230677"
        tabNoise.ImageColor3 = Color3.fromRGB(255, 255, 255)
        tabNoise.ImageTransparency = 0.95
        tabNoise.ScaleType = Enum.ScaleType.Tile
        tabNoise.TileSize = UDim2.new(0, 48, 0, 48)
        tabNoise.ZIndex = 11
        
        local tabStroke = Instance.new('UIStroke')
        tabStroke.Parent = tabButton
        tabStroke.Color = Color3.fromRGB(80, 80, 100)
        tabStroke.Thickness = 1
        tabStroke.Transparency = 0.3
        
        local innerStroke = Instance.new('UIStroke')
        innerStroke.Parent = tabAcrylic
        innerStroke.Color = Color3.fromRGB(255, 255, 255)
        innerStroke.Thickness = 0.8
        innerStroke.Transparency = 0.9
        
        
        
        local tabContent = Instance.new('Frame')
        tabContent.Name = tabName .. "Content"
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.Position = UDim2.new(0, 0, 0, 0)
        tabContent.BackgroundTransparency = 1
        tabContent.Visible = false
        tabContent.Parent = tabContentsContainer
        
        local tabLayout = Instance.new("UIListLayout")
        tabLayout.Parent = tabContent
        tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
        tabLayout.Padding = UDim.new(0, 6)
        
        tabs[tabName] = {
            button = tabButton,
            content = tabContent,
            acrylic = tabAcrylic,
            stroke = tabStroke,
            underline = tabUnderline,
        }
        
        tabButton.MouseButton1Click:Connect(function()
            if currentTab == tabName then return end
            
            local oldTab = tabs[currentTab]
            if oldTab then
                oldTab.content.Visible = false
                TweenService:Create(oldTab.button, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(15, 15, 20)
                }):Play()
                TweenService:Create(oldTab.acrylic, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(25, 25, 35)
                }):Play()
                TweenService:Create(oldTab.stroke, TweenInfo.new(0.2), {
                    Color = Color3.fromRGB(60, 60, 75)
                }):Play()
                TweenService:Create(oldTab.button, TweenInfo.new(0.2), {
                    TextColor3 = Color3.fromRGB(200, 200, 220)
                }):Play()
                TweenService:Create(oldTab.underline, TweenInfo.new(0.2), {
                    BackgroundTransparency = 1,
                    Visible = false
                }):Play()
            end
            
            currentTab = tabName
            tabContent.Visible = true
            
            TweenService:Create(tabButton, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(20, 40, 60)
            }):Play()
            TweenService:Create(tabAcrylic, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(30, 60, 90)
            }):Play()
            TweenService:Create(tabStroke, TweenInfo.new(0.2), {
                Color = Color3.fromRGB(0, 150, 255)
            }):Play()
            TweenService:Create(tabButton, TweenInfo.new(0.2), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
            tabUnderline.Visible = true
            TweenService:Create(tabUnderline, TweenInfo.new(0.2), {
                BackgroundTransparency = 0.3
            }):Play()
        end)
        
        tabButton.MouseEnter:Connect(function()
            if currentTab ~= tabName then
                TweenService:Create(tabButton, TweenInfo.new(0.1), {
                    BackgroundColor3 = Color3.fromRGB(20, 20, 25)
                }):Play()
                TweenService:Create(tabAcrylic, TweenInfo.new(0.1), {
                    BackgroundColor3 = Color3.fromRGB(35, 35, 45)
                }):Play()
                TweenService:Create(tabStroke, TweenInfo.new(0.1), {
                    Color = Color3.fromRGB(80, 80, 100)
                }):Play()
                TweenService:Create(tabButton, TweenInfo.new(0.1), {
                    TextColor3 = Color3.fromRGB(240, 240, 255)
                }):Play()
                TweenService:Create(tabUnderline, TweenInfo.new(0.1), {
                    BackgroundTransparency = 0.5
                }):Play()
            end
        end)
        
        tabButton.MouseLeave:Connect(function()
            if currentTab ~= tabName then
                TweenService:Create(tabButton, TweenInfo.new(0.1), {
                    BackgroundColor3 = Color3.fromRGB(15, 15, 20)
                }):Play()
                TweenService:Create(tabAcrylic, TweenInfo.new(0.1), {
                    BackgroundColor3 = Color3.fromRGB(25, 25, 35)
                }):Play()
                TweenService:Create(tabStroke, TweenInfo.new(0.1), {
                    Color = Color3.fromRGB(60, 60, 75)
                }):Play()
                TweenService:Create(tabButton, TweenInfo.new(0.1), {
                    TextColor3 = Color3.fromRGB(200, 200, 220)
                }):Play()
                TweenService:Create(tabUnderline, TweenInfo.new(0.1), {
                    BackgroundTransparency = 1
                }):Play()
            end
        end)
        
        return tabContent
    end

    local mainTab = createTab("Main")
    tabs["Main"].content.Visible = true
    tabs["Main"].underline.Visible = true

    local OtherTab = createTab("Others")
    local visualTab = createTab("Visual")

    local buttonStates = {}
    local keybindButtons = {}

    local function saveSettings()
        if not writefile then
            return
        end

        local settingsData = {
            keybinds = {},
            toggles = {}
        }
        
        for buttonName, keybindInfo in pairs(keybindButtons) do
            settingsData.keybinds[buttonName] = keybindInfo.currentKey
            settingsData.toggles[buttonName] = buttonStates[buttonName]
        end

        pcall(function()
            writefile(
                'syllinse_settings.json',
                game:GetService('HttpService'):JSONEncode(settingsData)
            )
        end)
    end

    local function loadSettings()
        if not readfile or not isfile or not isfile('syllinse_settings.json') then
            return
        end

        pcall(function()
            local data = game:GetService('HttpService')
                :JSONDecode(readfile('syllinse_settings.json'))
            
            if data.keybinds then
                for buttonName, key in pairs(data.keybinds) do
                    if keybindButtons[buttonName] then
                        keybindButtons[buttonName].currentKey = key
                        keybindButtons[buttonName].button.Text = key
                    end
                end
            end
            
            if data.toggles then
                for buttonName, state in pairs(data.toggles) do
                    if keybindButtons[buttonName] and keybindButtons[buttonName].toggleSwitch then
                        buttonStates[buttonName] = state
                        
                        if state then
                            keybindButtons[buttonName].toggleSwitch.Position = UDim2.new(0.55, 0, 0.15, 0)
                            keybindButtons[buttonName].toggleSwitch.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
                            keybindButtons[buttonName].toggleFrame.BackgroundColor3 = Color3.fromRGB(20, 40, 60)
                            
                            if keybindButtons[buttonName].callback then
                                keybindButtons[buttonName].callback(true)
                            end
                        else
                            keybindButtons[buttonName].toggleSwitch.Position = UDim2.new(0.05, 0, 0.15, 0)
                            keybindButtons[buttonName].toggleSwitch.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
                            keybindButtons[buttonName].toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
                            
                            if keybindButtons[buttonName].callback then
                                keybindButtons[buttonName].callback(false)
                            end
                        end
                    end
                end
            end
        end)
    end

    local function updateKeybind(buttonName, newKey)
        if keybindButtons[buttonName] then
            keybindButtons[buttonName].currentKey = newKey
            keybindButtons[buttonName].button.Text = newKey
            saveSettings()
        end
    end

    local function createButton(parent, text, position, size, callback, defaultKey)
        local buttonContainer = Instance.new('Frame')
        buttonContainer.Size = UDim2.new(1, -10, 0, 24)
        buttonContainer.Position = UDim2.new(0.5, 0, position.Y.Scale, position.Y.Offset)
        buttonContainer.AnchorPoint = Vector2.new(0.5, 0)
        buttonContainer.BackgroundTransparency = 1
        buttonContainer.Parent = parent
        
        local textLabel = Instance.new('TextLabel')
        textLabel.Size = UDim2.new(0.50, 0, 0.9, 0)
        textLabel.Position = UDim2.new(0, 0, 0.05, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.Text = text
        textLabel.Font = Enum.Font.GothamSemibold
        textLabel.TextSize = 14
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Parent = buttonContainer
        
        local toggleFrame = Instance.new('ImageButton')
        toggleFrame.Size = UDim2.new(0.14   , 0, 0.8, 0)
        toggleFrame.Position = UDim2.new(0.6, 0, 0.100, 0)
        toggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        toggleFrame.BackgroundTransparency = 0.2
        toggleFrame.BorderSizePixel = 0
        toggleFrame.ImageTransparency = 1  
        toggleFrame.Parent = buttonContainer
        
        local toggleCorner = Instance.new('UICorner')
        toggleCorner.CornerRadius = UDim.new(1, 0)
        toggleCorner.Parent = toggleFrame
        
        local toggleSwitch = Instance.new('Frame')
        toggleSwitch.Size = UDim2.new(0.4, 0, 0.7, 0)
        toggleSwitch.Position = UDim2.new(0.05, 0, 0.15, 0)
        toggleSwitch.BackgroundColor3 = Color3.fromRGB(100, 100, 120)
        toggleSwitch.BackgroundTransparency = 0.3
        toggleSwitch.BorderSizePixel = 0
        toggleSwitch.Parent = toggleFrame
        
        local switchCorner = Instance.new('UICorner')
        switchCorner.CornerRadius = UDim.new(1, 0)
        switchCorner.Parent = toggleSwitch
        
        local keybindButton = Instance.new('TextButton')
        keybindButton.Size = UDim2.new(0.2, 0, 0.8, 0)
        keybindButton.Position = UDim2.new(0.75, 0, 0.1, 0)
        keybindButton.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
        keybindButton.BackgroundTransparency = 0.15
        keybindButton.BorderSizePixel = 0
        keybindButton.TextColor3 = Color3.fromRGB(220, 220, 220)
        keybindButton.Text = defaultKey or 'NONE'
        keybindButton.Font = Enum.Font.GothamMedium
        keybindButton.TextSize = 10
        keybindButton.Parent = buttonContainer
        
        local keybindCorner = Instance.new('UICorner')
        keybindCorner.CornerRadius = UDim.new(0, 4)
        keybindCorner.Parent = keybindButton
        
        local keybindStroke = Instance.new('UIStroke')
        keybindStroke.Parent = keybindButton
        keybindStroke.Color = Color3.fromRGB(60, 60, 75)
        keybindStroke.Thickness = 1
        keybindStroke.Transparency = 0.3
        
        buttonStates[text] = false
        keybindButtons[text] = {
            button = keybindButton,
            currentKey = defaultKey or 'NONE',
            callback = callback,
            toggleSwitch = toggleSwitch,
            toggleFrame = toggleFrame
        }
        
        local listening = false
        keybindButton.MouseButton1Click:Connect(function()
            listening = true
            keybindButton.Text = '...'
            keybindButton.TextColor3 = Color3.fromRGB(100, 200, 255)

            local connection
            connection = UserInputService.InputBegan:Connect(
                function(input, gameProcessed)
                    if gameProcessed then
                        return
                    end

                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        local key = input.KeyCode.Name
                        updateKeybind(text, key)
                        keybindButtons[text].currentKey = key
                        keybindButton.Text = key
                        listening = false
                        keybindButton.TextColor3 = Color3.fromRGB(220, 220, 220)
                        connection:Disconnect()
                    end
                end
            )
        end)
        
        toggleFrame.MouseButton1Click:Connect(function()
            buttonStates[text] = not buttonStates[text]
            
            if buttonStates[text] then
                TweenService:Create(toggleSwitch, TweenInfo.new(0.2), {
                    Position = UDim2.new(0.55, 0, 0.15, 0),
                    BackgroundColor3 = Color3.fromRGB(0, 150, 255)
                }):Play()
                TweenService:Create(toggleFrame, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(20, 40, 60)
                }):Play()
            else
                TweenService:Create(toggleSwitch, TweenInfo.new(0.2), {
                    Position = UDim2.new(0.05, 0, 0.15, 0),
                    BackgroundColor3 = Color3.fromRGB(100, 100, 120)
                }):Play()
                TweenService:Create(toggleFrame, TweenInfo.new(0.2), {
                    BackgroundColor3 = Color3.fromRGB(30, 30, 40)
                }):Play()
            end
            
            saveSettings()
            
            if callback then
                callback(buttonStates[text])
            end
        end)
        
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then
                return
            end

            if input.UserInputType == Enum.UserInputType.Keyboard then
                local pressedKey = input.KeyCode.Name
                if
                    keybindButtons[text]
                    and keybindButtons[text].currentKey == pressedKey
                then
                    buttonStates[text] = not buttonStates[text]
                    
                    if buttonStates[text] then
                        TweenService:Create(toggleSwitch, TweenInfo.new(0.2), {
                            Position = UDim2.new(0.55, 0, 0.15, 0),
                            BackgroundColor3 = Color3.fromRGB(0, 150, 255)
                        }):Play()
                        TweenService:Create(toggleFrame, TweenInfo.new(0.2), {
                            BackgroundColor3 = Color3.fromRGB(20, 40, 60)
                        }):Play()
                    else
                        TweenService:Create(toggleSwitch, TweenInfo.new(0.2), {
                            Position = UDim2.new(0.05, 0, 0.15, 0),
                            BackgroundColor3 = Color3.fromRGB(100, 100, 120)
                        }):Play()
                        TweenService:Create(toggleFrame, TweenInfo.new(0.2), {
                            BackgroundColor3 = Color3.fromRGB(30, 30, 40)
                        }):Play()
                    end
                    
                    saveSettings()
                    
                    if callback then
                        callback(buttonStates[text])
                    end
                end
            end
        end)

        table.insert(allButtonFrames, buttonContainer)
        return buttonContainer
    end

    local isMinimized = false
    local originalSize = mainFrame.Size
    local minimizedSize = UDim2.new(0, 320, 0, 40)

    local function toggleMinimize()
        isMinimized = not isMinimized

        if isMinimized then
            for _, buttonFrame in ipairs(allButtonFrames) do
                buttonFrame.Visible = false
            end
            tabContentsContainer.Visible = false
            tabsContainer.Visible = false
            acrylicLayer.Visible = false
            glassShine.Visible = false
            innerGlow.Visible = false
            
            TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { 
                Size = minimizedSize 
            }):Play()
            minimizeBtn.Text = '+'
        else
            for _, buttonFrame in ipairs(allButtonFrames) do
                buttonFrame.Visible = true
            end

            tabContentsContainer.Visible = true
            tabsContainer.Visible = true
            acrylicLayer.Visible = true
            glassShine.Visible = true
            innerGlow.Visible = true
            
            TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { 
                Size = originalSize 
            }):Play()
            minimizeBtn.Text = '−'
        end
    end

    minimizeBtn.MouseButton1Click:Connect(toggleMinimize)

    local function setupControlButton(button, hoverColor)
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.1), { 
                BackgroundColor3 = hoverColor 
            }):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.1), { 
                BackgroundColor3 = Color3.fromRGB(25, 25, 35) 
            }):Play()
        end)
    end

    setupControlButton(minimizeBtn, Color3.fromRGB(60, 60, 80))
    setupControlButton(closeBtn, Color3.fromRGB(200, 60, 60))

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

    if UserInputService.TouchEnabled then
        mainFrame.Size = UDim2.new(0, 340, 0, 300)
        originalSize = mainFrame.Size
        minimizedSize = UDim2.new(0, 340, 0, 40)

        for _, buttonFrame in ipairs(allButtonFrames) do
            local textButton = buttonFrame:FindFirstChildOfClass('TextButton')
            if textButton and textButton.TextSize then
                textButton.TextSize = textButton.TextSize + 1
            end
        end
    end

    local menuVisible = false

    local function toggleMenu()
        menuVisible = not menuVisible

        if menuVisible then
            mainFrame.Visible = true

            TweenService:Create(mainFrame, TweenInfo.new(0.3), {
                Position = UDim2.new(0.9, -160, 0, 300),
                Size = originalSize,
                BackgroundTransparency = 0.15
            }):Play()
            
            TweenService:Create(acrylicLayer, TweenInfo.new(0.3), {
                BackgroundTransparency = 0.35
            }):Play()
            
            TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(0, 120, 220),
            }):Play()
        else
            TweenService:Create(mainFrame, TweenInfo.new(0.3), {
                Position = UDim2.new(0.9, -160, 0, 150),
                Size = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1
            }):Play()
            
            TweenService:Create(acrylicLayer, TweenInfo.new(0.3), {
                BackgroundTransparency = 1
            }):Play()
            
            TweenService:Create(toggleCircle, TweenInfo.new(0.3), {
                BackgroundColor3 = Color3.fromRGB(12, 12, 18),
            }):Play()

            wait(0.3)
            mainFrame.Visible = false
        end
    end

    toggleCircle.MouseButton1Click:Connect(toggleMenu)

    toggleCircle.MouseEnter:Connect(function()
        TweenService:Create(toggleCircle, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(20, 20, 30),
            Size = UDim2.new(0, 52, 0, 52),
        }):Play()
    end)

    toggleCircle.MouseLeave:Connect(function()
        TweenService:Create(toggleCircle, TweenInfo.new(0.2), {
            BackgroundColor3 = menuVisible and Color3.fromRGB(0, 120, 220)
                or Color3.fromRGB(12, 12, 18),
            Size = UDim2.new(0, 48, 0, 48),
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

    loadSettings()

    local module = {}
    module.CreateButton = createButton
    module.MainTab = mainTab
    module.OtherTab = OtherTab
    module.VisualTab = visualTab
    module.LoadSettings = loadSettings
    module.SaveSettings = saveSettings
    module.ToggleMenu = toggleMenu
    module.ToggleMinimize = toggleMinimize

    return module
end

return Syllinse
