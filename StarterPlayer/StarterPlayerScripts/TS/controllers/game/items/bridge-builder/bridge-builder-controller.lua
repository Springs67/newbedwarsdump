local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u3 = v2.BlockEngine
local u4 = v2.GreedyBlockHandler
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u6 = v5.RandomUtil
local u7 = v5.SoundManager
local u8 = v5.WatchCharacter
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutSine
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Workspace
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "builder", "builder-constants").BridgeState
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = {
    [u19.EXTENDED] = { u21.BRIDGE_EXPAND_1, u21.BRIDGE_EXPAND_2, u21.BRIDGE_EXPAND_3 },
    [u19.RETRACTED] = { u21.BRIDGE_RETRACT_1, u21.BRIDGE_RETRACT_2, u21.BRIDGE_RETRACT_3 }
}
local u23 = {
    [u19.EXTENDED] = { u21.NUTCRACKER_BUILDER_BRIDGE_EXPAND_1, u21.NUTCRACKER_BUILDER_BRIDGE_EXPAND_2, u21.NUTCRACKER_BUILDER_BRIDGE_EXPAND_3 },
    [u19.RETRACTED] = { u21.NUTCRACKER_BUILDER_BRIDGE_RETRACT_1, u21.NUTCRACKER_BUILDER_BRIDGE_RETRACT_2, u21.NUTCRACKER_BUILDER_BRIDGE_RETRACT_3 }
}
TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 1, true)
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 44 ]]
        return "BridgeBuilderController"
    end,
    ["__index"] = u15
})
u24.__index = u24
function u24.new(...) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p27)
    p27.Name = "BridgeBuilderController"
end
function u24.KnitStart(u28) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u9
        [3] = u18
        [4] = u22
        [5] = u19
        [6] = u21
        [7] = u8
        [8] = u17
        [9] = u23
        [10] = u20
        [11] = u12
    --]]
    u15.KnitStart(u28)
    local v29 = u9.Controllers.PreloadController
    local v30 = u18.DRAWBRIDGE
    local v31 = {}
    local v32 = {}
    local v33 = #v32
    local v34 = u22[u19.EXTENDED]
    local v35 = #v34
    table.move(v34, 1, v35, v33 + 1, v32)
    local v36 = v33 + v35
    local v37 = u22[u19.RETRACTED]
    local v38 = #v37
    table.move(v37, 1, v38, v36 + 1, v32)
    local v39 = v36 + v38
    v32[v39 + 1] = u21.BRIDGE_DESTROY_1
    v32[v39 + 2] = u21.BRIDGE_DESTROY_2
    v32[v39 + 3] = u21.BRIDGE_DESTROY_3
    v31.sounds = v32
    v29:preloadForItemType(v30, v31)
    u8(function(_, p40) --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u17
            [3] = u18
            [4] = u23
            [5] = u19
            [6] = u21
        --]]
        if u9.Controllers.KitController:getKitSkin(p40) == u17.NUTCRACKER_BUILDER then
            local v41 = u9.Controllers.PreloadController
            local v42 = u18.DRAWBRIDGE
            local v43 = {}
            local v44 = {}
            local v45 = #v44
            local v46 = u23[u19.EXTENDED]
            local v47 = #v46
            table.move(v46, 1, v47, v45 + 1, v44)
            local v48 = v45 + v47
            local v49 = u23[u19.RETRACTED]
            local v50 = #v49
            table.move(v49, 1, v50, v48 + 1, v44)
            local v51 = v48 + v50
            v44[v51 + 1] = u21.NUTCRACKER_BUILDER_BRIDGE_DESTROY_1
            v44[v51 + 2] = u21.NUTCRACKER_BUILDER_BRIDGE_DESTROY_2
            v44[v51 + 3] = u21.NUTCRACKER_BUILDER_BRIDGE_DESTROY_3
            v43.sounds = v44
            v41:preloadForItemType(v42, v43)
        end
    end)
    u20.Client:WaitFor("BridgeStateUpdate"):expect():Connect(function(p52) --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        return u28:handleBridgeStateUpdate(p52.state, p52.position, p52.skin)
    end)
    u12:GetInstanceAddedSignal("scaffold"):Connect(function(p53) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28:handleBridgeBlockAdded(p53)
    end)
end
function u24.handleBridgeStateUpdate(p54, p55, p56, p57) --[[ Line: 113 ]]
    p54:playBridgeSound(p55, p56, p57)
end
function u24.playBridgeSound(_, p58, p59, p60) --[[ Line: 116 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u23
        [3] = u22
        [4] = u6
        [5] = u7
    --]]
    local v61
    if p60 == u17.NUTCRACKER_BUILDER then
        v61 = u23
    else
        v61 = u22
    end
    local v62 = u6.fromList
    local v63 = v61[p58]
    u7:playSound(v62(unpack(v63)), {
        ["rollOffMaxDistance"] = 100,
        ["position"] = p59
    })
end
function u24.handleBridgeBlockAdded(p64, p65) --[[ Line: 124 ]]
    p64:playBridgeBlockAddedEffect(p65)
end
function u24.playBridgeBlockAddedEffect(_, p66) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u3
        [3] = u18
        [4] = u13
        [5] = u16
        [6] = u14
        [7] = u10
        [8] = u1
        [9] = u4
    --]]
    if u12:HasTag(p66, "falling-block") then
        return nil
    end
    local u67 = u3:getHandlerRegistry():getHandler(u18.SCAFFOLD)
    local u68 = u67:place(u3:getBlockPosition(p66.Position), 0)
    u68.Parent = u13
    local u69 = u68.Size / u16
    local u71 = u14(0.1, u10, function(p70) --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u67
            [3] = u4
            [4] = u68
            [5] = u69
        --]]
        if u1.instanceof(u67, u4) then
            u67:resize(u68, u69 * (1.1 * p70))
        end
    end)
    task.spawn(function() --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u71
            [2] = u68
        --]]
        u71:Wait()
        u68:Destroy()
    end)
end
u9.CreateController(u24.new())
return nil