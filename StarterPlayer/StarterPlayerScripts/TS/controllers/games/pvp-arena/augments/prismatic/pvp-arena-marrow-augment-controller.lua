local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "skeleton", "skeleton-kit-balance").SkeletonKitBalance
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "PvPArenaMarrowAugmentController"
    end,
    ["__index"] = u16
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u13
        [3] = u6
    --]]
    u16.constructor(p20, u13.MARROW)
    p20.Name = "PvPArenaMarrowAugmentController"
    p20.poisonStatusMaid = u6.new()
end
function u17.onGameInit(u21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u10
        [4] = u9
        [5] = u8
        [6] = u12
        [7] = u5
    --]]
    u16.onGameInit(u21)
    u15.Client:Get("SkeletonKit_SpawnPoisonCloud"):Connect(function(p22) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u9
        --]]
        local v23 = p22.endServerTime - u10:GetServerTimeNow()
        if v23 <= 0 then
            return nil
        end
        local u24 = u9.Assets.Effects.SkeletonKit_Smoke:Clone()
        u24:PivotTo(CFrame.new(p22.position))
        u24.Parent = u10
        u24.Smoke:Emit(10)
        task.delay(v23, function() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:Destroy()
        end)
    end)
    u15.Client:Get("SkeletonKit_PlayerEnteredPoisonCloud"):Connect(function(p25) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u21
            [3] = u12
            [4] = u5
        --]]
        if p25.player ~= u8.LocalPlayer then
            return nil
        end
        u21.poisonStatusMaid:DoCleaning()
        if u12.PoisonDisablesJump then
            u21.poisonStatusMaid:GiveTask(u5.Controllers.JumpHeightController:getJumpModifier():addModifier({
                ["jumpHeightMultiplier"] = 0,
                ["airJumps"] = 0
            }))
        end
        if u12.PoisonDisablesSprint or u12.PoisonMoveSpeedMultiplier ~= 1 then
            u21.poisonStatusMaid:GiveTask(u5.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["blockSprint"] = u12.PoisonDisablesSprint,
                ["moveSpeedMultiplier"] = u12.PoisonMoveSpeedMultiplier
            }))
        end
    end)
    u15.Client:Get("SkeletonKit_PlayerExitedPoisonCloud"):Connect(function(p26) --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u21
        --]]
        if p26.player ~= u8.LocalPlayer then
            return nil
        end
        u21.poisonStatusMaid:DoCleaning()
    end)
end
function u17.onActivated(_) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u2
        [4] = u14
    --]]
    u4.Controllers.PvpArenaAugmentAbilityController:registerAbilities({ u11.SKELETON_ABILITY })
    local v27 = u4.Controllers.PvpArenaAugmentAbilityController:getAbilityType(u11.SKELETON_ABILITY)
    if not v27 then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u11.SKELETON_ABILITY)
    local v28 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v29 = u11.SKELETON_ABILITY
    local v30 = {
        ["abilityType"] = v27,
        ["abilityButton"] = {
            ["icon"] = u14.SKELETON_KIT_ABILITY_ICON
        }
    }
    v28:enableAbility(v29, v30)
end
u4.CreateController(u17.new())
return nil