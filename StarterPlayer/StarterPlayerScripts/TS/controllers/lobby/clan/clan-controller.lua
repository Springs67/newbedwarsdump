local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.SoundManager
local u6 = v3.UILayers
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "Util", "TableUtil").EncodeJSON
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "datastructures", "out").MaxPriorityQueue
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.MarketplaceService
local u12 = v10.Players
local u13 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u24 = u1.import(script, script.Parent, "ui", "clan-menu", "clan-menu-core").ClanMenuTab
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "ClanController"
    end,
    ["__index"] = u14
})
u25.__index = u25
function u25.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u21
    --]]
    u14.constructor(p28)
    p28.Name = "ClanController"
    p28.clansRemotes = u21.Client:GetNamespace("Clans")
    p28.distinctAuditLogs = {}
    p28.clanAuditLogs = {}
    p28.clanWarLeaderboardRequestCD = 120
    p28.lastClanWarWeeklyLeaderboardRequest = 0
    p28.clanWarWeeklyLeaderboard = {}
    p28.lastClanWarAllTimeLeaderboardRequest = 0
    p28.clanWarAllTimeLeaderboard = {}
end
function u25.KnitStart(p29) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u21
        [3] = u2
        [4] = u16
        [5] = u5
        [6] = u22
        [7] = u15
        [8] = u18
        [9] = u13
        [10] = u19
        [11] = u4
        [12] = u23
        [13] = u24
        [14] = u12
        [15] = u17
    --]]
    u14.KnitStart(p29)
    u21.Client:GetNamespace("Clans"):OnEvent("ClanUpdate", function(p30) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
            [3] = u5
            [4] = u22
            [5] = u15
            [6] = u18
            [7] = u13
        --]]
        local v31 = p30.newClan
        if v31 then
            v31 = p30.clanId
        end
        if v31 ~= "" and v31 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.CLAN_PROFILE, {
                ["newClan"] = true,
                ["ClanId"] = p30.clanId
            })
            u5:playSound(u22.BEDWARS_UPGRADE_SUCCESS)
        end
        u15:dispatch({
            ["type"] = "ClanUpdate",
            ["myClanId"] = p30.clanId,
            ["myClan"] = p30.clanProfile,
            ["me"] = p30.me
        })
        local v32 = u18.getActiveClanWarId()
        local v33
        if v32 == "" or not v32 then
            v33 = nil
        else
            v33 = p30.clanProfile
            if v33 ~= nil then
                v33 = v33.clanWar.wars[v32]
            end
        end
        if v33 then
            u15:dispatch({
                ["type"] = "ClanSetActiveClanWar",
                ["activeClanWar"] = v33
            })
        end
        if p30.clanId == nil then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u16.CLAN_PROFILE)
        end
        u13.ClanUpdate:fire(p30)
    end)
    u21.Client:GetNamespace("Clans"):OnEvent("ClanInvite", function(p34) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u2
            [3] = u19
            [4] = u4
            [5] = u23
            [6] = u16
            [7] = u24
        --]]
        u15:dispatch({
            ["type"] = "ClanInviteIncoming",
            ["clanInvite"] = p34.clanInvite
        })
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
            ["image"] = u19.CLAN,
            ["message"] = "<b>Clan <font color=\"" .. u4.richTextColor(u23.mcAqua) .. "\">[" .. p34.clanInvite.clanTag .. "]</font> has sent you an invite!</b>",
            ["onClick"] = function() --[[ Name: onClick, Line 104 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u16
                    [3] = u24
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.CLAN_MENU, {
                    ["tab"] = u24.INVITES
                })
            end
        })
    end)
    u21.Client:GetNamespace("Clans"):OnEvent("ClanInvitesUpdate", function(p35) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        local v36 = {}
        for v37, v38 in p35.clanInvites do
            local _ = v37 - 1
            v36[v38.clanId] = v38
        end
        u15:dispatch({
            ["type"] = "ClanSetClanInvites",
            ["incomingClanInvites"] = v36
        })
    end)
    u21.Client:GetNamespace("Clans"):OnEvent("OpenClanMenu", function(p39) --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
        --]]
        if p39.open then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.CLAN_MENU, {})
        else
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u16.CLAN_MENU)
        end
    end)
    p29.clansRemotes:OnEvent("SetPlayerClanWarMissions", function(p40) --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        u15:dispatch({
            ["type"] = "LobbySetClanWarMissionsData",
            ["clanWarMissionsData"] = p40.clanWarPlayerMissions
        })
    end)
    u12.LocalPlayer:GetAttributeChangedSignal("ClanPassPaid"):Connect(function() --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u17
            [3] = u12
        --]]
        u15:dispatch({
            ["type"] = "ClanSetClanPassPaid",
            ["paid"] = u17.hasClanPass(u12.LocalPlayer)
        })
    end)
end
u25.submitClanCreateForm = u1.async(function(p41, p42) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v43 = p41.clansRemotes:Get("SubmitClanCreateForm"):CallServerAsync(p42)
    return u1.await(v43:andThen(function(p44) --[[ Line: 149 ]]
        return p44
    end))
end)
function u25.promptClanPassPurchase(_) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u12
        [3] = u11
        [4] = u20
    --]]
    if not u17.hasClanPass(u12.LocalPlayer) then
        u11:PromptGamePassPurchase(u12.LocalPlayer, u20.CLAN_CREATE_PASS)
    end
end
function u25.requestClanWarWeeklyLeaderboardAsync(u45) --[[ Line: 160 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u1
    --]]
    if os.time() - u45.lastClanWarWeeklyLeaderboardRequest <= u45.clanWarLeaderboardRequestCD then
        return u1.Promise.new(function(p46) --[[ Line: 170 ]]
            --[[
            Upvalues:
                [1] = u45
            --]]
            return p46(u45.clanWarWeeklyLeaderboard)
        end)
    end
    u45.lastClanWarWeeklyLeaderboardRequest = os.time()
    local v47 = u21.Client:Get("RequestClanWarWeeklyLeaderboard"):CallServerAsync()
    v47:andThen(function(p48) --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45.clanWarWeeklyLeaderboard = p48
    end)
    return v47
end
function u25.requestClanWarAllTimeLeaderboardAsync(u49) --[[ Line: 175 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u1
    --]]
    if os.time() - u49.lastClanWarAllTimeLeaderboardRequest <= u49.clanWarLeaderboardRequestCD then
        return u1.Promise.new(function(p50) --[[ Line: 185 ]]
            --[[
            Upvalues:
                [1] = u49
            --]]
            return p50(u49.clanWarAllTimeLeaderboard)
        end)
    end
    u49.lastClanWarAllTimeLeaderboardRequest = os.time()
    local v51 = u21.Client:Get("RequestClanWarAllTimeLeaderboard"):CallServerAsync()
    v51:andThen(function(p52) --[[ Line: 179 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        u49.clanWarAllTimeLeaderboard = p52
    end)
    return v51
end
function u25.getMyClanProfileData(p53) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u1
        [3] = u18
    --]]
    local u54 = u15:getState().Clans.myClan
    if u54 then
        return u1.Promise.new(function(p55) --[[ Line: 194 ]]
            --[[
            Upvalues:
                [1] = u54
            --]]
            return p55(u54)
        end)
    end
    local v56 = p53.clansRemotes:Get("RequestMyClanProfile"):CallServerAsync()
    v56:andThen(function(p57) --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u18
        --]]
        if p57 then
            u15:dispatch({
                ["type"] = "ClanSetMyClanProfile",
                ["myClanProfile"] = p57
            })
            local v58 = u18.getActiveClanWarId()
            local v59
            if v58 == "" or not v58 then
                v59 = nil
            else
                v59 = p57.clanWar.wars[v58]
            end
            if v59 then
                u15:dispatch({
                    ["type"] = "ClanSetActiveClanWar",
                    ["activeClanWar"] = v59
                })
            end
        end
    end)
    return v56
end
function u25.fetchClanGuestDisplay(p60, p61) --[[ Line: 220 ]]
    local v62 = p60.clansRemotes:Get("FetchClanGuestView"):CallServer(p61)
    if v62 ~= nil then
        v62 = v62.clanProfile
    end
    return v62
end
function u25.promoteMember(p63, p64, p65) --[[ Line: 227 ]]
    return p63.clansRemotes:Get("PromoteMember"):CallServerAsync(p64, p65)
end
function u25.demoteMember(p66, p67, p68) --[[ Line: 230 ]]
    return p66.clansRemotes:Get("DemoteMember"):CallServerAsync(p67, p68)
end
function u25.kickPlayer(p69, p70, p71) --[[ Line: 233 ]]
    return p69.clansRemotes:Get("KickMember"):CallServerAsync(p70, p71)
end
function u25.transferLeadership(p72, p73, p74) --[[ Line: 236 ]]
    return p72.clansRemotes:Get("TransferLeader"):CallServerAsync(p73, p74)
end
u25.upgrade = u1.async(function(p75, p76, p77) --[[ Line: 239 ]]
    return p75.clansRemotes:Get("Upgrade"):CallServerAsync(p76, p77)
end)
u25.selectClanHqBackgroundMusic = u1.async(function(p78, p79, p80) --[[ Line: 242 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p78.clansRemotes:Get("SelectClanHqBackgroundMusic"):CallServerAsync(p79, p80))
end)
u25.selectClanHqSkybox = u1.async(function(p81, p82, p83) --[[ Line: 245 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p81.clansRemotes:Get("SelectClanHqSkybox"):CallServerAsync(p82, p83))
end)
u25.selectClanPodiumBanner = u1.async(function(p84, p85, p86) --[[ Line: 248 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p84.clansRemotes:Get("SelectClanPodiumBanner"):CallServerAsync(p85, p86))
end)
u25.selectClanChatTagColor = u1.async(function(p87, p88, p89) --[[ Line: 251 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.await(p87.clansRemotes:Get("SelectClanChatTagColor"):CallServerAsync(p88, p89))
end)
function u25.updateClanInfo(p90, p91, p92) --[[ Line: 254 ]]
    return p90.clansRemotes:Get("UpdateClanInfo"):CallServerAsync(p91, p92)
end
function u25.updateClanEmblem(p93, p94, p95) --[[ Line: 257 ]]
    return p93.clansRemotes:Get("UpdateClanEmblem"):CallServerAsync(p94, p95)
end
function u25.deleteClan(p96, p97) --[[ Line: 260 ]]
    p96.clansRemotes:Get("DeleteClan"):CallServer(p97)
end
function u25.cancelDeleteClan(p98, p99) --[[ Line: 263 ]]
    p98.clansRemotes:Get("CancelMarkedDelete"):CallServerAsync(p99)
end
function u25.leaveClan(u100) --[[ Line: 266 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u16
        [3] = u23
        [4] = u5
        [5] = u22
        [6] = u13
        [7] = u6
    --]]
    local v101 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
    local v102 = u16.CONFIRMATION_MODAL
    local v103 = {
        ["Title"] = "Leave Clan?",
        ["Body"] = "Are you sure you want to leave this clan? You can\'t undo this action.",
        ["PrimaryBtnProps"] = {
            ["Text"] = "Leave",
            ["BackgroundColor3"] = u23.backgroundError
        },
        ["SecondaryBtnProps"] = {
            ["Text"] = "Cancel"
        },
        ["OnPrimaryBtnClick"] = function() --[[ Name: OnPrimaryBtnClick, Line 277 ]]
            --[[
            Upvalues:
                [1] = u100
                [2] = u2
                [3] = u16
                [4] = u5
                [5] = u22
                [6] = u13
            --]]
            if u100.clansRemotes:Get("LeaveClan"):CallServer() then
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u16.CLAN_PROFILE)
                u5:playSound(u22.ARMOR_UNEQUIP)
                u13.ClanLeave:fire()
            else
                u5:playSound(u22.ERROR_NOTIFICATION)
            end
        end,
        ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 287 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u6
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u6.OVERLAY)
        end
    }
    v101:openApp(v102, v103)
end
function u25.invitePlayerToClan(p104, p105, p106) --[[ Line: 292 ]]
    return p104.clansRemotes:Get("InvitePlayerToClan"):CallServer(p105, p106)
end
function u25.clanInviteDecision(p107, p108, p109) --[[ Line: 295 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u16
        [3] = u15
    --]]
    p107.clansRemotes:Get("ClanInviteDecision"):CallServerAsync(p108, p109):andThen(function(p110) --[[ Line: 297 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
        --]]
        local v111 = p110.joinedClan
        if v111 then
            v111 = p110.clanId
        end
        if v111 ~= "" and (v111 and not u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen(u16.CLAN_PROFILE)) then
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.CLAN_PROFILE, {
                ["ClanId"] = p110.clanId
            })
        end
    end):catch(function(p112) --[[ Line: 308 ]]
        return print("[ClanInviteDecision Error]", p112)
    end)
    u15:dispatch({
        ["type"] = "ClanInviteDelete",
        ["clanId"] = p108
    })
end
function u25.kitShopPurchase(p113, p114) --[[ Line: 316 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u22
    --]]
    local v115 = p113.clansRemotes:Get("KitShopPurchase"):CallServerAsync(p114)
    v115:andThen(function(p116) --[[ Line: 318 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u22
        --]]
        if p116 then
            u5:playSound(u22.BEDWARS_UPGRADE_SUCCESS)
        end
    end)
    return v115
end
function u25.requestToJoinClan(p117, p118) --[[ Line: 326 ]]
    return p117.clansRemotes:Get("RequestToJoinClan"):CallServerAsync(p118)
end
function u25.loadAuditLogs(u119, u120) --[[ Line: 329 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
    --]]
    return u119.clansRemotes:Get("ClanLoadAuditLogs"):CallServerAsync(u120):andThen(function(p121) --[[ Line: 330 ]]
        --[[
        Upvalues:
            [1] = u119
            [2] = u120
            [3] = u9
            [4] = u8
        --]]
        local v122 = u119.distinctAuditLogs[u120]
        local u123 = v122 == nil and {} or v122
        local u124 = u119.clanAuditLogs[u120]
        if u124 == nil then
            u124 = u9.new()
        end
        local function v128(p125) --[[ Line: 346 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u123
                [3] = u124
            --]]
            local v126 = u8({
                ["timestamp"] = p125.timestamp,
                ["data"] = p125.data
            })
            if u123[v126] == nil then
                local v127 = DateTime.fromIsoDate(p125.timestamp)
                if v127 ~= nil then
                    v127 = v127.UnixTimestamp
                end
                u124:InsertWithPriority(p125, v127 == nil and 0 or v127)
                u123[v126] = true
            end
        end
        for v129, v130 in p121 do
            v128(v130, v129 - 1, p121)
        end
        u119.clanAuditLogs[u120] = u124
        u119.distinctAuditLogs[u120] = u123
        return u124
    end)
end
v7.CreateController(u25.new())
return nil