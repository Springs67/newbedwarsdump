local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.RunService
local u9 = v6.UserInputService
local u10 = v6.Workspace
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local function u15(u14) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u1
    --]]
    if u7.LocalPlayer.Character then
        u14(u7.LocalPlayer.Character)
        return nil
    end
    u1.Promise.try(function() --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        return u7.LocalPlayer.CharacterAdded:Wait()
    end):andThen(function() --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u7
        --]]
        u14(u7.LocalPlayer.Character)
    end)
end
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "MobileShiftLockController"
    end,
    ["__index"] = u11
})
u16.__index = u16
function u16.new(...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, ...) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
    --]]
    u11.constructor(p19, ...)
    p19.Name = "MobileShiftLockController"
    p19.maid = u4.new()
    p19.enabled = false
    p19.blocked = false
end
function u16.KnitStart(u20) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u2
        [3] = u12
    --]]
    u11.KnitStart(u20)
    if not u2.isMobileControls() then
        return nil
    end
    u12.changed:connect(function(p21, p22) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if p21.Settings.mobileShiftLock ~= p22.Settings.mobileShiftLock then
            if p21.Settings.mobileShiftLock then
                u20:enable(false)
                return
            end
            u20:disable(false)
        end
    end)
end
function u16.enable(u23, p24) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u13
        [3] = u12
        [4] = u15
        [5] = u1
        [6] = u8
        [7] = u10
        [8] = u5
        [9] = u7
        [10] = u9
    --]]
    local v25 = p24 == nil and true or p24
    if u23.blocked then
        return nil
    end
    if not u2.isMobileControls() then
        return nil
    end
    u23:disable(false)
    if v25 then
        u13.Client:WaitFor("ToggleMobileShiftLock"):andThen(function(p26) --[[ Line: 88 ]]
            p26:SendToServer({
                ["enabled"] = true
            })
        end)
        u12:dispatch({
            ["type"] = "SettingsUpdateSome",
            ["settings"] = {
                ["mobileShiftLock"] = true
            }
        })
    end
    u23.enabled = true
    u23.maid:GiveTask(function() --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23.enabled = false
    end)
    u23.maid:GiveTask(function() --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23.savedFrame = nil
    end)
    local u27 = UserSettings():GetService("UserGameSettings").RotationType
    u23.maid:GiveTask(function() --[[ Line: 109 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        UserSettings():GetService("UserGameSettings").RotationType = u27
    end)
    UserSettings():GetService("UserGameSettings").RotationType = Enum.RotationType.CameraRelative
    local function u30(u28) --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local u29 = u28.AutoRotate
        u23.maid:GiveTask(function() --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u29
            --]]
            u28.AutoRotate = u29
        end)
        u28.AutoRotate = false
    end
    u15(function(u31) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u30
        --]]
        u1.Promise.try(function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            return u31:WaitForChild("Humanoid")
        end):andThen(function(p32) --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30(p32)
        end)
    end)
    u8:BindToRenderStep("MSL_PreCamera", Enum.RenderPriority.Camera.Value - 1, function() --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u23
        --]]
        local v33 = u10.CurrentCamera
        if u23.savedFrame then
            v33.CFrame = u23.savedFrame
        end
    end)
    local u34 = u5.mount(u5.createFragment({
        ["MouseIcon"] = u5.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u5.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://7368844459",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromOffset(6, 6),
                ["Position"] = UDim2.new(0.5, 0, 0.5, -game:GetService("GuiService"):GetGuiInset().Y / 2)
            }, { u5.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }) })
    }), u7.LocalPlayer:WaitForChild("PlayerGui"))
    u23.maid:GiveTask(function() --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u34
        --]]
        u5.unmount(u34)
    end)
    local u35 = u9.MouseBehavior
    local u36 = u9.MouseIconEnabled
    u23.maid:GiveTask(function() --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u35
            [3] = u36
        --]]
        u9.MouseBehavior = u35
        u9.MouseIconEnabled = u36
    end)
    u7.LocalPlayer.CameraMinZoomDistance = 14
    u7.LocalPlayer.CameraMaxZoomDistance = 14
    u23.maid:GiveTask(function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        u7.LocalPlayer.CameraMinZoomDistance = 0
        u7.LocalPlayer.CameraMaxZoomDistance = 14
    end)
    u8:BindToRenderStep("MSL_PostCamera", Enum.RenderPriority.Camera.Value + 1, function() --[[ Line: 157 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u10
            [3] = u23
            [4] = u15
            [5] = u1
        --]]
        u9.MouseBehavior = Enum.MouseBehavior.LockCenter
        u9.MouseIconEnabled = false
        local u37 = u10.CurrentCamera
        u23.savedFrame = u37.CFrame
        local function u42(p38) --[[ Line: 162 ]]
            --[[
            Upvalues:
                [1] = u37
            --]]
            local v39 = p38.RootPart
            local v40 = v39.CFrame
            local _, _, _ = v40:ToOrientation()
            local _, v41 = u37.CFrame:ToOrientation()
            v39.CFrame = CFrame.new(v40.Position) * CFrame.Angles(0, v41, 0)
            u37.CFrame = u37.CFrame * CFrame.new(Vector3.new(2, 0, 0))
        end
        u15(function(u43) --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u42
            --]]
            u1.Promise.try(function() --[[ Line: 30 ]]
                --[[
                Upvalues:
                    [1] = u43
                --]]
                return u43:WaitForChild("Humanoid")
            end):andThen(function(p44) --[[ Line: 33 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                u42(p44)
            end)
        end)
    end)
    u23.maid:GiveTask(function() --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8:UnbindFromRenderStep("MSL_PreCamera")
        u8:UnbindFromRenderStep("MSL_PostCamera")
    end)
end
function u16.disable(p45, p46) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
    --]]
    local v47 = p46 == nil and true or p46
    p45.maid:DoCleaning()
    if v47 then
        u13.Client:WaitFor("ToggleMobileShiftLock"):andThen(function(p48) --[[ Line: 188 ]]
            p48:SendToServer({
                ["enabled"] = false
            })
        end)
        u12:dispatch({
            ["type"] = "SettingsUpdateSome",
            ["settings"] = {
                ["mobileShiftLock"] = false
            }
        })
    end
end
function u16.isEnabled(p49) --[[ Line: 202 ]]
    return p49.enabled
end
function u16.blockShiftLock(p50, p51) --[[ Line: 205 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    p50.blocked = p51
    if p51 then
        p50:disable(false)
    elseif not p51 and u12:getState().Settings.mobileShiftLock then
        p50:enable(false)
    end
end
v3.CreateController(u16.new())
return nil