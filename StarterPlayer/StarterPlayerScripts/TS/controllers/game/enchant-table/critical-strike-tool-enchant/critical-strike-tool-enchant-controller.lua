local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.RandomUtil
local u5 = v3.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "CriticalStrikeToolEnchantController"
    end,
    ["__index"] = u10
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
        [1] = u10
    --]]
    u10.constructor(p17)
    p17.Name = "CriticalStrikeToolEnchantController"
end
function u14.KnitStart(u18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u12
    --]]
    u10.KnitStart(u18)
    u12.Client:Get("BreakToolCrit"):Connect(function(p19) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        u18:playBlockDestructionEffects(p19.blockPosition, p19.blockType, p19.destroyer)
    end)
end
function u14.playBlockDestructionEffects(_, p20, p21, p22) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u4
        [4] = u13
        [5] = u11
        [6] = u9
        [7] = u6
        [8] = u8
    --]]
    local v23 = u2:getWorldPosition(p20)
    u5:playSound(u4.fromList(u13.SHATTER_STRIKE_BREAK_1, u13.SHATTER_STRIKE_BREAK_2, u13.SHATTER_STRIKE_BREAK_3), {
        ["volumeMultiplier"] = 0.6,
        ["position"] = v23
    })
    if p21 ~= u11.IRON_ORE_MESH_BLOCK then
        local v24 = u2:getHandlerRegistry():getHandler(p21)
        if not v24 then
            return nil
        end
        local v25 = v24:place(p20, 0)
        v25.CanCollide = false
        v25.CanQuery = false
        v25.CastShadow = false
        v25.Parent = u9
        local v26 = Vector3.new(5, 5, 5)
        local v27 = p22.Character
        if v27 ~= nil then
            v27 = v27:GetPivot().Position
        end
        if v27 then
            local v28 = (v23 - v27).Unit
            if v28 then
                v26 = v28 * 20
            end
        end
        local v29 = false
        local v30 = 0
        while true do
            if true then
                if v29 then
                    v30 = v30 + 1
                else
                    v29 = true
                end
            end
            if v30 >= 5 then
                break
            end
            u6.Controllers.BlockDebrisController:convertBlockToDebris(v25, p21, p20, v26, v30, nil, nil, nil, nil, nil, nil, Vector3.new(0.8, 1.8, 1.2))
        end
        v25:Destroy()
    end
    local u31 = u8.Assets.Effects.ShatterStrikeHit:Clone()
    u31.Parent = u9
    u31:PivotTo(CFrame.new(v23))
    u31.Attachment.ShatterStrikeHit:Emit(1)
    task.delay(1, function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31:Destroy()
    end)
end
u6.CreateController(u14.new())
return nil