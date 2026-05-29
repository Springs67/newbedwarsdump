local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCollectionTag
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.ReplicatedStorage
local u13 = v9.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "InvisibilityPotionController"
    end,
    ["__index"] = u15
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25, ...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p25, ...)
    p25.Name = "InvisibilityPotionController"
    p25.playerJumpDustMap = {}
    p25.playerJumpMaidMap = {}
    p25.invisibilityMaids = {}
end
function u22.KnitStart(u26) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u5
        [3] = u10
        [4] = u14
        [5] = u19
        [6] = u11
        [7] = u6
        [8] = u16
        [9] = u12
        [10] = u13
        [11] = u20
        [12] = u4
        [13] = u18
        [14] = u21
        [15] = u7
        [16] = u17
    --]]
    u15.KnitStart(u26)
    u5("entity", function(u27) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u27:GetAttributeChangedSignal("Transparency"):Connect(function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u27
            --]]
            u26:removeInvisibility(u27)
            local v28 = u27:GetAttribute("Transparency")
            if v28 ~= nil and v28 > 0 then
                u26.invisibilityMaids[u27] = u26:setTransparencyOfCharacter(u27, v28)
            end
        end)
        u26:removeInvisibility(u27)
        local v29 = u27:GetAttribute("Transparency")
        if v29 ~= nil and v29 > 0 then
            u26.invisibilityMaids[u27] = u26:setTransparencyOfCharacter(u27, v29)
        end
    end)
    u10:GetInstanceRemovedSignal("entity"):Connect(function(p30) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26:removeInvisibility(p30)
    end)
    u14.StatusEffectAdded:connect(function(p31) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u11
            [3] = u6
            [4] = u16
            [5] = u26
            [6] = u12
            [7] = u13
            [8] = u20
            [9] = u4
            [10] = u18
            [11] = u21
            [12] = u7
            [13] = u17
        --]]
        if p31.statusEffect ~= u19.INVISIBILITY then
            return nil
        end
        local u32 = u11:GetPlayerFromCharacter(p31.entityInstance)
        if not u32 then
            return nil
        end
        local v33 = u32.Character
        if v33 ~= nil then
            v33 = v33:GetPivot().Position
        end
        if not v33 then
            return nil
        end
        if u6.Controllers.KitController:isUsingKit(u32, u16.SMOKE) then
            u26:playSmokePuff(p31.entityInstance)
        else
            local v34 = u12.Assets.Effects.MimicBlockEffect:Clone()
            v34.Parent = u13
            v34.Position = v33
            u20:playEffects({ v34 }, nil, {
                ["destroyAfterSec"] = 1
            })
            u4:playSound(u18.BLOCK_DISGUISE, {
                ["volumeMultiplier"] = 0.5,
                ["position"] = v33
            })
        end
        u4:playSound(u18.SMOKE_GRENADE_POP, {
            ["position"] = v33
        })
        local v35 = u32.Character
        if not v35 then
            return nil
        end
        local v36 = u12.Assets.Effects.JumpDust:Clone()
        v36.Parent = u13
        v36.CFrame = v35.RightFoot.CFrame
        v36:FindFirstChild("MeshPart").Orientation = Vector3.new(0, 0, -90)
        u21:weldParts(v36, v35.HumanoidRootPart)
        u26.playerJumpDustMap[u32] = v36
        if u32 == u11.LocalPlayer then
            local v37 = u7.new()
            u26.playerJumpMaidMap[u32] = v37
            v37:GiveTask(p31.entityInstance.Humanoid.StateChanged:Connect(function(_, p38) --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u11
                --]]
                if p38 == Enum.HumanoidStateType.Jumping then
                    u17.Client:Get("InvisiblePotionJumpStarted"):SendToServer({
                        ["player"] = u11.LocalPlayer
                    })
                end
            end))
        end
        local v39 = u13:FindFirstChild("BlockKickerBlocks")
        if v39 ~= nil then
            local v40 = v39:GetDescendants()
            local function v44(p41) --[[ Line: 127 ]]
                --[[
                Upvalues:
                    [1] = u32
                --]]
                if p41:GetAttribute("BlockOwner") == u32.UserId and p41:IsA("BasePart") then
                    p41.Transparency = 1
                    for v42, v43 in p41:GetDescendants() do
                        local _ = v42 - 1
                        if v43:IsA("Texture") then
                            v43.Transparency = 1
                        end
                    end
                end
            end
            for v45, v46 in v40 do
                v44(v46, v45 - 1, v40)
            end
        end
    end)
    u14.StatusEffectRemoved:connect(function(p47) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u11
            [3] = u6
            [4] = u16
            [5] = u26
            [6] = u12
            [7] = u13
            [8] = u20
            [9] = u4
            [10] = u18
        --]]
        if p47.statusEffect ~= u19.INVISIBILITY then
            return nil
        end
        local u48 = u11:GetPlayerFromCharacter(p47.entityInstance)
        if not u48 then
            return nil
        end
        local v49 = u48.Character
        if v49 ~= nil then
            v49 = v49:GetPivot().Position
        end
        if not v49 then
            return nil
        end
        if u6.Controllers.KitController:isUsingKit(u11.LocalPlayer, u16.SMOKE) then
            u26:playSmokePuff(p47.entityInstance)
        else
            local v50 = u12.Assets.Effects.MimicBlockEffect:Clone()
            v50.Parent = u13
            v50.Position = v49
            u20:playEffects({ v50 }, nil, {
                ["destroyAfterSec"] = 1
            })
            u4:playSound(u18.BLOCK_DISGUISE, {
                ["volumeMultiplier"] = 0.5,
                ["position"] = v49
            })
        end
        local v51 = u26.playerJumpDustMap[u48]
        if v51 ~= nil then
            v51:Destroy()
        end
        local v52 = u26.playerJumpMaidMap[u48]
        if v52 ~= nil then
            v52:DoCleaning()
        end
        local v53 = u13:FindFirstChild("BlockKickerBlocks")
        if v53 ~= nil then
            local v54 = v53:GetDescendants()
            local function v58(p55) --[[ Line: 188 ]]
                --[[
                Upvalues:
                    [1] = u48
                --]]
                if p55:GetAttribute("BlockOwner") == u48.UserId and p55:IsA("BasePart") then
                    p55.Transparency = 0
                    for v56, v57 in p55:GetDescendants() do
                        local _ = v56 - 1
                        if v57:IsA("Texture") then
                            v57.Transparency = 0
                        end
                    end
                end
            end
            for v59, v60 in v54 do
                v58(v60, v59 - 1, v54)
            end
        end
    end)
    u17.Client:OnEvent("InvisiblePotionJumpServerValidation", function(p61) --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        u26:playJumpParticle(p61.player)
    end)
end
function u22.playJumpParticle(p62, p63) --[[ Line: 211 ]]
    local v64 = p62.playerJumpDustMap[p63]
    if v64 == nil then
        return nil
    end
    for _, u65 in v64:GetDescendants() do
        if u65:IsA("ParticleEmitter") then
            u65.Enabled = true
            task.delay(0.03, function() --[[ Line: 221 ]]
                --[[
                Upvalues:
                    [1] = u65
                --]]
                u65.Enabled = false
            end)
        end
    end
end
function u22.removeInvisibility(p66, p67) --[[ Line: 227 ]]
    local v68 = p66.invisibilityMaids[p67]
    if v68 ~= nil then
        v68:DoCleaning()
    end
    p66.invisibilityMaids[p67] = nil
end
function u22.setTransparencyOfCharacter(_, u69, u70) --[[ Line: 238 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    local v71 = u7.new()
    local u72 = {}
    local u73 = {}
    local function u75(p74) --[[ Line: 242 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u72
            [3] = u70
            [4] = u73
        --]]
        if (p74:IsA("BasePart") or p74:IsA("Decal") and not p74:IsA("Texture")) and p74 ~= u69.PrimaryPart then
            u72[p74] = p74.Transparency
            p74.Transparency = u70
        elseif p74:IsA("Beam") or (p74:IsA("ParticleEmitter") or p74:IsA("Trail")) then
            u73[p74] = {
                ["effectTransparency"] = p74.Transparency,
                ["enabled"] = p74.Enabled
            }
            p74.Enabled = false
            p74.Transparency = NumberSequence.new(1)
        end
    end
    for _, v76 in u69:GetDescendants() do
        u75(v76)
    end
    v71:GiveTask(u69.DescendantAdded:Connect(function(p77) --[[ Line: 262 ]]
        --[[
        Upvalues:
            [1] = u75
        --]]
        u75(p77)
    end))
    v71:GiveTask(function() --[[ Line: 265 ]]
        --[[
        Upvalues:
            [1] = u72
            [2] = u73
            [3] = u6
        --]]
        for v78, v79 in u72 do
            v78.Transparency = v79
        end
        for v80, v81 in u73 do
            if u6.Controllers.CameraPerspectiveController:getCameraPerspective() ~= 0 or not v80:HasTag("FirstPersonHidden") then
                v80.Enabled = v81.enabled
                v80.Transparency = v81.effectTransparency
            end
        end
    end)
    return v71
end
function u22.playSmokePuff(_, p82) --[[ Line: 280 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u8
        [4] = u3
        [5] = u20
    --]]
    local v83 = u12.Assets.Effects.SmokePuff:Clone()
    local v84 = {}
    local v85 = p82.PrimaryPart
    if v85 ~= nil then
        v85 = v85.CFrame
    end
    v84.CFrame = v85
    v84.Anchored = true
    v84.CanQuery = false
    v84.CanCollide = false
    v84.Transparency = 1
    v84.Parent = u13
    local u86 = u8("Part", v84)
    u3:setQueryIgnored(u86, true)
    v83.Parent = u86
    u20:playEffects({ v83 }, p82)
    task.delay(5, function() --[[ Line: 298 ]]
        --[[
        Upvalues:
            [1] = u86
        --]]
        u86:Destroy()
    end)
end
u6.CreateController(u22.new())
return nil