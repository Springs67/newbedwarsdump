local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.SoundManager
local u5 = v2.TopBarCard
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.TweenService
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v41 = v7.new(u6)(function(p19, p20) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u11
        [4] = u3
        [5] = u12
        [6] = u17
        [7] = u10
        [8] = u4
        [9] = u18
        [10] = u5
        [11] = u14
    --]]
    local _ = p20.useState
    local v21 = p20.useEffect
    local v22 = u6.createRef()
    u6.createRef()
    local u23 = u6.createRef()
    local v24 = p19.BedStatus == u13.BedStatus.BED_BROKEN
    local v25 = p19.BedStatus == u13.BedStatus.BED_PLATING_ACTIVE
    local v26 = v24 and 0 or p19.BedHealth / p19.MaxBedHealth
    local v27 = v26 * 100
    local v28 = math.floor(v27)
    local _ = p19.PlatingHealth / p19.MaxPlatingHealth
    local v29
    if v26 <= 0.5 then
        v29 = Color3.fromRGB(255, 30, 30):Lerp(Color3.fromRGB(255, 255, 30), v26 * 2)
    else
        v29 = Color3.fromRGB(255, 255, 30):Lerp(Color3.fromRGB(30, 255, 30), v26 * 2)
    end
    v21(function() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u23
            [3] = u3
            [4] = u12
            [5] = u17
            [6] = u10
            [7] = u4
            [8] = u18
        --]]
        local u30 = u11:Create(u23:getValue(), TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
            ["Size"] = UDim2.new(0, 16.8, 0, 16.8)
        })
        local u31 = u11:Create(u23:getValue(), TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
            ["Size"] = UDim2.new(0, 21, 0, 21)
        })
        if not u3.isHoarceKat() then
            u12.BedDamaged:connect(function(p32) --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u10
                    [3] = u30
                    [4] = u31
                    [5] = u4
                    [6] = u18
                --]]
                if u17.getGamePlayer(u10.LocalPlayer):getTeamId() == p32.teamId and not p32.platingDamaged then
                    u30:Cancel()
                    u31:Cancel()
                    u30:Play()
                    u30.Completed:Once(function() --[[ Line: 48 ]]
                        --[[
                        Upvalues:
                            [1] = u31
                        --]]
                        u31:Play()
                    end)
                    u4:playSound(u18.BED_DAMAGED_ALERT)
                    u4:playSound(u18.BED_DAMAGED_ALERT_OVERLAY)
                end
            end)
        end
    end, {})
    local v33 = u6.createElement
    local v34 = u5
    local v35 = {
        [u6.Ref] = v22,
        ["Size"] = UDim2.new(0, 0, 0, 32),
        ["Visible"] = not v24
    }
    local v36 = {}
    local v37 = u6.createElement
    local v38 = "ImageLabel"
    local v39 = {
        [u6.Ref] = u23
    }
    local v40
    if v25 then
        v40 = u14.BED_PLATING_ACTIVE_ICON
    else
        v40 = u14.BED_ALIVE_ICON
    end
    v39.Image = v40
    v39.Size = UDim2.new(0, 21, 0, 21)
    v39.AnchorPoint = Vector2.new(0.5, 0.5)
    v39.ScaleType = Enum.ScaleType.Fit
    v39.BackgroundTransparency = 1
    v39.BorderSizePixel = 0
    __set_list(v36, 1, {v37(v38, v39), u6.createElement("TextLabel", {
    ["BackgroundTransparency"] = 1,
    ["BorderSizePixel"] = 0,
    ["TextSize"] = 16,
    ["Text"] = tostring(v28) .. "%",
    ["AutomaticSize"] = Enum.AutomaticSize.X,
    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
    ["TextXAlignment"] = Enum.TextXAlignment.Left,
    ["TextColor3"] = v29
})})
    return v33(v34, v35, v36)
end)
return {
    ["HudBedHealth"] = v8.connect(function(p42, p43) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u17
            [3] = u10
            [4] = u15
            [5] = u16
        --]]
        local v44
        if u3.isHoarceKat() then
            v44 = "1"
        else
            local v45 = u17.getGamePlayer(u10.LocalPlayer):getTeamId()
            v44 = v45 == nil and "" or v45
        end
        local v46 = p42.Bedwars.bedHealth[v44]
        local v47 = p42.Bedwars.bedPlatingHealth[v44]
        local v48 = p42.Bedwars.teamBedStatus[v44]
        local v49 = {}
        for v50, v51 in p43 do
            v49[v50] = v51
        end
        v49.BedStatus = v48
        local v52
        if v46 == nil then
            v52 = v46
        else
            v52 = v46.maxHealth
        end
        if v52 == nil then
            local v53 = u15(u16.BED).block
            if v53 ~= nil then
                v53 = v53.health
            end
            v52 = v53 == nil and 24 or v53
        end
        v49.MaxBedHealth = v52
        if v46 ~= nil then
            v46 = v46.health
        end
        if v46 == nil then
            local v54 = u15(u16.BED).block
            if v54 ~= nil then
                v54 = v54.health
            end
            v46 = v54 == nil and 24 or v54
        end
        v49.BedHealth = v46
        local v55
        if v47 == nil then
            v55 = v47
        else
            v55 = v47.maxHealth
        end
        v49.MaxPlatingHealth = v55 == nil and 0 or v55
        if v47 ~= nil then
            v47 = v47.health
        end
        v49.PlatingHealth = v47 == nil and 0 or v47
        return v49
    end)(v41)
}