local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'aftermath sex hack (made by AlrightyBrickmane / Pentel)',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})
-- Services
local replicated_storage = cloneref(game:GetService('ReplicatedStorage'))
local run_service = cloneref(game:GetService('RunService'))
local Players = cloneref(game:GetService('Players'))
local Lighting = cloneref(game:GetService('Lighting'))
local UserInputService = cloneref(game:GetService('UserInputService'))

-- Defined
local Camera = workspace.CurrentCamera

local storage_assets = replicated_storage:WaitForChild('Assets')
local attachments = storage_assets:WaitForChild('Attachments')
local gun_data = replicated_storage:WaitForChild('GunData')

local game_assets = workspace:WaitForChild('game_assets')
local item_spawns = game_assets:WaitForChild('item_spawns')

-- Original Values
local workspace_gravity = workspace.Gravity

-- Tables
local Tabs = {
    AimbotTab = Window:AddTab('Aimbot'),
    VisualsTab = Window:AddTab('Visuals'),
    MiscTab = Window:AddTab('Misc'),
    Settings = Window:AddTab('Settings'),
}

local Sections = {
    -- Aimbot Tab
    Aimbot = Tabs.AimbotTab:AddLeftGroupbox('Aimbot'),
    AimbotSettings = Tabs.AimbotTab:AddRightGroupbox('Aimbot Settings'),

    -- Visuals Tab
    Visuals = Tabs.VisualsTab:AddLeftGroupbox('Visuals'),
    VisualSettings = Tabs.VisualsTab:AddRightGroupbox('Configuration'),
    ItemVisuals = Tabs.VisualsTab:AddLeftGroupbox('Item Visual'),
    ItemVisualSettings = Tabs.VisualsTab:AddRightGroupbox('Item Configuration'),
    Lighting = Tabs.VisualsTab:AddLeftGroupbox('Lighting'),

    -- Misc Tab
    Player = Tabs.MiscTab:AddLeftGroupbox('Player')
}

local FeatureTable = {
    Combat = {
        Aimbot = {Enabled = false, DummyRange = 0, DynamicFOV = false, Prediction = false, PredictionValue = 0},
        Hitpart = "Head",
    },
    Visuals = {

        -- Features --

        Chams = {Enabled = false, FillColor = Color3.fromRGB(255,255,255), OutlineColor = Color3.fromRGB(255,255,255), VisibleOnly = false, FillTransaprency = 0, OutlineTransparency = 0},
        Dynamic = true,

        -- Item Esp --

        ItemsEsp = {Enabled = false,
            GunColor = {Color = Color3.fromRGB(151, 48, 250)},
            WeaponColor = {Color = Color3.fromRGB(83, 186, 30)},
            AttachmentsColor = {Color = Color3.fromRGB(255, 166, 0)},
            DefaultColor = {Color = Color3.fromRGB(255,255,255)},
        },

        -- Other --
        
        Lighting = {
            OverrideAmbient = {Enabled = false, Color = Color3.fromRGB(255,255,255)},
            NoShadows = false,
            NoFog = false,
        },
    },
    Misc = {
        Player = {
            Gravity = {Enabled = false, Value = workspace_gravity},
            HitboxExpand = {Enabled = false, Size = 2.5},
        },
    },
}

local Storage = {
    Other = {
        ViewportSize = Camera.ViewportSize,
        ClosestPlayer,
    },
}

local Functions = {
    Normal = {},
    ItemESP = {},
}

-- Objects
local FOV_CIRCLE = Drawing.new('Circle')
do -- Drawing Object Properties

    do -- Circle

        FOV_CIRCLE.Transparency = 1
        FOV_CIRCLE.Visible = false
        FOV_CIRCLE.Color = Color3.fromRGB(255, 255, 255)
        FOV_CIRCLE.Radius = 0

    end

end
-- Rest


do -- Main
    Library:Notify('This script is made by Brickmane (mando_mercury) and xytz_l (yuiz_)')
    Library:Notify('Aimbot and Player is still not implemented so enjoy with item esp and hitbox expander')
    do -- Elements
        do -- Aimbot Tab
            Sections.Aimbot:AddToggle('Aimbot', {
                Text = 'Aimbot',
                Default = false,
                Tooltip = 'Lock on to players',
                
                Callback = function(Value)
                    FeatureTable.Combat.Aimbot.Enabled = false
                end
            })
            
            Sections.Aimbot:AddToggle('VisualiseRange', {
                Text = 'Visualise Range',
                Default = false,
                
                Callback = function(Value)
                    FOV_CIRCLE.Color = Value
                end
            }):AddColorPicker('VisualiseRange', {
                Default = Color3.fromRGB(255, 255, 255),
                Title = 'Range Color',
                Transparency = 0,

                Callback = function(Value)
                    FOV_CIRCLE.Color = Value
                end
            })

            Sections.Aimbot:AddToggle('DynamicRange', {
                Text = 'Dynamic Range',
                Default = false,
                Tooltip = "Scale with in Camera's Field Of View",

                Callback = function(Value)
                    FeatureTable.Combat.Aimbot.DynamicFOV = Value
                end
            })

            Sections.Aimbot:AddSlider('AimbotRange', {
                Text = 'Range',
                Default = 0,
                Min = 0,
                Max = 1000,
                Rounding = 1,

                Callback = function(Value)
                    FeatureTable.Combat.Aimbot.DummyRange = Value
                end
            })

            Sections.Aimbot:AddDropdown('Aimpart', {
                Values = { 'Head', 'UpperTorso' },
                Default = 1,
                Multi = false,

                Text = 'Aim part',

                Callback = function(Value)
                    FeatureTable.Combat.HitPart = Value
                end
            })

            -- Aimbot Settings

            Sections.AimbotSettings:AddToggle('Prediction', {
                Text = 'Prediction',
                Default = false,

                Callback = function(Value)
                    FeatureTable.Combat.Aimbot.Prediction = Value
                end
            })

            Sections.AimbotSettings:AddSlider('Prediction Value', {
                Text = 'Prediction Value',
                Default = 0,
                Min = 0,
                Max = 10,
                Rounding = 1,

                Callback = function(Value)
                    FeatureTable.Combat.Aimbot.PredictionValue = Value
                end
            })
        end

        do -- Visuals Tab
            Sections.Visuals:AddToggle('Chams', {
                Text = 'Chams',
                Default = false,

                Callback = function(Value)
                    FeatureTable.Visuals.Chams.Enabled = Value
                end
            }):AddColorPicker('FillColor', {
                Default = Color3.fromRGB(255, 255, 255),
                Title = 'Fill Color',
                Transparency = 0,
            
                Callback = function(Value)
                    FeatureTable.Visuals.Chams.FillColor = Value
                end
            }):AddColorPicker('OutlineColor', {
                Default = Color3.fromRGB(255, 255, 255),
                Title = 'Outline Color',
                Transparency = 0,
            
                Callback = function(Value)
                    FeatureTable.Visuals.Chams.OutlineColor = Value
                end
            })

            -- Settings

            Sections.VisualSettings:AddToggle('ChamVisOnly', {
                Text = 'Chams Opaque or Visible Only',
                Default = false,

                Callback = function(Value)
                    FeatureTable.Visuals.Chams.VisibleOnly = Value
                end
            })

            Sections.VisualSettings:AddSlider('ChamFillTransparency', {
                Text = 'Chams Fill Transparency',
                Default = 0,
                Min = 0,
                Max = 1,
                Rounding = 1,
                Compact = false,

                Callback = function(Value)
                    FeatureTable.Visuals.Chams.FillTransparency = Value
                end
            })

            Sections.VisualSettings:AddSlider('ChamOutlineTransparency', {
                Text = 'Chams Outline Transparency',
                Default = 0,
                Min = 0,
                Max = 1,
                Rounding = 1,
                Compact = false,

                Callback = function(Value)
                    FeatureTable.Visuals.Chams.OutlineTransparency = Value
                end
            })

            -- Item Esp Section

            Sections.ItemVisuals:AddToggle('ItemVisual', {
                Text = 'Item Visuals',
                Default = false,

                Callback = function(Value)
                    FeatureTable.Visuals.ItemsEsp.Enabled = Value
                end
            }):AddColorPicker('GunEspColor', {
                Default = Color3.fromRGB(151, 48, 250),
                Title = 'Gun Esp Color',
                Transparency = 0,

                Callback = function(Value)
                    if FeatureTable.Visuals.ItemsEsp.Enabled then
                        FeatureTable.Visuals.ItemsEsp.GunColor.Color = Value
                    end
                end
            }):AddColorPicker('WeaponEspColor', {
                Default = Color3.fromRGB(83, 186, 30),
                Title = 'Weapon Esp Color',
                Transparency = 0,

                Callback = function(Value)
                    if FeatureTable.Visuals.ItemsEsp.Enabled then
                        FeatureTable.Visuals.ItemsEsp.WeaponColor.Color = Value
                    end
                end
            }):AddColorPicker('AttachmentEspColor', {
                Default = Color3.fromRGB(255, 166, 0),
                Title = 'Attachment Esp Color',
                Transparency = 0,

                Callback = function(Value)
                    if FeatureTable.Visuals.ItemsEsp.Enabled then
                        FeatureTable.Visuals.ItemsEsp.AttachmentsColor.Color = Value
                    end
                end
            }):AddColorPicker('DefaultItemEspColor', {
                Default = Color3.fromRGB(255, 255, 255),
                Title = 'Defualt Item Esp Color',
                Transparency = 0,

                Callback = function(Value)
                    if FeatureTable.Visuals.ItemsEsp.Enabled then
                        FeatureTable.Visuals.ItemsEsp.DefaultColor.Color = Value
                    end
                end
            })

            -- Lighting Section

            Sections.Lighting:AddToggle('OverrideAmbient', {
                Text = 'Override Ambient',
                Default = false,
            
                Callback = function(Value)
                    FeatureTable.Visuals.Lighting.OverrideAmbient.Enabled = Value
                end
            }):AddColorPicker('AmbientColor', {
                Default = Color3.fromRGB(255, 255, 255),
                Title = 'Ambient Color',
                Transparency = 0,
            
                Callback = function(Value)
                    if FeatureTable.Visuals.Lighting.OverrideAmbient.Enabled then
                        FeatureTable.Visuals.Lighting.OverrideAmbient.Color = Value
    
                        do --// Properties
                            
                            Functions.Normal:SetAmbient("Ambient", Value)
                            Functions.Normal:SetAmbient("OutdoorAmbient", Value)
                            Functions.Normal:SetAmbient("ColorShift_Top", Value)
                            Functions.Normal:SetAmbient("ColorShift_Bottom", Value)
                            
                        end
                    end
                end
            })
        end

        do -- Misc Tab
            Sections.Player:AddToggle('HitboxExpand', {
                Text = 'Hitbox Expand',
                Default = false,

                Callback = function(Value)
                    FeatureTable.Misc.HitboxExpand.Enabled = Value
                end
            })

            Sections.Player:AddSlider('HitboxSize', {
                Text = 'HitboxSize',
                Default = 1,
                Min = 0,
                Max = 3,
                Rounding = 1,
                Compact = false,

                Callback = function(Value)
                    FeatureTable.Misc.HitboxExpand.Size = Value
                end
            })
        end
    end

    do -- Logic

        do -- Functions

            do -- Regular

                do -- Lighting
                    function Functions.Normal:SetAmbient(Property, Value)
                        if FeatureTable.Visuals.Lighting.OverrideAmbient.Enabled then
                            Lighting[Property] = Value
                        end
                    end
                end

                do -- Player
                    function Functions.Normal:GetPlayerModel(Player)
                        local WorldCharacter
                        if Player.Character ~= nil then
                            WorldCharacter = Player.Character.WorldCharacter
                        end
                        return WorldCharacter
                    end

                    function Functions.Normal:GetPlayerHeadCollider(Player)
                        local HeadCollider
                        if Player.Character ~= nil and Player.Character:FindFirstChild('ServerColliderHead') then
                            HeadCollider = Player.Character:FindFirstChild('ServerColliderHead')
                        end
                        return HeadCollider
                    end

                    -- do not ask me why i am doing this, its just to make it look like im smart
                    -- This automatically just gets the players character
                    function Functions.Normal:GetPlayersCharacter()
                        local PlayerList = {}
                        for i,player in Players:GetPlayers() do
                            if player.Character then
                                table.insert(PlayerList, player.Character)
                            end
                        end
                        return PlayerList
                    end
                end

                do -- Math
                    function Functions.Normal:Measure(Origin, End)
                        return (Origin - End).Magnitude
                    end
                end

                do -- Item ESP
                    function Functions.ItemESP:AddInstance(object, data, type)
                        local text = Drawing.new('Text')
                        local Type = type
                    
                        text.Font = 2
                    
                        for index, value in data do
                            text[index] = value
                        end
                    
                        local connections = {}
                        table.insert(connections, run_service.RenderStepped:Connect(function()
                            local vec3, onscreen = Camera:WorldToViewportPoint(object:GetPivot().Position)
                            if onscreen and FeatureTable.Visuals.ItemsEsp.Enabled then
                                text.Visible = true 
                                text.Position = Vector2.new(vec3.X, vec3.Y)
                    
                                if Type == 'Gun' then
                                    text.Color = FeatureTable.Visuals.ItemsEsp.GunColor.Color
                                elseif Type == 'Weapon' then
                                    text.Color = FeatureTable.Visuals.ItemsEsp.WeaponColor.Color
                                elseif Type == 'Attachment' then
                                    text.Color = FeatureTable.Visuals.ItemsEsp.AttachmentsColor.Color
                                elseif Type == 'Default' then
                                    text.Color = FeatureTable.Visuals.ItemsEsp.DefaultColor.Color
                                end
                    
                            else
                                text.Visible = false 
                            end
                        end))
                        table.insert(connections, object.Destroying:Connect(function()
                            text:Remove()
                            for _, connection in connections do
                                connection:Disconnect()
                            end
                        end))
                    end

                    function Functions.ItemESP:ApplyESP(item)
						if not item then return end
                        if not item:IsA('Model') then return end 
                        
                        local name, z_index, type, color = item.Name, 0, 'Default', FeatureTable.Visuals.ItemsEsp.DefaultColor.Color
                        if item.Name == 'WorldModel' and item:FindFirstChild('Static') then
                            local highest_score, gun_name = 0, nil
                            local item_static = item:FindFirstChild('Static')
                            for _, gun in gun_data:GetChildren() do
                                local gun_score = 0
                                local world_model = gun:FindFirstChild('WorldModel') -- fists doesnt have world model
                            
                                if world_model then
                                    local gun_static = world_model:FindFirstChild('Static') -- weapons doesnt have static
                                    if gun_static then
                                        for _, gun_static_child in gun_static:GetChildren() do
                                            if item_static:FindFirstChild(gun_static_child.Name) then
                                                gun_score += 1
                                                if gun_score > highest_score then
                                                    highest_score = gun_score
                                                    gun_name = (gun:FindFirstChild('DisplayName') and gun.DisplayName.Value) or gun.Name 
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            z_index = 2
                            color = FeatureTable.Visuals.ItemsEsp.GunColor.Color
                            name = gun_name or 'Gun'
                            type = 'Gun'
                        end
                        if item.Name == 'WorldModel' and (not item:FindFirstChild('Static')) then
                            local highest_score, weapon_name = 0, nil
                            for _, weapon in gun_data:GetChildren() do
                                local weapon_score = 0
                                local world_model = weapon:FindFirstChild('WorldModel') -- fists doesnt have world model
                            
                                if world_model then
                                    for _, weapon_child in world_model:GetChildren() do
                                        if item:FindFirstChild(weapon_child.Name) then
                                            weapon_score += 1
                                            if weapon_score > highest_score then
                                                highest_score = weapon_score
                                                weapon_name = (weapon:FindFirstChild('DisplayName') and weapon.DisplayName.Value) or weapon.Name 
                                            end
                                        end
                                    end
                                end
                            end
                            z_index = 1
                            name = weapon_name or 'Weapon'
                            color = FeatureTable.Visuals.ItemsEsp.WeaponColor.Color
                            type = 'Weapon'
                        end
                        if item.Name == 'WorldData' then
                            local highest_score, attachment_name = 0, nil
                            for _, attachment in attachments:GetChildren() do
                                local attachment_score = 0
                                local world_data = attachment:FindFirstChild('WorldData') -- fists doesnt have world model
                            
                                if world_data then
                                    for _, weapon_child in world_data:GetChildren() do
                                        if item:FindFirstChild(weapon_child.Name) then
                                            attachment_score += 1
                                            if attachment_score > highest_score then
                                                highest_score = attachment_score
                                                attachment_name = (attachment:FindFirstChild('DisplayName') and attachment.DisplayName.Value) or attachment.Name 
                                            end
                                        end
                                    end
                                end
                            end
                            name = attachment_name or 'Attachment'
                            color = FeatureTable.Visuals.ItemsEsp.AttachmentsColor.Color
                            type = 'Attachment'
                        end
                    
                        Functions.ItemESP:AddInstance(item, {
                            Text = name,
                            Color = color,
                            Size = 12,
                            Outline = true,
                            ZIndex = z_index
                        }, type)
                    end
                end
            end

            do -- Misc
                function Functions.Normal:SetPlayerHeadSize(player)
                    pcall(function()
                        if FeatureTable.Misc.HitboxExpand.Enabled and player.Character ~= nil and Functions.Normal:GetPlayerHeadCollider(player) then
							local head = Functions.Normal:GetPlayerHeadCollider(player)
							
                        	head.Size = Vector3.new(FeatureTable.Misc.HitboxExpand.Size, FeatureTable.Misc.HitboxExpand.Size, FeatureTable.Misc.HitboxExpand.Size)
                            head.Transparency = 0
                        end
                    end)
                end
            end
        end
        
        do -- Loops
            task.spawn(function()
                for _, item in item_spawns:GetChildren() do
                    Functions.ItemESP:ApplyESP(item)
                end

                do -- Cham ESP
                    for _, Player in Functions.Normal:GetPlayers() do
                        if Player ~= nil then
                            
                            local Highlight = Player:FindFirstChildOfClass("Highlight")
                    
                            if FeatureTable.Visuals.Chams.Enabled then
                                
                                if not Highlight then
                                    Highlight = Instance.new("Highlight", Player)
                                end
                    
                                Highlight.Enabled = true
                                Highlight.Adornee = Player.Character
                                Highlight.FillColor = FeatureTable.Visuals.Chams.FillColor
                                Highlight.OutlineColor = FeatureTable.Visuals.Chams.OutlineColor
                                Highlight.FillTransparency = FeatureTable.Visuals.Chams.FillTransparency
                                Highlight.OutlineTransparency = FeatureTable.Visuals.Chams.OutlineTransparency
                                Highlight.DepthMode = FeatureTable.Visuals.Chams.VisibleOnly and Enum.HighlightDepthMode.Occluded or Enum.HighlightDepthMode.AlwaysOnTop
          
                            else

                                if Highlight then
                                    Highlight:Destroy()
                                end
                            end
                        end
                    end
                end

                do -- Misc
                    do -- Player Hitbox Expand
                        for _, Player in Functions.Normal:GetPlayers() do
                            if Player ~= nil and Player ~= nil and Player ~= Players.LocalPlayer then
                                Functions.Normal:SetPlayerHeadSize(Player)
                            end
                        end
                    end
                    
                end

                do -- Extra
                    
                    do -- FOV Circle
                        local Dynamic = FeatureTable.Combat.Aimbot.DummyRange / math.tan(math.rad(Camera.FieldOfView / 2))
                        FOV_CIRCLE.Position = Vector2.new(Storage.Other.ViewportSize.X/2, Storage.Other.ViewportSize.Y/2)

                        if FeatureTable.Combat.Combat.DynamicFOV then
                            FOV_CIRCLE.Radius = Dynamic
                        else
                            FOV_CIRCLE.Radius = FeatureTable.Combat.Combat.DummyRange
                        end
                    end
                end
            end)
        end
        
        do -- Connections
            Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
                Storage.Other.ViewportSize = Camera.ViewportSize
            end)

            do

                Lighting:GetPropertyChangedSignal("Ambient"):Connect(function()
                    Functions.Normal:SetAmbient("Ambient", FeatureTable.Visuals.Lighting.OverrideAmbient.Color)
                end)

                Lighting:GetPropertyChangedSignal("OutdoorAmbient"):Connect(function()
                    Functions.Normal:SetAmbient("OutdoorAmbient", FeatureTable.Visuals.Lighting.OverrideAmbient.Color)
                end)

                Lighting:GetPropertyChangedSignal("ColorShift_Top"):Connect(function()
                    Functions.Normal:SetAmbient("ColorShift_Top", FeatureTable.Visuals.Lighting.OverrideAmbient.Color)
                end)

                Lighting:GetPropertyChangedSignal("ColorShift_Bottom"):Connect(function()
                    Functions.Normal:SetAmbient("ColorShift_Bottom", FeatureTable.Visuals.Lighting.OverrideAmbient.Color)
                end)
                
            end
            item_spawns.ChildAdded:Connect(Functions.ItemESP.ApplyESP)
        end
    end
end


Library:OnUnload(function()
    Library.Unloaded = true
end)

local MenuGroup = Tabs['Settings']:AddLeftGroupbox('Menu')
MenuGroup:AddButton('Unload', function() Library:Unload() end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('BrickmaneHack')
SaveManager:SetFolder('BrickmaneHack/Afternath')

SaveManager:BuildConfigSection(Tabs['Settings'])
ThemeManager:ApplyToTab(Tabs['Settings'])
SaveManager:LoadAutoloadConfig()
