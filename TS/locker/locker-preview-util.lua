local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteDisplayType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab
local v9 = {
    ["LOCKER_PREVIEW_FULLSCREEN_APP_ID"] = "LockerPreviewFullscreen",
    ["LOCKER_PREVIEW_PLAIN_BACKGROUND_APP_ID"] = "LockerPreviewPlainBackground"
}
local function u12(p10, p11) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if not p10 then
        return nil
    end
    if p11 == u8.KILL_EFFECTS then
        return {
            ["killEffect"] = p10.itemEnum
        }
    end
    if p11 == u8.BREAK_BED_EFFECTS then
        return {
            ["bedBreakEffect"] = p10.itemEnum
        }
    end
    if p11 == u8.BED_SKIN then
        return p10.itemEnum ~= "none" and {
            ["bedSkin"] = p10.itemEnum
        } or nil
    end
    if p11 == u8.LOBBY_GADGETS then
        return {
            ["lobbyGadget"] = p10.itemEnum
        }
    end
    if p11 == u8.EMOTES then
        return {
            ["emote"] = p10.itemEnum
        }
    end
end
v9.lockerElementToPreviewItem = u12
function v9.rewardToPreviewItem(p13) --[[ Line: 58 ]]
    return {
        ["killEffect"] = p13.killEffect,
        ["bedBreakEffect"] = p13.bedBreakEffect,
        ["bedSkin"] = p13.bedSkin,
        ["lobbyGadget"] = p13.lobbyGadget,
        ["emote"] = p13.emote,
        ["itemSkin"] = p13.itemSkin
    }
end
local u14 = nil
function v9.canPreviewLockerElement(p15, p16) --[[ Line: 71 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
    --]]
    local v17 = u12(p15, p16)
    if v17 then
        return u14(v17)
    else
        return false
    end
end
function v9.canPreviewReward(p18) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return u14({
        ["killEffect"] = p18.killEffect,
        ["bedBreakEffect"] = p18.bedBreakEffect,
        ["bedSkin"] = p18.bedSkin,
        ["lobbyGadget"] = p18.lobbyGadget,
        ["emote"] = p18.emote,
        ["itemSkin"] = p18.itemSkin
    })
end
u14 = function(p19) --[[ Name: canPreview, Line 85 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u3
        [4] = u4
        [5] = u7
        [6] = u6
    --]]
    if p19.bedBreakEffect and p19.bedBreakEffect ~= u2.NONE then
        return true
    end
    if p19.killEffect and p19.killEffect ~= u5.NONE then
        return true
    end
    if p19.bedSkin then
        return true
    end
    if p19.emote then
        local v20 = u3[p19.emote]
        local v21
        if v20 == nil then
            v21 = v20
        else
            v21 = v20.preview
            if v21 ~= nil then
                v21 = v21.disabled
            end
        end
        if v21 then
            return false
        end
        if v20 ~= nil then
            v20 = v20.emoteDisplayType
        end
        if v20 ~= u4.IMAGE_DEFAULT then
            return true
        end
    end
    if p19.lobbyGadget and p19.lobbyGadget ~= u7.NONE then
        local v22 = u6[p19.lobbyGadget]
        if v22 ~= nil then
            v22 = v22.preview
            if v22 ~= nil then
                v22 = v22.hidden
            end
        end
        if not v22 then
            return true
        end
    end
    return false
end
v9.canPreview = u14
function v9.canReplay(p23) --[[ Line: 133 ]]
    return (p23.killEffect ~= nil or p23.bedBreakEffect ~= nil) and true or p23.emote ~= nil
end
return {
    ["LockerKitSkinPreviewGui"] = {
        ["FolderName"] = "LockerKitSkinPreview",
        ["ModelName"] = "ReplicatedKitSkinPreview"
    },
    ["LockerPreviewUtil"] = v9
}