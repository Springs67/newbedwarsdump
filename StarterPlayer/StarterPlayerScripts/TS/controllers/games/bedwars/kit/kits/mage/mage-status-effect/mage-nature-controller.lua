local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.Players
local v5 = v3.ReplicatedStorage
local u6 = v3.RunService
local u7 = v3.TweenService
local u8 = v3.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "mage", "mage-kit-util")
local u14 = v13.MageElement
local u15 = v13.MageKitUtil
local u16 = v5.Assets.Effects.BannerConnection
local u17 = TweenInfo.new(0.33, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, (1 / 0), true)
local u18 = u15.MageElementMeta[u14.NATURE].colorSequence
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "MageNatureController"
    end,
    ["__index"] = u10
})
u19.__index = u19
function u19.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p22)
    p22.Name = "MageNatureController"
    p22.playerBeamMap = {}
    p22.hitTimeMap = {}
end
function u19.KnitStart(u23) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u12
        [4] = u15
        [5] = u14
    --]]
    u10.KnitStart(u23)
    u23:beamCleanupTicker()
    u9.ProjectileHit:connect(function(p24) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u15
            [3] = u14
            [4] = u23
        --]]
        if p24:isCancelled() then
            return nil
        end
        if p24.projectileType ~= "mage_spell_nature" then
            return nil
        end
        if p24.shooter == nil then
            return nil
        end
        local v25 = p24.shooter:getInstance()
        if not v25 then
            return nil
        end
        local v26 = u12:getPlayerFromEntityInstance(v25)
        if not v26 then
            return nil
        end
        local v27 = p24.hitEntity
        if v27 ~= nil then
            v27 = v27:getInstance()
        end
        if not v27 then
            return nil
        end
        if u15.hasUnlockedMageElement(v26, u14.NATURE) then
            u23:playLifeStealEffect(v25, v27)
        end
    end)
end
function u19.isLocal(_, p28) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return p28 == u4.LocalPlayer.Character
end
function u19.playLifeStealEffect(p29, p30, p31) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u18
        [3] = u7
        [4] = u17
        [5] = u8
    --]]
    if p29:isLocal(p30) or p29:isLocal(p31) then
        local v32 = p30:WaitForChild("UpperTorso", 1)
        if v32 ~= nil then
            v32 = v32:WaitForChild("BodyFrontAttachment", 1)
        end
        local v33 = p31:WaitForChild("UpperTorso", 1)
        if v33 ~= nil then
            v33 = v33:WaitForChild("BodyFrontAttachment", 1)
        end
        local v34 = u16.Beam1:Clone()
        local v35 = u16.Beam2:Clone()
        if v32 and v33 then
            local v36 = p29.playerBeamMap[p30]
            local v37
            if v36 == nil then
                v37 = v36
            else
                v37 = nil
                for v38, v39 in v36 do
                    local _ = v38 - 1
                    if v39.target == p31 == true then
                        v37 = v39
                        break
                    end
                end
            end
            if not v37 then
                v34.Color = u18
                v34.Attachment0 = v32
                v34.Attachment1 = v33
                v34.Parent = p30
                v35.Color = ColorSequence.new(Color3.fromRGB(252, 245, 176))
                v35.Attachment0 = v32
                v35.Attachment1 = v33
                v35.Parent = p30
                u7:Create(v34, u17, {
                    ["CurveSize0"] = -1.25,
                    ["CurveSize1"] = 1.25,
                    ["Width0"] = 1.4,
                    ["Width1"] = 1.4
                }):Play()
                u7:Create(v35, u17, {
                    ["CurveSize0"] = 1.25,
                    ["CurveSize1"] = -1.25,
                    ["Width0"] = 1.2,
                    ["Width1"] = 1.2
                }):Play()
                if v36 then
                    table.insert(v36, {
                        ["target"] = p31,
                        ["front"] = v34,
                        ["back"] = v35
                    })
                else
                    p29.playerBeamMap[p30] = {
                        {
                            ["target"] = p31,
                            ["front"] = v34,
                            ["back"] = v35
                        }
                    }
                end
            end
        end
        local v40 = p29.hitTimeMap[p30]
        if v40 then
            v40[p31] = u8:GetServerTimeNow()
            return
        end
        local v41 = {
            [p31] = u8:GetServerTimeNow()
        }
        p29.hitTimeMap[p30] = v41
    end
end
function u19.beamCleanupTicker(u42) --[[ Line: 175 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u11
    --]]
    u6.Heartbeat:Connect(function() --[[ Line: 176 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u8
            [3] = u11
        --]]
        local v43 = u42.hitTimeMap
        local function v59(p44, u45) --[[ Line: 178 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u11
                [3] = u42
            --]]
            local function v56(p46, p47) --[[ Line: 180 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u11
                    [3] = u42
                    [4] = u45
                --]]
                if u8:GetServerTimeNow() - p46 >= u11.MAGE_LIFE_STEAL_DURATION then
                    local v48 = u42.playerBeamMap[u45]
                    local v49
                    if v48 == nil then
                        v49 = v48
                    else
                        v49 = nil
                        for v50, v51 in v48 do
                            local _ = v50 - 1
                            if v51.target == p47 == true then
                                v49 = v51
                                break
                            end
                        end
                    end
                    if v48 ~= nil then
                        local v52 = 0
                        v48 = {}
                        for v53, v54 in v48 do
                            local _ = v53 - 1
                            if v54.target ~= p47 == true then
                                v52 = v52 + 1
                                v48[v52] = v54
                            end
                        end
                    end
                    if v48 then
                        u42.playerBeamMap[u45] = v48
                    end
                    if v49 then
                        v49.front:Destroy()
                        v49.front.Parent = nil
                        v49.back:Destroy()
                        v49.back.Parent = nil
                    end
                    local v55 = u42.hitTimeMap[u45]
                    if v55 ~= nil then
                        v55[p47] = nil
                    end
                end
            end
            for v57, v58 in p44 do
                v56(v58, v57, p44)
            end
        end
        for v60, v61 in v43 do
            v59(v61, v60, v43)
        end
    end)
end
v2.CreateController(u19.new())
return nil