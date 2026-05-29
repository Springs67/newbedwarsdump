local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u13 = v1.import(script, script.Parent, "ui", "bountyhunter-poster").BountyHunterPosterWrapper
local u14 = v1.import(script, script.Parent, "ui", "target-marker").TargetMarkerWrapper
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "BountyhunterController"
    end,
    ["__index"] = u12
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
        [3] = u4
    --]]
    u12.constructor(p18, u9.BOUNTY_HUNTER)
    p18.Name = "BountyhunterController"
    p18.maid = u4.new()
end
function u15.KnitStart(p19) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p19)
end
function u15.onKitReplicationActivated(u20, _) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u6
        [3] = u8
        [4] = u2
        [5] = u11
        [6] = u7
        [7] = u14
        [8] = u4
        [9] = u5
    --]]
    u10.Client:OnEvent("BountyHunterTargetChanged", function(p21) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
        --]]
        local v22 = p21.newTargetUserId
        local v23
        if v22 == 0 or (v22 ~= v22 or not v22) then
            v23 = nil
        else
            v23 = u6:GetPlayerByUserId(p21.newTargetUserId)
        end
        u8:dispatch({
            ["type"] = "KitBountyHunterSetTarget",
            ["bountyHunterTarget"] = v23
        })
    end)
    u10.Client:WaitFor("GetBountyHunterTarget"):andThen(function(p24) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
        --]]
        p24:CallServerAsync():andThen(function(p25) --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u8
            --]]
            local v26
            if p25 == 0 or (p25 ~= p25 or not p25) then
                v26 = nil
            else
                v26 = u6:GetPlayerByUserId(p25)
            end
            u8:dispatch({
                ["type"] = "KitBountyHunterSetTarget",
                ["bountyHunterTarget"] = v26
            })
        end)
    end)
    u10.Client:OnEvent("BountyHunterRewardClaimed", function(_) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
        --]]
        u2:playSound(u11.BOUNTY_CLAIMED)
    end)
    u8.changed:connect(function(p27, p28) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u2
            [3] = u11
            [4] = u7
            [5] = u14
            [6] = u4
            [7] = u5
            [8] = u10
        --]]
        local u29 = p27.Kit.bountyHunterTarget
        local v30 = p28.Kit.bountyHunterTarget
        if u29 == nil or u29 == v30 then
            return nil
        end
        u20.maid:DoCleaning()
        u2:playSound(u11.BOUNTY_ASSIGNED)
        local function u35(u31) --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u14
                [3] = u29
                [4] = u4
                [5] = u5
                [6] = u10
            --]]
            local u32 = u7("TargetMarker", u14, {
                ["adornee"] = u31:WaitForChild("HumanoidRootPart"),
                ["player"] = u29
            })
            local u33 = u4.new()
            u33:GiveTask(function() --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u32
                --]]
                u5.unmount(u32)
            end)
            u33:GiveTask(u29.CharacterRemoving:Connect(function() --[[ Line: 82 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                u33:DoCleaning()
            end))
            u33:GiveTask(u10.Client:Get("EntityDeathEvent"):Connect(function(p34) --[[ Line: 85 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u33
                --]]
                if p34.entityInstance == u31 then
                    u33:DoCleaning()
                end
            end))
            return u33
        end
        u20.maid:GiveTask(u29.CharacterAdded:Connect(function(p36) --[[ Line: 92 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u35
            --]]
            u20.maid:GiveTask((u35(p36)))
        end))
        task.spawn(function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u20
                [3] = u35
            --]]
            if u29.Character then
                u20.maid:GiveTask((u35(u29.Character)))
            end
        end)
    end)
end
function u15.onKitLocalActivated(_, _) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u6
    --]]
    u7("BountyHunterPoster", u13, {}, {
        ["Parent"] = u6.LocalPlayer:WaitForChild("PlayerGui")
    })
end
function u15.onKitLocalDeactivated(_) --[[ Line: 108 ]] end
function u15.onKitReplicationDeactivated(_) --[[ Line: 110 ]] end
function u15.onInnateAbilityEnabled(_, _, _) --[[ Line: 112 ]] end
function u15.onAbilityUsed(_, _, _) --[[ Line: 114 ]] end
v3.CreateController(u15.new())
return nil