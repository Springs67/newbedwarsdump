local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent, "lobby", "locker", "ui", "locker-app").LockerApp
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "LockerController"
    end,
    ["__index"] = u7
})
u12.__index = u12
function u12.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
    --]]
    u7.constructor(p15)
    p15.Name = "LockerController"
    p15.namespace = u11.Client:GetNamespace("Locker")
    p15.sentEquippedRequest = {}
    p15.sentOwnedItemsRequest = {}
    p15.isLockerItemOwnedRequestSent = {}
end
function u12.KnitStart(p16) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    p16.namespace:WaitFor("FullLockerUpdate"):andThen(function(p17) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        p17:Connect(function(p18) --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8:dispatch({
                ["type"] = "LockerUpdateAll",
                ["locker"] = p18.locker
            })
        end)
    end)
    p16.namespace:WaitFor("NewLockerItems"):andThen(function(p19) --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        p19:Connect(function(p20) --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8:dispatch({
                ["type"] = "LockerAddOwnedItems",
                ["items"] = p20
            })
        end)
    end)
end
function u12.openLockerWithTab(_, p21) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
        [3] = u6
        [4] = u3
    --]]
    if not u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u9.LOCKER) then
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            ["appId"] = u9.LOCKER,
            ["app"] = u6,
            ["layer"] = u3.MAIN
        }, {
            ["InitialTab"] = p21
        })
    end
end
function u12.getLockerCategoryItems(p22, p23) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
    --]]
    if p22.sentOwnedItemsRequest[p23] == nil then
        p22.sentOwnedItemsRequest[p23] = true
        local v24 = p22.namespace:Get("GetLockerCategoryItems"):CallServer(p23)
        local v25 = {
            ["type"] = "LockerSetOwnedItems",
            ["items"] = {
                [p23] = v24
            }
        }
        u8:dispatch(v25)
        return v24
    end
    if p23 == u10.EMOTE then
        return u8:getState().Locker.emotes
    end
    if p23 == u10.BED_BREAK_EFFECT then
        return u8:getState().Locker.breakBedEffects
    end
    if p23 == u10.KILL_EFFECT then
        return u8:getState().Locker.killEffects
    end
    if p23 == u10.LOBBY_GADGET then
        return u8:getState().Locker.lobbyGadgets
    end
    if p23 == u10.TITLE then
        return u8:getState().Locker.titles
    end
    if p23 == u10.WIN_EFFECT then
        return u8:getState().Locker.winEffects
    end
    if p23 == u10.BADGE then
        return u8:getState().Locker.badges
    end
    if p23 == u10.BED_SKIN then
        return u8:getState().Locker.bedSkins
    end
    if p23 == u10.ITEM_SKIN then
        return u8:getState().Locker.itemSkins
    end
end
function u12.getEquippedLockerItem(p26, p27, p28) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
        [3] = u5
    --]]
    local v29 = nil
    if not p28 then
        if p27 == u10.EMOTE then
            local v30
            if p26.sentEquippedRequest[p27] == nil then
                v30 = nil
            else
                v30 = u8:getState().Locker.selectedEmotes
            end
            if v30 then
                return v30
            end
            p26.sentEquippedRequest[p27] = true
            local v31 = p26.namespace:Get("GetEquippedLockerItem"):CallServer(p27)
            u8:dispatch({
                ["type"] = "LockerSetEmoteWheel",
                ["emoteWheel"] = v31
            })
            return v31
        end
        if p27 == u10.BED_BREAK_EFFECT then
            v29 = u5.LocalPlayer:GetAttribute("BreakBedEffectType")
            if v29 ~= u8:getState().Locker.selectedBreakBedEffect then
                u8:dispatch({
                    ["type"] = "LockerSetBreakBedEffect",
                    ["breakBedEffect"] = v29
                })
                return v29
            end
        elseif p27 == u10.KILL_EFFECT then
            v29 = u5.LocalPlayer:GetAttribute("KillEffectType")
            if v29 ~= u8:getState().Locker.selectedKillEffect then
                u8:dispatch({
                    ["type"] = "LockerSetKillEffect",
                    ["killEffect"] = v29
                })
                return v29
            end
        elseif p27 == u10.LOBBY_GADGET then
            v29 = u5.LocalPlayer:GetAttribute("LobbyGadgetType")
            if v29 ~= u8:getState().Locker.selectedLobbyGadget then
                u8:dispatch({
                    ["type"] = "LockerSetLobbyGadget",
                    ["lobbyGadget"] = v29
                })
                return v29
            end
        elseif p27 == u10.TITLE then
            v29 = u5.LocalPlayer:GetAttribute("TitleType")
            if v29 ~= u8:getState().Locker.selectedTitle then
                u8:dispatch({
                    ["type"] = "LockerSetTitle",
                    ["title"] = v29
                })
                return v29
            end
        elseif p27 == u10.WIN_EFFECT then
            v29 = u5.LocalPlayer:GetAttribute("WinEffectType")
            if v29 ~= u8:getState().Locker.selectedWinEffect then
                u8:dispatch({
                    ["type"] = "LockerSetWinEffect",
                    ["winEffect"] = v29
                })
                return v29
            end
        elseif p27 == u10.BED_SKIN then
            v29 = u5.LocalPlayer:GetAttribute("BedSkin")
            if v29 ~= u8:getState().Locker.bedSkin then
                u8:dispatch({
                    ["type"] = "LockerSetBedSkin",
                    ["bedSkin"] = v29
                })
                return v29
            end
        else
            if p27 == u10.BADGE then
                local v32
                if p26.sentEquippedRequest[p27] == nil then
                    v32 = nil
                else
                    v32 = u8:getState().Locker.featuredBadges[1]
                end
                if v32 then
                    return v32
                end
                p26.sentEquippedRequest[p27] = true
                local v33 = p26.namespace:Get("GetEquippedLockerItem"):CallServer(p27)
                u8:dispatch({
                    ["type"] = "LockerSetFeaturedBadge",
                    ["badge"] = v33
                })
                return v33
            end
            if p27 == u10.ITEM_SKIN then
                local v34
                if p26.sentEquippedRequest[p27] == nil then
                    v34 = nil
                else
                    v34 = u8:getState().Locker.selectedItemSkins
                end
                if v34 then
                    return v34
                end
                p26.sentEquippedRequest[p27] = true
                local v35 = p26.namespace:Get("GetEquippedLockerItem"):CallServer(p27)
                u8:dispatch({
                    ["type"] = "LockerSetSelectedItemSkins",
                    ["selectedItemSkins"] = v35
                })
                return v35
            end
        end
    end
    return v29
end
function u12.setEmote(p36, p37, p38) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p36.namespace:Get("SetEmote"):CallServer({
        ["emote"] = p37,
        ["slot"] = p38
    }) then
        u8:dispatch({
            ["type"] = "LockerSetEmote",
            ["emote"] = p37,
            ["slot"] = p38
        })
    end
end
function u12.setKillEffect(p39, p40) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p39.namespace:Get("SetKillEffect"):CallServer({
        ["killEffect"] = p40
    }) then
        u8:dispatch({
            ["type"] = "LockerSetKillEffect",
            ["killEffect"] = p40
        })
    end
end
function u12.setTitle(p41, p42) --[[ Line: 260 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p41.namespace:Get("SetTitle"):CallServer({
        ["title"] = p42
    }) then
        u8:dispatch({
            ["type"] = "LockerSetTitle",
            ["title"] = p42
        })
    end
end
function u12.setLobbyGadget(p43, p44) --[[ Line: 271 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p43.namespace:Get("SetLobbyGadget"):CallServer({
        ["lobbyGadget"] = p44
    }) then
        u8:dispatch({
            ["type"] = "LockerSetLobbyGadget",
            ["lobbyGadget"] = p44
        })
    end
end
function u12.setBedSkin(p45, p46) --[[ Line: 282 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p45.namespace:Get("SetBedSkin"):CallServer({
        ["bedSkin"] = p46
    }) then
        u8:dispatch({
            ["type"] = "LockerSetBedSkin",
            ["bedSkin"] = p46
        })
    end
end
function u12.setItemSkin(p47, p48, p49) --[[ Line: 293 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v50 = p47.namespace:Get("SetItemSkin"):CallServer({
        ["itemType"] = p48,
        ["itemSkin"] = p49
    })
    if v50 then
        u8:dispatch({
            ["type"] = "LockerSetItemSkin",
            ["itemType"] = p48,
            ["itemSkin"] = p49
        })
    end
    return v50
end
function u12.setWinEffect(p51, p52) --[[ Line: 307 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p51.namespace:Get("SetWinEffect"):CallServer({
        ["winEffect"] = p52
    }) then
        u8:dispatch({
            ["type"] = "LockerSetWinEffect",
            ["winEffect"] = p52
        })
    end
end
function u12.setBreakBedEffect(p53, p54) --[[ Line: 318 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p53.namespace:Get("SetBreakBedEffect"):CallServer({
        ["breakBedEffect"] = p54
    }) then
        u8:dispatch({
            ["type"] = "LockerSetBreakBedEffect",
            ["breakBedEffect"] = p54
        })
    end
end
function u12.setFeaturedBadge(p55, p56) --[[ Line: 329 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p55.namespace:Get("SetFeaturedBadge"):CallServer({
        ["badge"] = p56
    }) then
        u8:dispatch({
            ["type"] = "LockerSetFeaturedBadge",
            ["badge"] = p56
        })
    end
end
function u12.ownsLobbyGadget(p57, p58) --[[ Line: 340 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    local v59 = u8:getState().Locker.lobbyGadgets
    local v60 = table.find(v59, p58) ~= nil
    if v60 then
        return true
    end
    if p57.isLockerItemOwnedRequestSent[p58] ~= nil then
        return v60
    end
    local v61 = p57.namespace:Get("CheckOwnsLockerItem"):CallServer(u10.LOBBY_GADGET, p58)
    p57.isLockerItemOwnedRequestSent[p58] = true
    if v61 then
        u8:dispatch({
            ["type"] = "LockerAddOwnedItems",
            ["items"] = {
                [u10.LOBBY_GADGET] = { p58 }
            }
        })
    end
    return v61
end
function u12.ownsTitle(p62, p63) --[[ Line: 366 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    local v64 = u8:getState().Locker.titles
    local v65 = table.find(v64, p63) ~= nil
    if v65 then
        return true
    end
    if p62.isLockerItemOwnedRequestSent[p63] ~= nil then
        return v65
    end
    local v66 = p62.namespace:Get("CheckOwnsLockerItem"):CallServer(u10.TITLE, p63)
    p62.isLockerItemOwnedRequestSent[p63] = true
    if v66 then
        u8:dispatch({
            ["type"] = "LockerAddOwnedItems",
            ["items"] = {
                [u10.TITLE] = { p63 }
            }
        })
    end
    return v66
end
function u12.ownsEmote(p67, p68) --[[ Line: 392 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    local v69 = u8:getState().Locker.emotes
    local v70 = table.find(v69, p68) ~= nil
    if v70 then
        return true
    end
    if p67.isLockerItemOwnedRequestSent[p68] ~= nil then
        return v70
    end
    local v71 = p67.namespace:Get("CheckOwnsLockerItem"):CallServer(u10.EMOTE, p68)
    p67.isLockerItemOwnedRequestSent[p68] = true
    if v71 then
        u8:dispatch({
            ["type"] = "LockerAddOwnedItems",
            ["items"] = {
                [u10.EMOTE] = { p68 }
            }
        })
    end
    return v71
end
function u12.ownsWinEffect(p72, p73) --[[ Line: 418 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    local v74 = u8:getState().Locker.winEffects
    local v75 = table.find(v74, p73) ~= nil
    if v75 then
        return true
    end
    if p72.isLockerItemOwnedRequestSent[p73] ~= nil then
        return v75
    end
    local v76 = p72.namespace:Get("CheckOwnsLockerItem"):CallServer(u10.WIN_EFFECT, p73)
    p72.isLockerItemOwnedRequestSent[p73] = true
    if v76 then
        u8:dispatch({
            ["type"] = "LockerAddOwnedItems",
            ["items"] = {
                [u10.WIN_EFFECT] = { p73 }
            }
        })
    end
    return v76
end
function u12.ownsKillEffect(p77, p78) --[[ Line: 444 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    local v79 = u8:getState().Locker.killEffects
    local v80 = table.find(v79, p78) ~= nil
    if v80 then
        return true
    end
    if p77.isLockerItemOwnedRequestSent[p78] ~= nil then
        return v80
    end
    local v81 = p77.namespace:Get("CheckOwnsLockerItem"):CallServer(u10.KILL_EFFECT, p78)
    p77.isLockerItemOwnedRequestSent[p78] = true
    if v81 then
        u8:dispatch({
            ["type"] = "LockerAddOwnedItems",
            ["items"] = {
                [u10.KILL_EFFECT] = { p78 }
            }
        })
    end
    return v81
end
function u12.ownsBedSkin(p82, p83) --[[ Line: 470 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    local v84 = u8:getState().Locker.bedSkins
    local v85 = table.find(v84, p83) ~= nil
    if v85 then
        return true
    end
    if p82.isLockerItemOwnedRequestSent[p83] ~= nil then
        return v85
    end
    local v86 = p82.namespace:Get("CheckOwnsLockerItem"):CallServer(u10.BED_SKIN, p83)
    p82.isLockerItemOwnedRequestSent[p83] = true
    if v86 then
        u8:dispatch({
            ["type"] = "LockerAddOwnedItems",
            ["items"] = {
                [u10.BED_SKIN] = { p83 }
            }
        })
    end
    return v86
end
function u12.ownsItemSkin(p87, p88) --[[ Line: 496 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    local v89 = u8:getState().Locker.itemSkins
    local v90 = table.find(v89, p88) ~= nil
    if v90 then
        return true
    end
    if p87.isLockerItemOwnedRequestSent[p88] ~= nil then
        return v90
    end
    local v91 = p87.namespace:Get("CheckOwnsLockerItem"):CallServer(u10.ITEM_SKIN, p88)
    p87.isLockerItemOwnedRequestSent[p88] = true
    if v91 then
        u8:dispatch({
            ["type"] = "LockerAddOwnedItems",
            ["items"] = {
                [u10.ITEM_SKIN] = { p88 }
            }
        })
    end
    return v91
end
function u12.ownsBedBreakEffect(p92, p93) --[[ Line: 522 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    local v94 = u8:getState().Locker.breakBedEffects
    local v95 = table.find(v94, p93) ~= nil
    if v95 then
        return true
    end
    if p92.isLockerItemOwnedRequestSent[p93] ~= nil then
        return v95
    end
    local v96 = p92.namespace:Get("CheckOwnsLockerItem"):CallServer(u10.BED_BREAK_EFFECT, p93)
    p92.isLockerItemOwnedRequestSent[p93] = true
    if v96 then
        u8:dispatch({
            ["type"] = "LockerAddOwnedItems",
            ["items"] = {
                [u10.BED_BREAK_EFFECT] = { p93 }
            }
        })
    end
    return v96
end
function u12.ownsBadge(p97, p98) --[[ Line: 548 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    local v99 = u8:getState().Locker.badges
    local v100 = table.find(v99, p98) ~= nil
    if v100 then
        return true
    end
    if p97.isLockerItemOwnedRequestSent[p98] ~= nil then
        return v100
    end
    local v101 = p97.namespace:Get("CheckOwnsLockerItem"):CallServer(u10.BADGE, p98)
    p97.isLockerItemOwnedRequestSent[p98] = true
    if v101 then
        u8:dispatch({
            ["type"] = "LockerAddOwnedItems",
            ["items"] = {
                [u10.BADGE] = { p98 }
            }
        })
    end
    return v101
end
v4.CreateController(u12.new())
return nil