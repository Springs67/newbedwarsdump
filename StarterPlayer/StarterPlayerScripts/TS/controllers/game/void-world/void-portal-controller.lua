local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.SoundManager
local u5 = v3.WatchCollectionTag
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.CollectionService
local u14 = v12.Players
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "void", "void-world-util").VoidWorldUtil
local u25 = v1.import(script, script.Parent, "void-portal-tag").VoidPortalTag
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "VoidPortalController"
    end,
    ["__index"] = u16
})
u26.__index = u26
function u26.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p29)
    p29.Name = "VoidPortalController"
end
function u26.KnitStart(p30) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u14
        [3] = u13
        [4] = u15
        [5] = u9
        [6] = u19
        [7] = u18
        [8] = u5
        [9] = u10
        [10] = u11
        [11] = u25
        [12] = u24
        [13] = u21
        [14] = u8
        [15] = u17
        [16] = u20
        [17] = u2
        [18] = u4
        [19] = u23
        [20] = u22
    --]]
    u16.KnitStart(p30)
    task.spawn(function() --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u13
            [3] = u15
            [4] = u9
            [5] = u19
            [6] = u18
        --]]
        while true do
            local v31 = task.wait(0.25)
            if v31 == 0 or (v31 ~= v31 or not v31) then
                break
            end
            local u32 = u14.LocalPlayer.Character
            if u32 ~= nil then
                u32 = u32.PrimaryPart
                if u32 ~= nil then
                    u32 = u32.Position
                end
            end
            for _, u33 in u13:GetTagged("VoidPortal") do
                task.spawn(function() --[[ Line: 63 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u32
                        [3] = u15
                        [4] = u9
                        [5] = u19
                        [6] = u18
                    --]]
                    local v34 = u33
                    local v35 = not u32 and (1 / 0) or (u32 - v34.Position).Magnitude
                    local u36 = v34:FindFirstChild("Rig")
                    if not u36 then
                        return nil
                    end
                    if not u36.PrimaryPart then
                        return nil
                    end
                    if u32 then
                        local u37 = u36:GetPrimaryPartCFrame()
                        local v38 = u32.X
                        local v39 = u37.Y
                        local v40 = u32.Z
                        local u41 = Vector3.new(v38, v39, v40)
                        u15(0.25, u9, function(p42) --[[ Line: 84 ]]
                            --[[
                            Upvalues:
                                [1] = u36
                                [2] = u37
                                [3] = u41
                            --]]
                            if not u36.PrimaryPart then
                                return nil
                            end
                            u36:PivotTo(u37:Lerp(CFrame.new(u37.Position, u41) * CFrame.Angles(0, 1.5707963267948966, 0), p42))
                        end)
                    end
                    if u36 ~= nil then
                        u36 = u36:FindFirstChildWhichIsA("AnimationController")
                        if u36 ~= nil then
                            u36 = u36:FindFirstChildWhichIsA("Animator")
                        end
                    end
                    if u36 then
                        local v43 = v35 < 10
                        local u44 = nil
                        for v45, v46 in u36:GetPlayingAnimationTracks() do
                            local _ = v45 - 1
                            local v47 = v46.Animation
                            if v47 ~= nil then
                                v47 = v47.AnimationId
                            end
                            if v47 == u19:getAssetId(u18.VOID_PORTAL_EXCITED) == true then
                                u44 = v46
                                break
                            end
                        end
                        if v43 and not u44 then
                            u19:playAnimation(u36, u18.VOID_PORTAL_EXCITED, {
                                ["fadeInTime"] = 0.1
                            })
                            return
                        end
                        if not v43 and u44 then
                            u44:Stop(0.5)
                            task.delay(0.15, function() --[[ Line: 130 ]]
                                --[[
                                Upvalues:
                                    [1] = u44
                                --]]
                                u44:Destroy()
                            end)
                        end
                    end
                end)
            end
        end
    end)
    u5("VoidPortal", function(u48) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u19
            [3] = u18
            [4] = u11
            [5] = u25
            [6] = u24
            [7] = u21
            [8] = u8
            [9] = u17
            [10] = u14
            [11] = u20
            [12] = u2
            [13] = u4
            [14] = u23
            [15] = u22
        --]]
        local u49 = u10.new()
        task.spawn(function() --[[ Line: 142 ]]
            --[[
            Upvalues:
                [1] = u48
                [2] = u19
                [3] = u18
            --]]
            u48:WaitForChild("Rig")
            u19:playAnimation(u48.Rig:WaitForChild("AnimationController"):WaitForChild("Animator"), u18.VOID_PORTAL_IDLE)
        end)
        task.spawn(function() --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u48
                [2] = u11
                [3] = u25
            --]]
            local v50 = u48:GetAttribute("CloseTime")
            if v50 == 0 or (v50 ~= v50 or not v50) then
                u48:GetAttributeChangedSignal("CloseTime"):Wait()
            end
            local v51 = u48:GetAttribute("CloseTime")
            if v51 ~= nil then
                u11.mount(u11.createElement(u25, {
                    ["getTag"] = function(p52) --[[ Name: getTag, Line 156 ]]
                        return "Closes in " .. tostring(p52) .. "s"
                    end,
                    ["closeTime"] = v51
                }), u48, "VoidTag")
            end
        end)
        local u53 = u48:GetAttribute("VoidExit") == true
        local v54 = u24.VOID_ENTRY_COST
        local u55 = tostring(v54) .. " " .. u21(u24.VOID_ENTRY_MATERIAL).displayName
        local u56 = u8.Controllers.ProximityPromptController:createProximityPrompt({
            ["HoldDuration"] = 3,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 6,
            ["ObjectText"] = "Void",
            ["ClickablePrompt"] = false,
            ["ActionText"] = u53 and "Exit" or "Enter (" .. u55 .. ")",
            ["Parent"] = u48
        })
        u48.AncestryChanged:Connect(function(_, p57) --[[ Line: 175 ]]
            --[[
            Upvalues:
                [1] = u49
            --]]
            if p57 == nil then
                u49:DoCleaning()
            end
        end)
        local u59 = u17.On(function(p58, _, _, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 180 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u56
            --]]
            if p58 == u14.LocalPlayer.Character then
                u56:InputHoldEnd()
            end
        end)
        u49:GiveTask(function() --[[ Line: 185 ]]
            --[[
            Upvalues:
                [1] = u59
            --]]
            u59()
        end)
        u56.PromptButtonHoldBegan:Connect(function(p60) --[[ Line: 188 ]]
            --[[
            Upvalues:
                [1] = u53
                [2] = u20
                [3] = u24
                [4] = u56
                [5] = u2
                [6] = u55
                [7] = u10
                [8] = u19
                [9] = u14
                [10] = u18
            --]]
            if not (u53 or u20.hasEnough(p60, u24.VOID_ENTRY_MATERIAL, u24.VOID_ENTRY_COST)) then
                u56:InputHoldEnd()
                u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    ["message"] = "You need " .. u55 .. " to enter the Void."
                })
                return nil
            end
            local u61 = u10.new()
            local u62 = u19:playAnimation(u14.LocalPlayer, u18.OPEN_CRATE)
            u61:GiveTask(function() --[[ Line: 198 ]]
                --[[
                Upvalues:
                    [1] = u62
                --]]
                local v63 = u62
                if v63 ~= nil then
                    v63:Stop()
                end
                local v64 = u62
                if v64 ~= nil then
                    v64:Destroy()
                end
            end)
            u56.PromptButtonHoldEnded:Connect(function() --[[ Line: 208 ]]
                --[[
                Upvalues:
                    [1] = u61
                --]]
                u61:DoCleaning()
            end)
            u56.AncestryChanged:Connect(function(_, p65) --[[ Line: 211 ]]
                --[[
                Upvalues:
                    [1] = u61
                --]]
                if p65 == nil then
                    u61:DoCleaning()
                end
            end)
        end)
        u56.Triggered:Connect(function(_) --[[ Line: 217 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u23
                [3] = u22
                [4] = u48
            --]]
            u4:playSound(u23.VOID_PORTAL_TELEPORT)
            local v66 = {
                ["blockInstance"] = u48
            }
            u22.Client:Get("UseVoidPortal"):SendToServer(v66)
        end)
    end)
    u22.Client:WaitFor("VoidPortalUsed"):andThen(function(p67) --[[ Line: 225 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u4
            [3] = u23
        --]]
        p67:Connect(function(p68) --[[ Line: 226 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u4
                [3] = u23
            --]]
            if p68.player == u14.LocalPlayer then
                return nil
            end
            u4:playSound(u23.VOID_PORTAL_TELEPORT, {
                ["rollOffMaxDistance"] = 80,
                ["position"] = p68.portal.Position
            })
        end)
    end)
end
v7.CreateController(u26.new())
return nil