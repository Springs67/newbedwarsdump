local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u9 = Color3.fromRGB(255, 77, 77)
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "BedwarsBlockHighlighter"
    end,
    ["__index"] = u6
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p13)
    p13.Name = "BedwarsBlockHighlighter"
end
function u10.KnitStart(p14) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u7
        [4] = u4
        [5] = u2
        [6] = u5
        [7] = u9
        [8] = u8
    --]]
    u6.KnitStart(p14)
    u3.BeforeHighlightBlock:connect(function(p15) --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u2
            [4] = u5
            [5] = u9
            [6] = u8
        --]]
        local v16 = u7:getLocalPlayerEntity()
        if not v16 then
            return nil
        end
        if v16 ~= nil then
            v16 = v16:getHandItemInstanceFromCharacter()
        end
        if not v16 then
            return nil
        end
        if u4.Controllers.BlockBreakController:isBlockBreakEnabled() and (p15.mouseInfo.target and not u2:isBlockBreakable(p15.mouseInfo.target.blockRef, u5.LocalPlayer)) then
            p15:setHighlightColor(u9)
            return nil
        end
        if u4.Controllers.MapController:isInDenyRegion(p15.mouseInfo.placementPosition) or u4.Controllers.MapController:isOutOfBounds(p15.mouseInfo.placementPosition) then
            p15:setHighlightColor(u9)
            return nil
        end
        if p15.mouseInfo.target then
            local v17 = p15.mouseInfo.target.blockInstance.Name
            local v18 = u8(v16.Name).block
            if v18 ~= nil then
                v18 = v18.denyPlaceOnBlockTypes
            end
            if v18 and table.find(v18, v17) ~= nil then
                p15:setCancelled(true)
                return nil
            end
        end
    end)
end
u4.CreateController(u10.new())
return nil