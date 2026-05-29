local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ComponentUtil
local u5 = v3.SoundManager
local u6 = v3.UILayers
local u7 = v3.WatchCollectionTag
local u8 = v3.WatchComponent
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ReplicatedStorage
local u12 = v10.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "crate", "crate-altar-component").CrateAltarComponent
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "crate", "reward-crate-component").RewardCrateComponent
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u19 = v1.import(script, script.Parent, "ui", "crate-picker").CratePickerApp
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "CrateAltarController"
    end,
    ["__index"] = u13
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p23)
    p23.Name = "CrateAltarController"
    p23.altars = {}
    p23.activeCrates = {}
end
function u20.KnitStart(u24) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
        [3] = u7
        [4] = u4
        [5] = u14
        [6] = u2
        [7] = u19
        [8] = u6
        [9] = u8
        [10] = u15
        [11] = u11
        [12] = u12
        [13] = u18
        [14] = u5
        [15] = u17
    --]]
    u13.KnitStart(u24)
    local v25 = u16.Client:GetNamespace("RewardCrate")
    u7("CrateAltar", function(p26) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u14
            [3] = u24
            [4] = u2
            [5] = u19
            [6] = u6
        --]]
        local u27 = u4:waitForComponent(p26, u14)
        if not u27 then
            return nil
        end
        u24.altars[u27.attributes.id] = u27
        u27.instance.ProximityPart.ChooseCratePrompt.Triggered:Connect(function(_) --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u19
                [3] = u6
                [4] = u27
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                ["appId"] = "CratePicker",
                ["app"] = u19,
                ["layer"] = u6.MAIN
            }, {
                ["AppId"] = "CratePicker",
                ["CrateAltarId"] = u27.attributes.id
            })
        end)
    end)
    u8(u15, function(p28) --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        if p28.attributes.altarId == nil then
            return nil
        else
            local v29 = u24.activeCrates[p28.attributes.altarId]
            if v29 then
                table.insert(v29, p28)
                u24.activeCrates[p28.attributes.altarId] = v29
            else
                u24.activeCrates[p28.attributes.altarId] = { p28 }
            end
        end
    end)
    v25:Get("CrateAltarDeactivated"):Connect(function(p30) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u11
            [3] = u12
            [4] = u18
            [5] = u5
            [6] = u17
        --]]
        local u31 = u24.altars[p30.altarId]
        if u31 ~= nil then
            u31 = u31:getCratesFolder()
            if u31 ~= nil then
                u31 = u31:GetChildren()
            end
        end
        task.spawn(function() --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u11
                [3] = u12
                [4] = u18
                [5] = u5
                [6] = u17
            --]]
            local v32 = u31
            if v32 ~= nil then
                for v33, u34 in v32 do
                    local v35 = v33 - 1
                    if u34:IsA("Model") then
                        task.delay(v35 * 0.5, function() --[[ Line: 106 ]]
                            --[[
                            Upvalues:
                                [1] = u11
                                [2] = u12
                                [3] = u34
                                [4] = u18
                                [5] = u5
                                [6] = u17
                            --]]
                            local v36 = u11.Assets.Effects.DragonEmblemExplode:Clone()
                            v36.Parent = u12
                            v36.CFrame = u34:GetPivot()
                            u18:playEffects({ v36 }, nil)
                            u5:playSound(u17.KALIYAH_EXPLOSION, {
                                ["position"] = u34:GetPivot().Position
                            })
                            u34:Destroy()
                        end)
                    end
                end
            end
        end)
        u24.activeCrates[p30.altarId] = nil
    end)
    v25:Get("CrateOpened"):Connect(function(p37) --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u15
            [3] = u24
        --]]
        local _ = p37.openingPlayer
        local v38 = p37.crateModel
        local _ = p37.reward
        local v39 = u4:getComponent(v38, u15)
        if v39 then
            local v40 = v39.attributes.altarId
            if v40 ~= 0 and (v40 == v40 and v40) then
                u24:onCrateOpened(v40)
            end
        end
    end)
end
function u20.pickCrate(_, p41, p42, p43) --[[ Line: 140 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.Client:GetNamespace("RewardCrate"):Get("SpawnRewardCrate"):SendToServer({
        ["crateType"] = p41,
        ["altarId"] = p42,
        ["useAltarUpgrade"] = p43
    })
end
function u20.requestOpenCrate(p44, p45, p46) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.Client:GetNamespace("RewardCrate"):Get("OpenRewardCrate"):SendToServer({
        ["crateId"] = p45,
        ["altarId"] = p46
    })
    p44:onCrateOpened(p46)
end
function u20.onCrateOpened(p47, p48) --[[ Line: 154 ]]
    if p48 ~= 0 and (p48 == p48 and p48) then
        local v49 = p47.activeCrates[p48]
        if v49 ~= nil then
            for v50, v51 in v49 do
                local _ = v50 - 1
                local v52 = v51:getOpenCratePrompt()
                if v52 ~= nil then
                    v52:Destroy()
                end
            end
        end
    end
end
v9.CreateController(u20.new())
return nil