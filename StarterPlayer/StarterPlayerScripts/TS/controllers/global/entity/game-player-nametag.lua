local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u12 = u1.import(script, script.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar").StatefulEntityHpBar
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "nametag", "nametag-config").NametagConfig
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local v69 = v9.new(u8)(function(u20, p21) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u6
        [4] = u17
        [5] = u11
        [6] = u4
        [7] = u16
        [8] = u14
        [9] = u1
        [10] = u13
        [11] = u19
        [12] = u18
        [13] = u15
        [14] = u5
        [15] = u3
        [16] = u12
    --]]
    local v22 = p21.useState
    local v23 = p21.useEffect
    local v24, u25 = v22(u20.EntityInstance.Name)
    local v26, u27 = v22(nil)
    local v28, u29 = v22(false)
    local u30 = u8.createRef()
    local v31 = (u20.EggCount == nil or u20.EggCount == 0) and 0 or u20.EggCount
    v23(function() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u6
            [3] = u17
            [4] = u29
            [5] = u30
            [6] = u11
            [7] = u20
            [8] = u4
            [9] = u16
            [10] = u27
            [11] = u14
            [12] = u1
            [13] = u13
            [14] = u19
            [15] = u25
            [16] = u18
        --]]
        local u32 = u7.new()
        local _, v33 = u6.Controllers.MatchController:getQueueTypeAsync():await()
        if v33 == u17.EGG_HUNT then
            u29(true)
        end
        local u34 = u30:getValue()
        if u34 then
            u11:AddTag(u34, "EntityNameTag")
            u34.Adornee = u20.EntityInstance.Head
            u32:GiveTask(u20.EntityInstance:GetAttributeChangedSignal("NametagStudsOffsetWorldSpace"):Connect(function() --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u34
                --]]
                local v35 = u20.EntityInstance:GetAttribute("NametagStudsOffsetWorldSpace")
                if v35 then
                    u34.StudsOffsetWorldSpace = v35
                end
            end))
        end
        if not u4.isHoarceKat() then
            local u36 = u20.EntityInstance:GetAttribute("Team")
            u6.Controllers.MatchController:getQueueTypeAsync():andThen(function(p37) --[[ Line: 54 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u36
                    [3] = u27
                --]]
                local v38 = nil
                for v39, v40 in u16(p37).teams do
                    local _ = v39 - 1
                    local v41 = v40.id
                    local v42 = u36
                    if tonumber(v41) == tonumber(v42) == true then
                        v38 = v40
                        break
                    end
                end
                if v38 then
                    u27(v38)
                end
            end)
        end
        u32:GiveTask(u20.EntityInstance:GetAttributeChangedSignal("Team"):Connect(function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u6
                [3] = u16
                [4] = u27
            --]]
            local u43 = u20.EntityInstance:GetAttribute("Team")
            u6.Controllers.MatchController:getQueueTypeAsync():andThen(function(p44) --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u43
                    [3] = u27
                --]]
                local v45 = nil
                for v46, v47 in u16(p44).teams do
                    local _ = v46 - 1
                    local v48 = v47.id
                    local v49 = u43
                    if tonumber(v48) == tonumber(v49) == true then
                        v45 = v47
                        break
                    end
                end
                if v45 then
                    u27(v45)
                end
            end)
        end))
        local v50 = u14:getEntity(u20.EntityInstance)
        if u1.instanceof(v50, u13) then
            local v51 = v50:getPlayer()
            local u52 = u19.getGamePlayer(v51)
            u25(u52:getDisplayName())
            v51:GetAttributeChangedSignal("DisguiseDisplayName"):Connect(function(_) --[[ Line: 107 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u52
                --]]
                u25(u52:getDisplayName())
            end)
        end
        local v53 = u20.EntityInstance:GetAttribute("KitEntityType")
        if v53 ~= nil then
            u25(u18[v53].name)
        end
        local v54 = u20.EntityInstance:GetAttribute("CustomEntityName")
        if v54 ~= "" and v54 then
            u25(v54)
        end
        u32:GiveTask(u20.EntityInstance:GetAttributeChangedSignal("CustomEntityName"):Connect(function() --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u25
            --]]
            local v55 = u20.EntityInstance:GetAttribute("CustomEntityName")
            if v55 ~= "" and v55 then
                u25(v55)
            end
        end))
        return function() --[[ Line: 126 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            u32:DoCleaning()
        end
    end, {})
    local v56 = {
        ["Adornee"] = u20.EntityInstance:FindFirstChild("Head") or u20.EntityInstance,
        ["Size"] = UDim2.fromScale(5, 0.65),
        ["StudsOffsetWorldSpace"] = Vector3.new(0, 1.6, 0),
        ["AlwaysOnTop"] = true,
        ["MaxDistance"] = u15.BillboardMaxDistanceGame,
        ["ResetOnSpawn"] = false,
        ["AutoLocalize"] = false,
        [u8.Ref] = u30
    }
    local v57 = {}
    local v58 = #v57
    if v28 then
        local v59 = u8.createFragment
        local v60 = {
            ["EggCount"] = u8.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["AutoLocalize"] = false,
                ["TextXAlignment"] = "Center",
                ["Text"] = v31 == 1 and "1 EGG" or tostring(v31) .. " EGGS",
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Position"] = UDim2.fromScale(0.5, -0.03),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Font"] = Enum.Font.LuckiestGuy
            }, { u8.createElement("UIStroke", {
                    ["Color"] = Color3.fromRGB(0, 0, 0)
                }) })
        }
        v28 = v59(v60)
    end
    if v28 then
        v57[v58 + 1] = v28
    end
    local _ = #v57
    v57.DisplayNameContainer = u8.createElement(u5, {
        ["Size"] = UDim2.fromScale(1, 0.46)
    }, {
        ["DisplayName"] = u8.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["AutoLocalize"] = false,
            ["TextXAlignment"] = "Center",
            ["Text"] = v24,
            ["Size"] = UDim2.fromScale(1, 1),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
        }, { u8.createElement("UIStroke", {
                ["Color"] = Color3.fromRGB(0, 0, 0)
            }) })
    })
    local v61 = u8.createElement
    local v62 = u5
    local v63 = {
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["Size"] = UDim2.fromScale(1, 0.5)
    }
    local v64 = {}
    local v65 = u8.createElement
    local v66 = "Frame"
    local v67 = {
        ["SizeConstraint"] = "RelativeYY",
        ["Size"] = UDim2.fromScale(1.25, 1.25),
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["AnchorPoint"] = Vector2.new(0, 0.5)
    }
    local v68
    if v26 then
        v68 = u3.hexColor(v26.colorHex)
    else
        v68 = nil
    end
    v67.BackgroundColor3 = v68
    v67.BackgroundTransparency = v26 and 0 or 1
    v64.MatchLevelBox = v65(v66, v67, { u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }), u8.createElement("UIStroke", {
            ["Thickness"] = 1,
            ["Color"] = Color3.fromRGB(0, 0, 0)
        }) })
    __set_list(v64, 1, {u8.createElement(u12, {
    ["size"] = UDim2.fromScale(0.8, 1),
    ["anchorPoint"] = Vector2.new(0.5, 0.5),
    ["position"] = UDim2.fromScale(0.5, 0.5),
    ["gameEntity"] = u20.EntityInstance,
    ["serverInstance"] = u20.EntityInstance,
    ["AppId"] = "StatefulEntityHpBar_" .. u20.EntityInstance.Name
})})
    v57.EntityStateInfo = v61(v62, v63, v64)
    return u8.createFragment({
        ["Nametag"] = u8.createElement("BillboardGui", v56, v57)
    })
end)
return {
    ["GamePlayerNametag"] = v10.connect(function(p70, p71) --[[ Line: 218 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u1
            [3] = u13
        --]]
        local v72 = u14:getEntity(p71.EntityInstance)
        local v73
        if u1.instanceof(v72, u13) then
            v73 = p70.Game.eggCountMap[v72:getPlayer().UserId]
        else
            v73 = nil
        end
        local v74 = {}
        for v75, v76 in p71 do
            v74[v75] = v76
        end
        v74.EggCount = v73
        v74.LocalPlayerTeam = p70.Game.myTeam
        return v74
    end)(v69)
}