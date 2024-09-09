--Instances:
local G2L = {}

G2L["0"] = Instance.new("ScreenGui")
G2L["1"] = Instance.new("Frame")
G2L["2"] = Instance.new("TextLabel")
G2L["3"] = Instance.new("Frame")
G2L["4"] = Instance.new("UIListLayout")
G2L["5"] = Instance.new("TextLabel")
G2L["6"] = Instance.new("UITextSizeConstraint")
G2L["7"] = Instance.new("TextLabel")
G2L["8"] = Instance.new("UITextSizeConstraint")
G2L["9"] = Instance.new("TextLabel")
G2L["10"] = Instance.new("UITextSizeConstraint")
G2L["11"] = Instance.new("TextLabel")
G2L["12"] = Instance.new("UITextSizeConstraint")
G2L["15"] = Instance.new("UIAspectRatioConstraint")



--Propeties:
G2L["0"].Name = [[InventoryViewerUI]]
G2L["0"].Enabled = true
G2L["0"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
G2L["0"].Parent = game.Players.LocalPlayer.PlayerGui

G2L["1"].Name = [[Main]]
G2L["1"].Active = false
G2L["1"].ResetOnSpawn = false
G2L["1"].AnchorPoint = Vector2.new(0, 0)
G2L["1"].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
G2L["1"].BackgroundTransparency = 0
G2L["1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["1"].BorderSizePixel = 0
G2L["1"].ClipsDescendants = false
G2L["1"].Draggable = false
G2L["1"].Position = UDim2.new(0.6302621, 0, 0.04693611, 0)
G2L["1"].Rotation = 0
G2L["1"].Selectable = false
G2L["1"].SelectionOrder = 0
G2L["1"].Size = UDim2.new(0.3435898, 0, 0.3138021, 0)
G2L["1"].Visible = true
G2L["1"].ZIndex = 1
G2L["1"].Parent = G2L["0"]

G2L["2"].Name = [[PlayerName]]
G2L["2"].FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["2"].Text = [[ThisGuys51255555'555555555555 Inventory]]
G2L["2"].TextColor3 = Color3.fromRGB(255, 255, 255)
G2L["2"].TextScaled = true
G2L["2"].TextSize = 35
G2L["2"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
G2L["2"].TextStrokeTransparency = 1
G2L["2"].TextWrapped = true
G2L["2"].TextXAlignment = Enum.TextXAlignment.Left
G2L["2"].TextYAlignment = Enum.TextYAlignment.Center
G2L["2"].Active = false
G2L["2"].AnchorPoint = Vector2.new(0, 0)
G2L["2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
G2L["2"].BackgroundTransparency = 1
G2L["2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["2"].BorderSizePixel = 0
G2L["2"].ClipsDescendants = false
G2L["2"].Draggable = false
G2L["2"].Position = UDim2.new(0.01308885, 0, 0, 0)
G2L["2"].Rotation = 0
G2L["2"].Selectable = false
G2L["2"].SelectionOrder = 0
G2L["2"].Size = UDim2.new(0.9658849, 0, 0.1452282, 0)
G2L["2"].Visible = true
G2L["2"].ZIndex = 1
G2L["2"].Parent = G2L["1"]

G2L["3"].Name = [[Lists]]
G2L["3"].Active = false
G2L["3"].AnchorPoint = Vector2.new(0, 0)
G2L["3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
G2L["3"].BackgroundTransparency = 1
G2L["3"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["3"].BorderSizePixel = 0
G2L["3"].ClipsDescendants = false
G2L["3"].Draggable = false
G2L["3"].Position = UDim2.new(0.02840256, 0, 0.1784232, 0)
G2L["3"].Rotation = 0
G2L["3"].Selectable = false
G2L["3"].SelectionOrder = 0
G2L["3"].Size = UDim2.new(0.9488273, 0, 0.7883818, 0)
G2L["3"].Visible = true
G2L["3"].ZIndex = 1
G2L["3"].Parent = G2L["1"]

G2L["4"].Name = [[UIListLayout]]
G2L["4"].Parent = G2L["3"]

G2L["5"].Name = [[Slot1]]
G2L["5"].FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["5"].Text = [[1 ->]]
G2L["5"].TextColor3 = Color3.fromRGB(255, 0, 208)
G2L["5"].TextScaled = true
G2L["5"].TextSize = 14
G2L["5"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
G2L["5"].TextStrokeTransparency = 1
G2L["5"].TextWrapped = true
G2L["5"].TextXAlignment = Enum.TextXAlignment.Left
G2L["5"].TextYAlignment = Enum.TextYAlignment.Center
G2L["5"].Active = false
G2L["5"].AnchorPoint = Vector2.new(0, 0)
G2L["5"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
G2L["5"].BackgroundTransparency = 1
G2L["5"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["5"].BorderSizePixel = 0
G2L["5"].ClipsDescendants = false
G2L["5"].Draggable = false
G2L["5"].Position = UDim2.new(0, 0, 0, 0)
G2L["5"].Rotation = 0
G2L["5"].Selectable = false
G2L["5"].SelectionOrder = 0
G2L["5"].Size = UDim2.new(1, 0, 0.15, 0)
G2L["5"].Visible = true
G2L["5"].ZIndex = 1
G2L["5"].Parent = G2L["3"]

G2L["6"].Name = [[UITextSizeConstraint]]
G2L["6"].MaxTextSize = 28
G2L["6"].Parent = G2L["5"]

G2L["7"].Name = [[Slot2]]
G2L["7"].FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["7"].Text = [[1 ->]]
G2L["7"].TextColor3 = Color3.fromRGB(255, 0, 208)
G2L["7"].TextScaled = true
G2L["7"].TextSize = 14
G2L["7"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
G2L["7"].TextStrokeTransparency = 1
G2L["7"].TextWrapped = true
G2L["7"].TextXAlignment = Enum.TextXAlignment.Left
G2L["7"].TextYAlignment = Enum.TextYAlignment.Center
G2L["7"].Active = false
G2L["7"].AnchorPoint = Vector2.new(0, 0)
G2L["7"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
G2L["7"].BackgroundTransparency = 1
G2L["7"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["7"].BorderSizePixel = 0
G2L["7"].ClipsDescendants = false
G2L["7"].Draggable = false
G2L["7"].Position = UDim2.new(0, 0, 0, 0)
G2L["7"].Rotation = 0
G2L["7"].Selectable = false
G2L["7"].SelectionOrder = 0
G2L["7"].Size = UDim2.new(1, 0, 0.15, 0)
G2L["7"].Visible = true
G2L["7"].ZIndex = 1
G2L["7"].Parent = G2L["3"]

G2L["8"].Name = [[UITextSizeConstraint]]
G2L["8"].MaxTextSize = 28
G2L["8"].Parent = G2L["7"]

G2L["9"].Name = [[Slot3]]
G2L["9"].FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["9"].Text = [[1 ->]]
G2L["9"].TextColor3 = Color3.fromRGB(255, 0, 208)
G2L["9"].TextScaled = true
G2L["9"].TextSize = 14
G2L["9"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
G2L["9"].TextStrokeTransparency = 1
G2L["9"].TextWrapped = true
G2L["9"].TextXAlignment = Enum.TextXAlignment.Left
G2L["9"].TextYAlignment = Enum.TextYAlignment.Center
G2L["9"].Active = false
G2L["9"].AnchorPoint = Vector2.new(0, 0)
G2L["9"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
G2L["9"].BackgroundTransparency = 1
G2L["9"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["9"].BorderSizePixel = 0
G2L["9"].ClipsDescendants = false
G2L["9"].Draggable = false
G2L["9"].Position = UDim2.new(0, 0, 0, 0)
G2L["9"].Rotation = 0
G2L["9"].Selectable = false
G2L["9"].SelectionOrder = 0
G2L["9"].Size = UDim2.new(1, 0, 0.15, 0)
G2L["9"].Visible = true
G2L["9"].ZIndex = 1
G2L["9"].Parent = G2L["3"]

G2L["10"].Name = [[UITextSizeConstraint]]
G2L["10"].MaxTextSize = 28
G2L["10"].Parent = G2L["9"]

G2L["11"].Name = [[Slot4]]
G2L["11"].FontFace = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
G2L["11"].Text = [[1 ->]]
G2L["11"].TextColor3 = Color3.fromRGB(255, 0, 208)
G2L["11"].TextScaled = true
G2L["11"].TextSize = 14
G2L["11"].TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
G2L["11"].TextStrokeTransparency = 1
G2L["11"].TextWrapped = true
G2L["11"].TextXAlignment = Enum.TextXAlignment.Left
G2L["11"].TextYAlignment = Enum.TextYAlignment.Center
G2L["11"].Active = false
G2L["11"].AnchorPoint = Vector2.new(0, 0)
G2L["11"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
G2L["11"].BackgroundTransparency = 1
G2L["11"].BorderColor3 = Color3.fromRGB(0, 0, 0)
G2L["11"].BorderSizePixel = 0
G2L["11"].ClipsDescendants = false
G2L["11"].Draggable = false
G2L["11"].Position = UDim2.new(0, 0, 0, 0)
G2L["11"].Rotation = 0
G2L["11"].Selectable = false
G2L["11"].SelectionOrder = 0
G2L["11"].Size = UDim2.new(1, 0, 0.15, 0)
G2L["11"].Visible = true
G2L["11"].ZIndex = 1
G2L["11"].Parent = G2L["3"]

G2L["12"].Name = [[UITextSizeConstraint]]
G2L["12"].MaxTextSize = 28
G2L["12"].Parent = G2L["11"]

G2L["15"].Name = [[UIAspectRatioConstraint]]
G2L["15"].AspectRatio = 1.777344
G2L["15"].Parent = G2L["0"]

--Scripte
 return G2L["0"]
