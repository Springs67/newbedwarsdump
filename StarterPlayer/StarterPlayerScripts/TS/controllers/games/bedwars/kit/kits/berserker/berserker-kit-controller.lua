local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "berserker", "berserker-kit-balance").BerserkerKitBalance
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u26 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u27 = u1.import(script, script.Parent, "ui", "berserker-kb-stacks-ui").BerserkerKBStacksUI
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "BerserkerKitController"
    end,
    ["__index"] = u26
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u20
        [3] = u24
        [4] = u18
        [5] = u13
        [6] = u22
    --]]
    u26.constructor(p31, u20.BERSERKER, {
        ["sounds"] = { u24.BERSERKER_KIT_ACTIVATE, u24.BERSERKER_KIT_LOOP },
        ["animations"] = { u18.FROSTY_SHIELD_SUMMON },
        ["instances"] = { u13.Assets.Effects.BerserkerRageEffect },
        ["imageIds"] = { u22.BERSERKER_KIT_ABILITY }
    })
    p31.Name = "BerserkerKitController"
end
function u28.KnitStart(p32) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    u26.KnitStart(p32)
end
function u28.onKitLocalActivated(p33, _) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u23
    --]]
    u16:dispatch({
        ["type"] = "BedwarsAddItemPurchased",
        ["itemType"] = u23.WOOD_AXE
    })
    p33:setUpTree()
end
function u28.onKitLocalDeactivated(p34) --[[ Line: 62 ]]
    p34:unmountTree()
end
function u28.onKitReplicationActivated(_, _) --[[ Line: 65 ]] end
function u28.onKitReplicationDeactivated(_) --[[ Line: 67 ]] end
function u28.onInnateAbilityEnabled(_, _, _) --[[ Line: 69 ]] end
function u28.onAbilityUsed(u35, p36, p37) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u12
    --]]
    if p37.ability ~= u17.BERSERKER_RAGE then
        return nil
    end
    local u38 = u12:GetPlayerFromCharacter(p36)
    if not u38 then
        return nil
    end
    task.spawn(function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u38
        --]]
        u35:activateRageLogic(u38)
    end)
    task.spawn(function() --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u38
        --]]
        u35:activateRageEffects(u38)
    end)
end
function u28.activateRageLogic(_, p39) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u5
        [4] = u20
        [5] = u21
        [6] = u15
    --]]
    local u40 = u8.new()
    u40:GiveTask(u2:getBlockDamageHook():connect(function(p41) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u20
            [3] = u21
        --]]
        if not u5.Controllers.KitController:isUsingKit(p41.player, u20.BERSERKER) then
            return nil
        end
        p41.damage = p41.damage * u21.RageBlockDamageBuff
    end))
    local v42 = u15.BuffDurationModifierCheck:fire(u21.RageDuration).duration
    task.delay(v42, function() --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        u40:DoCleaning()
    end)
    local v43 = p39.Character
    if v43 ~= nil then
        v43.Destroying:Connect(function() --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            u40:DoCleaning()
        end)
    end
end
u28.highlightBeds = u1.async(function(p44) --[[ Line: 106 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u12
        [4] = u9
    --]]
    local u45 = u8.new()
    local v46 = u6.Controllers.TeamController:getPlayerTeam(u12.LocalPlayer)
    if not v46 then
        p44.logger:Info("No local player team")
        return u45
    end
    local v47 = 0
    local v48 = {}
    for v49, v50 in u6.Controllers.BedwarsController:getAllBeds() do
        local _ = v49 - 1
        if not v50:HasTag("bed:" .. v46.id) == true then
            v47 = v47 + 1
            v48[v47] = v50
        end
    end
    local v51 = 0
    local v52 = {}
    for v53, v54 in v48 do
        local _ = v53 - 1
        local v55 = v54:WaitForChild("Bed", 3)
        if v55 ~= nil then
            v51 = v51 + 1
            v52[v51] = v55
        end
    end
    if #v52 == 0 then
        p44.logger:Info("No enemy team beds")
        return u45
    end
    local function v57(p56) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u45
        --]]
        u45:GiveTask((u9("Highlight", {
            ["FillTransparency"] = 0.5,
            ["OutlineTransparency"] = 0,
            ["Parent"] = p56,
            ["OutlineColor"] = Color3.fromRGB(255, 69, 105),
            ["FillColor"] = Color3.fromRGB(255, 69, 105),
            ["DepthMode"] = Enum.HighlightDepthMode.AlwaysOnTop
        })))
    end
    for v58, v59 in v52 do
        v57(v59, v58 - 1, v52)
    end
    return u45
end)
function u28.activateRageEffects(u60, u61) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u1
        [4] = u13
        [5] = u25
        [6] = u21
        [7] = u19
        [8] = u18
        [9] = u3
        [10] = u24
        [11] = u14
        [12] = u7
        [13] = u15
    --]]
    if not u61.Character then
        return nil
    end
    local u62 = u8.new()
    if u61 == u12.LocalPlayer then
        task.spawn(u1.async(function() --[[ Line: 169 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u60
                [3] = u62
            --]]
            local v63 = u1.await(u60:highlightBeds())
            if u62 then
                u62:GiveTask(v63)
            else
                v63:DoCleaning()
            end
        end))
    end
    local u64 = u13.Assets.Effects.BerserkerRageEffect:Clone()
    u62:GiveTask(u64)
    u64.Parent = u61.Character
    u25:weldAccessory(u61.Character, u64)
    local v65 = u64:GetDescendants()
    local function v68(u66) --[[ Line: 183 ]]
        --[[
        Upvalues:
            [1] = u62
            [2] = u61
            [3] = u21
        --]]
        if u66:IsA("MeshPart") then
            u62:GiveTask(u61:GetAttributeChangedSignal(u21.KBStacksAttribute):Connect(function() --[[ Line: 185 ]]
                --[[
                Upvalues:
                    [1] = u61
                    [2] = u21
                    [3] = u66
                --]]
                local v67 = u61:GetAttribute(u21.KBStacksAttribute)
                if (v67 == 0 or (v67 ~= v67 or (v67 == "" or not v67))) and u66.Parent ~= nil then
                    u66.Transparency = 1
                end
            end))
        end
    end
    for v69, v70 in v65 do
        v68(v70, v69 - 1, v65)
    end
    local u71 = u19:playAnimation(u61.Character, u18.FROSTY_SHIELD_SUMMON, {
        ["speed"] = 2
    })
    u62:GiveTask(function() --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u71
        --]]
        if u71 then
            u71:Destroy()
        end
    end)
    local v72 = u3
    local v73 = u24.BERSERKER_KIT_ACTIVATE
    local v74 = {}
    local v75
    if u61 == u12.LocalPlayer then
        v75 = nil
    else
        v75 = u61.Character:GetPivot().Position
    end
    v74.position = v75
    local u76 = v72:playSound(v73, v74)
    u62:GiveTask(function() --[[ Line: 209 ]]
        --[[
        Upvalues:
            [1] = u76
        --]]
        u76:Destroy()
    end)
    if u61 == u12.LocalPlayer then
        u62:GiveTask((u3:playSound(u24.BERSERKER_KIT_LOOP, {
            ["position"] = nil,
            ["volumeMultiplier"] = 0.7,
            ["looped"] = true
        })))
    end
    local function u83() --[[ Line: 220 ]]
        --[[
        Upvalues:
            [1] = u64
            [2] = u14
            [3] = u7
            [4] = u62
        --]]
        local v77 = u64:GetDescendants()
        local function v80(u78) --[[ Line: 222 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u7
            --]]
            if u78:IsA("ParticleEmitter") or u78:IsA("MeshPart") then
                task.spawn(function() --[[ Line: 224 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u7
                        [3] = u78
                    --]]
                    u14(1, u7, function(p79) --[[ Line: 225 ]]
                        --[[
                        Upvalues:
                            [1] = u78
                        --]]
                        u78.LocalTransparencyModifier = p79
                    end, 0, 1):Play()
                end)
                if u78:IsA("ParticleEmitter") then
                    u78.Enabled = false
                end
            end
        end
        for v81, v82 in v77 do
            v80(v82, v81 - 1, v77)
        end
        task.wait(1)
        u62:DoCleaning()
    end
    local v84 = u15.BuffDurationModifierCheck:fire(u21.RageDuration).duration
    task.delay(v84, function() --[[ Line: 241 ]]
        --[[
        Upvalues:
            [1] = u83
        --]]
        u83()
    end)
    u61.Character.Destroying:Connect(function() --[[ Line: 244 ]]
        --[[
        Upvalues:
            [1] = u83
        --]]
        u83()
    end)
end
function u28.setUpTree(u85) --[[ Line: 248 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u21
        [3] = u5
        [4] = u10
        [5] = u27
    --]]
    u85:unmountTree()
    if not u85.stackTree then
        local v86 = {
            ["stacks"] = u12.LocalPlayer:GetAttribute(u21.KBStacksAttribute)
        }
        u85.stackTree = u5.Controllers.StatusInfoListController:waitForSetupAddElement(u10.createElement(u27, v86))
    end
    u12.LocalPlayer:GetAttributeChangedSignal(u21.KBStacksAttribute):Connect(function() --[[ Line: 256 ]]
        --[[
        Upvalues:
            [1] = u85
        --]]
        u85:updateTree()
    end)
end
function u28.updateTree(p87) --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u21
        [3] = u10
        [4] = u27
    --]]
    if p87.stackTree then
        local v88 = {
            ["stacks"] = u12.LocalPlayer:GetAttribute(u21.KBStacksAttribute)
        }
        u10.update(p87.stackTree, u10.createElement(u27, v88))
    end
end
function u28.unmountTree(p89) --[[ Line: 268 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    if p89.stackTree then
        u10.unmount(p89.stackTree)
        p89.stackTree = nil
    end
end
u5.CreateController(u28.new())
return nil