local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.ReplicatedStorage
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "LassoEffectController"
    end,
    ["__index"] = u9
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.constructor(p17)
    p17.Name = "LassoEffectController"
    p17.lassoWrap = {}
end
function u14.KnitStart(u18) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u11
        [4] = u7
        [5] = u13
        [6] = u4
        [7] = u8
        [8] = u10
        [9] = u2
        [10] = u12
    --]]
    u9.KnitStart(u18)
    u6:GetInstanceAddedSignal("LassoHooked"):Connect(function(u19) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u13
            [4] = u4
            [5] = u18
        --]]
        local v20 = u19:GetAttribute("LassoHookedSkin") or u11.DEFAULT
        local v21 = u7.Assets.Misc.LassoWrap
        local v22 = (v21:FindFirstChild(v20) or v21.default):Clone()
        v22.Parent = u19
        local v23 = u19:FindFirstChild("UpperTorso")
        if not v23 then
            return nil
        end
        local v24 = v23.CFrame
        local v25 = CFrame.Angles(0, 1.5707963267948966, 0)
        v22.Rope.CFrame = v24 * v25
        u13:weldParts(v22.Rope, v23)
        local v26 = u4.new()
        v26:GiveTask(v22)
        v26:GiveTask(u19.Destroying:Connect(function() --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
            --]]
            u18.lassoWrap[u19] = nil
        end))
        u18.lassoWrap[u19] = v26
    end)
    u6:GetInstanceRemovedSignal("LassoHooked"):Connect(function(p27) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        local v28 = u18.lassoWrap[p27]
        if v28 ~= nil then
            v28:DoCleaning()
        end
        u18.lassoWrap[p27] = nil
    end)
    u8.ProjectileLaunched:connect(function(p29) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u2
            [4] = u12
        --]]
        if p29:isCancelled() then
            return nil
        end
        if p29.projectileType ~= "lasso" then
            return nil
        end
        if not p29.shooter then
            return nil
        end
        local v30 = u10:getEntity(p29.shooter)
        if not v30 then
            return nil
        end
        local v31 = v30:getInstance():FindFirstChild("RightHand")
        if v31 ~= nil then
            v31 = v31:FindFirstChild("RightGripAttachment")
        end
        if not v31 then
            return nil
        end
        local v32 = p29.projectile:FindFirstChild("Handle")
        if not v32 then
            return nil
        end
        local u33 = p29.projectile:FindFirstChild("Handle")
        if u33 ~= nil then
            u33 = u33:FindFirstChild("Beam")
        end
        if not u33 then
            return nil
        end
        local u34 = u4.new()
        u33.Destroying:Connect(function() --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            u34:DoCleaning()
        end)
        local v35 = p29.projectile:FindFirstChild("Handle")
        if v35 ~= nil then
            v35 = v35:FindFirstChild("BeamPoint")
        end
        if not v35 then
            return nil
        end
        u33.Attachment0 = v31
        u33.Attachment1 = v35
        local u36 = v30:getInstance():FindFirstChild("UpperTorso")
        if u36 ~= nil then
            u36 = u36:FindFirstChild("BodyFrontAttachment")
        end
        v31.Destroying:Connect(function() --[[ Line: 128 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u33
            --]]
            if u36 and u33.Parent then
                u33.Attachment0 = u36
            end
        end)
        local u37 = u2:playSound(u12.GRAPPLING_HOOK_EXTEND_LOOP, {
            ["rollOffMaxDistance"] = 150,
            ["looped"] = true,
            ["position"] = v32.Position,
            ["parent"] = v32
        })
        u34:GiveTask(function() --[[ Line: 139 ]]
            --[[
            Upvalues:
                [1] = u37
            --]]
            local v38 = u37
            if v38 ~= nil then
                v38:Stop()
            end
            local v39 = u37
            if v39 ~= nil then
                v39:Destroy()
            end
        end)
    end)
end
v3.CreateController(u14.new())
return nil