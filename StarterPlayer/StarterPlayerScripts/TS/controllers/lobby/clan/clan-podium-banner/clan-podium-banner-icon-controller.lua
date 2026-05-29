local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types")
local u7 = v6.CLAN_PODIUM_BANNER_ICON_IMAGE_ATTRIBUTE
local u8 = v6.CLAN_PODIUM_BANNER_ICON_TAG
local u9 = v6.CLAN_PODIUM_NAMEPLATE_TAG
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u12 = v1.import(script, script.Parent, "ui", "clan-podium-banner-icon").ClanPodiumBannerIcon
local v13 = v1.import(script, script.Parent, "ui", "clan-podium-nameplate-billboard")
local u14 = v13.ClanPodiumNameplateBillboard
local u15 = v13.getNameplateOffset
local u16 = v13.getPodiumBillboardAdornee
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "ClanPodiumBannerIconController"
    end,
    ["__index"] = u5
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
function u17.constructor(p20, ...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p20, ...)
    p20.Name = "ClanPodiumBannerIconController"
    p20.trees = {}
end
function u17.KnitStart(u21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u10
        [4] = u8
        [5] = u7
        [6] = u3
        [7] = u12
        [8] = u4
        [9] = u9
        [10] = u16
        [11] = u15
        [12] = u14
    --]]
    u5.KnitStart(u21)
    if not u11.isLobbyServer() then
        return nil
    end
    u10(u8, function(p22) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u12
            [4] = u21
        --]]
        if not p22:IsA("BasePart") then
            return nil
        end
        local v23 = p22:GetAttribute(u7)
        local v24 = v23 == nil and "" or v23
        local v25 = u3.mount(u3.createElement(u12, {
            ["Adornee"] = p22,
            ["Image"] = v24
        }), p22)
        u21.trees[p22] = v25
    end)
    u4:GetInstanceRemovedSignal(u8):Connect(function(p26) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u3
        --]]
        local v27 = u21.trees[p26]
        if v27 ~= nil then
            u3.unmount(v27)
            u21.trees[p26] = nil
        end
    end)
    u10(u9, function(p28) --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u15
            [3] = u3
            [4] = u14
            [5] = u21
        --]]
        local v29 = u16(p28)
        if not v29 then
            return nil
        end
        local v30 = {
            ["PodiumModel"] = p28,
            ["Adornee"] = v29,
            ["StudsOffsetWorldSpace"] = u15(p28, v29)
        }
        local v31 = u3.mount(u3.createElement(u14, v30), v29)
        u21.trees[p28] = v31
    end)
    u4:GetInstanceRemovedSignal(u9):Connect(function(p32) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u3
        --]]
        local v33 = u21.trees[p32]
        if v33 ~= nil then
            u3.unmount(v33)
            u21.trees[p32] = nil
        end
    end)
end
v2.CreateController(u17.new())
return nil