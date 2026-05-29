local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.ContextActionService
local u8 = v5.Players
local u9 = v5.StarterGui
local u10 = v5.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u15 = {
    "TopBarAppGui",
    "PacketProfiler",
    "PacketChart",
    "MatchDraftApp",
    "CombinedKitDraftApp",
    "AllRandomKitDraftApp"
}
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "PictureModeController"
    end,
    ["__index"] = u12
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.constructor(p19)
    p19.Name = "PictureModeController"
    p19.pictureModeEnabled = false
    p19.shouldShowPlayerList = true
end
function u16.KnitStart(u20) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
        [3] = u7
        [4] = u11
        [5] = u13
    --]]
    u12.KnitStart(u20)
    local v21 = { Enum.KeyCode.F1 }
    if not u14.isAfkServer() then
        u7:BindAction("picture-mode-toggle", function(_, p22, _) --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            if p22 == Enum.UserInputState.Begin then
                task.spawn(function() --[[ Line: 43 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                    --]]
                    u20:togglePictureMode()
                end)
            end
        end, false, unpack(v21))
    end
    u11.SettingChanged:connect(function(p23) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u20
        --]]
        if p23.setting == u13.PICTURE_MODE then
            local v24 = p23.value
            if v24 == 0 or (v24 ~= v24 or not v24) then
                u20:disablePictureMode(false)
            else
                u20:enablePictureMode(false)
            end
        else
            return nil
        end
    end)
end
function u16.enablePictureMode(p25, p26) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u13
        [4] = u15
        [5] = u9
        [6] = u6
        [7] = u2
        [8] = u10
        [9] = u4
    --]]
    local v27 = u8.LocalPlayer:WaitForChild("PlayerGui")
    if p25.pictureModeEnabled then
        return nil
    end
    p25.pictureModeEnabled = true
    if p26 then
        u3.Controllers.SettingsController:setSetting(u13.PICTURE_MODE, true)
    end
    for v28, v29 in v27:GetChildren() do
        local _ = v28 - 1
        local v30 = v29:IsA("ScreenGui")
        if v30 then
            local v31 = v29.Name
            local v32 = table.find(u15, v31) ~= nil
            v30 = not v32
        end
        if v30 then
            v29.Enabled = false
        end
    end
    p25.shouldShowPlayerList = u9:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
    u9:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
    u9:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
    for v33, v34 in u6:GetTagged("Billboard") do
        local _ = v33 - 1
        local v35 = v34:FindFirstChildWhichIsA("BillboardGui")
        if v35 then
            v35.Enabled = false
        end
    end
    p25.tagConnection = u2("EntityNameTag", function(p36) --[[ Line: 104 ]]
        p36.Enabled = false
    end)
    local v37 = u10.CurrentCamera
    if v37 then
        u4("DepthOfFieldEffect", {
            ["Name"] = "PictureDepthOfFieldEffect",
            ["InFocusRadius"] = 15,
            ["Parent"] = v37
        })
    end
end
function u16.disablePictureMode(p38, p39) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u13
        [4] = u15
        [5] = u9
        [6] = u6
        [7] = u10
    --]]
    local v40 = u8.LocalPlayer:WaitForChild("PlayerGui")
    if not p38.pictureModeEnabled then
        return nil
    end
    p38.pictureModeEnabled = false
    if p39 then
        u3.Controllers.SettingsController:setSetting(u13.PICTURE_MODE, false)
    end
    for v41, v42 in v40:GetChildren() do
        local _ = v41 - 1
        local v43 = v42:IsA("ScreenGui")
        if v43 then
            local v44 = v42.Name
            local v45 = table.find(u15, v44) ~= nil
            v43 = not v45
        end
        if v43 then
            v42.Enabled = true
        end
    end
    if p38.shouldShowPlayerList then
        u9:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
    end
    u9:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, true)
    for v46, v47 in u6:GetTagged("Billboard") do
        local _ = v46 - 1
        local v48 = v47:FindFirstChildWhichIsA("BillboardGui")
        if v48 then
            v48.Enabled = true
        end
    end
    local v49 = p38.tagConnection
    if v49 ~= nil then
        v49:Disconnect()
    end
    p38.tagConnection = nil
    for v50, v51 in u6:GetTagged("EntityNameTag") do
        local _ = v50 - 1
        v51.Enabled = true
    end
    local v52 = u10.CurrentCamera
    if v52 then
        local v53 = v52:FindFirstChild("PictureDepthOfFieldEffect")
        if v53 ~= nil then
            v53:Destroy()
        end
    end
end
function u16.togglePictureMode(p54) --[[ Line: 181 ]]
    if p54.pictureModeEnabled then
        p54:disablePictureMode(true)
    else
        p54:enablePictureMode(true)
    end
end
u3.CreateController(u16.new())
return nil