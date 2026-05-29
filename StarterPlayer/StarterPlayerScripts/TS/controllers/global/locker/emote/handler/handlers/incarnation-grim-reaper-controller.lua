local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.ReplicatedStorage
local u9 = v6.TweenService
local u10 = v6.Workspace
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u18 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "IncarnationGrimReaperController"
    end,
    ["__index"] = u11
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p22)
    p22.Name = "IncarnationGrimReaperController"
end
function u19.KnitStart(p23) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u14
        [4] = u12
        [5] = u15
        [6] = u18
        [7] = u7
        [8] = u17
        [9] = u8
        [10] = u10
        [11] = u16
        [12] = u3
        [13] = u13
        [14] = u9
        [15] = u4
    --]]
    u11.KnitStart(p23)
    u5.Controllers.PreloadController:preloadForItemType(u14.HEAVENLY_SWORD, {
        ["animations"] = { u12.HEAVENLY_SWORD_CHARGE, u12.HEAVENLY_SWORD_SWING }
    })
    local v24 = u5.Controllers.EmoteHandlerController
    local v25 = u15.INCARNATION_GRIM_REAPER
    local u26 = u18
    local u27 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 49 ]]
            return "Anonymous"
        end,
        ["__index"] = u26
    })
    u27.__index = u27
    function u27.new(...) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        local v28 = u27
        local v29 = setmetatable({}, v28)
        return v29:constructor(...) or v29
    end
    function u27.constructor(p30, ...) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26.constructor(p30, ...)
    end
    function u27.onEnable(p31, p32, p33, _, p34) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u17
        --]]
        local v35 = u7:GetPlayerByUserId(p32)
        if u17.isLobbyServer() then
            p31:lobbyEmote(v35, p32, p33, p34)
        else
            if not v35 then
                return nil
            end
            p31:gameEmote(v35, p33, p34)
        end
    end
    function u27.lobbyEmote(u36, u37, u38, u39, u40) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u10
            [3] = u16
            [4] = u3
            [5] = u13
            [6] = u12
            [7] = u7
            [8] = u9
        --]]
        local u41 = u8.Assets.Effects.GrimReaperIncarnation:Clone()
        u41.PrimaryPart.Anchored = true
        u41.Parent = u10
        u40:GiveTask(u41)
        u36:setupInstance(u41)
        local u42 = u39.PrimaryPart
        if u42 ~= nil then
            u42 = u42.CFrame
        end
        if not u42 then
            return nil
        end
        u36:playSound(u16.KEEPER_SUMMON, u38, {
            ["rollOffMaxDistance"] = 220,
            ["position"] = u42.Position
        })
        u41:PivotTo(u42 + Vector3.new(0, 7, 0))
        local u43 = nil
        local u44 = u3:playAnimation(u41, u13:getAssetId(u12.HEAVENLY_SWORD_CHARGE))
        if u44 then
            u40:GiveTask(u44)
            u44:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 99 ]]
                --[[
                Upvalues:
                    [1] = u44
                --]]
                local v45 = u44
                if v45 ~= nil then
                    v45:AdjustSpeed(0)
                end
            end)
        end
        local v46 = u44
        if v46 ~= nil then
            v46:AdjustSpeed(0.4)
        end
        if u38 == u7.LocalPlayer.UserId or u36:isPreview(u38) then
            u43 = u3:playAnimation(u39, u13:getAssetId(u12.HEAVENLY_SWORD_CHARGE))
            local v47 = u43
            if v47 ~= nil then
                v47:AdjustSpeed(0.4)
            end
            if u43 then
                u43:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 117 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                    --]]
                    local v48 = u43
                    if v48 ~= nil then
                        v48:AdjustSpeed(0)
                    end
                end)
                u40:GiveTask(u43)
            end
        end
        local v49 = u41:WaitForChild("3DClothing"):GetChildren()
        local function v53(p50) --[[ Line: 127 ]]
            --[[
            Upvalues:
                [1] = u9
            --]]
            if p50:IsA("MeshPart") then
                u9:Create(p50, TweenInfo.new(2.5, Enum.EasingStyle.Linear), {
                    ["Transparency"] = 0
                }):Play()
                for v51, v52 in p50:GetDescendants() do
                    local _ = v51 - 1
                    if v52:IsA("ParticleEmitter") then
                        v52.Enabled = true
                    end
                end
            end
        end
        for v54, v55 in v49 do
            v53(v55, v54 - 1, v49)
        end
        local u56 = u41:FindFirstChild("ReaperScythe")
        u40:GiveTask(task.delay(2.5, function() --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u7
                [3] = u36
                [4] = u38
                [5] = u43
                [6] = u3
                [7] = u39
                [8] = u13
                [9] = u12
                [10] = u40
                [11] = u56
                [12] = u44
                [13] = u41
            --]]
            if u37 == u7.LocalPlayer or u36:isPreview(u38) then
                local v57 = u43
                if v57 ~= nil then
                    v57:Stop()
                end
                local v58 = u43
                if v58 ~= nil then
                    v58:Destroy()
                end
                u43 = u3:playAnimation(u39, u13:getAssetId(u12.HEAVENLY_SWORD_SWING))
                u40:GiveTask(function() --[[ Line: 159 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                    --]]
                    local v59 = u43
                    if v59 ~= nil then
                        v59:Destroy()
                    end
                end)
            end
            if u56 then
                for v60, v61 in u56:GetDescendants() do
                    local _ = v60 - 1
                    if v61:IsA("MeshPart") then
                        v61.Transparency = 0
                    end
                end
            end
            u44 = u3:playAnimation(u41, u13:getAssetId(u12.HEAVENLY_SWORD_SWING))
            u40:GiveTask(function() --[[ Line: 178 ]]
                --[[
                Upvalues:
                    [1] = u44
                --]]
                local v62 = u44
                if v62 ~= nil then
                    v62:Destroy()
                end
            end)
            local v63 = u43
            if v63 ~= nil then
                v63:AdjustSpeed(0.25)
            end
            local v64 = u44
            if v64 ~= nil then
                v64:AdjustSpeed(0.25)
            end
        end))
        u40:GiveTask(task.delay(3, function() --[[ Line: 193 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u44
                [3] = u36
                [4] = u16
                [5] = u38
                [6] = u42
            --]]
            local v65 = u43
            if v65 ~= nil then
                v65:AdjustSpeed(1)
            end
            local v66 = u44
            if v66 ~= nil then
                v66:AdjustSpeed(1)
            end
            u36:playSound(u16.KEEPER_ATTACK, u38, {
                ["rollOffMaxDistance"] = 220,
                ["position"] = u42.Position
            })
        end))
        u40:GiveTask(task.delay(3.5, function() --[[ Line: 207 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            u40:DoCleaning()
        end))
    end
    function u27.gameEmote(_, u67, u68, u69) --[[ Line: 211 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u13
            [4] = u12
            [5] = u8
            [6] = u10
            [7] = u4
            [8] = u16
        --]]
        local u70 = u68.PrimaryPart
        if u70 ~= nil then
            u70 = u70.CFrame
        end
        if not u70 then
            return nil
        end
        local u71 = nil
        local u72
        if u67 == u7.LocalPlayer then
            u72 = u3:playAnimation(u7.LocalPlayer, u13:getAssetId(u12.HEAVENLY_SWORD_CHARGE))
            local v73 = u72
            if v73 ~= nil then
                v73:AdjustSpeed(0.4)
            end
            if u72 then
                u72:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 229 ]]
                    --[[
                    Upvalues:
                        [1] = u72
                    --]]
                    local v74 = u72
                    if v74 ~= nil then
                        v74:AdjustSpeed(0)
                    end
                end)
                u69:GiveTask(u72)
            end
        else
            u72 = nil
        end
        task.delay(2.5, function() --[[ Line: 238 ]]
            --[[
            Upvalues:
                [1] = u68
                [2] = u8
                [3] = u69
                [4] = u10
                [5] = u67
                [6] = u7
                [7] = u72
                [8] = u3
                [9] = u13
                [10] = u12
                [11] = u71
            --]]
            local v75 = u68.PrimaryPart
            if v75 ~= nil then
                v75 = v75.CFrame
            end
            if not v75 then
                return nil
            end
            local v76 = u8.Assets.Effects.GrimReaperEmote:Clone()
            v76.PrimaryPart.Anchored = true
            u69:GiveTask(v76)
            v76.Parent = u10
            v76:PivotTo(v75 + Vector3.new(0, 2, 0))
            if u67 == u7.LocalPlayer then
                local v77 = u72
                if v77 ~= nil then
                    v77:Stop()
                end
                local v78 = u72
                if v78 ~= nil then
                    v78:Destroy()
                end
                u72 = u3:playAnimation(u7.LocalPlayer, u13:getAssetId(u12.HEAVENLY_SWORD_SWING))
                u71 = u3:playAnimation(v76, u13:getAssetId(u12.HEAVENLY_SWORD_SWING))
                u69:GiveTask(function() --[[ Line: 266 ]]
                    --[[
                    Upvalues:
                        [1] = u72
                    --]]
                    local v79 = u72
                    if v79 ~= nil then
                        v79:Destroy()
                    end
                end)
            end
            u69:GiveTask(function() --[[ Line: 273 ]]
                --[[
                Upvalues:
                    [1] = u71
                --]]
                local v80 = u71
                if v80 ~= nil then
                    v80:Destroy()
                end
            end)
            local v81 = u72
            if v81 ~= nil then
                v81:AdjustSpeed(0.5)
            end
            local v82 = u71
            if v82 ~= nil then
                v82:AdjustSpeed(0.5)
            end
        end)
        task.delay(3, function() --[[ Line: 288 ]]
            --[[
            Upvalues:
                [1] = u72
                [2] = u71
                [3] = u4
                [4] = u16
                [5] = u70
            --]]
            local v83 = u72
            if v83 ~= nil then
                v83:AdjustSpeed(1)
            end
            local v84 = u71
            if v84 ~= nil then
                v84:AdjustSpeed(1)
            end
            u4:playSound(u16.KEEPER_ATTACK, {
                ["rollOffMaxDistance"] = 220,
                ["position"] = u70.Position
            })
        end)
        task.delay(3.5, function() --[[ Line: 302 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            u69:DoCleaning()
        end)
    end
    function u27.onDisable(_, _, _, _) --[[ Line: 306 ]] end
    v24:registerHandler(v25, u27)
end
u5.CreateController(u19.new())
return nil