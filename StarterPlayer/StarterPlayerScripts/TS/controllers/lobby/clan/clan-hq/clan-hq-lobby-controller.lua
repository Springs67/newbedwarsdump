local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-background-music-meta").getClanHqBackgroundMusicMeta
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types")
local u8 = v7.ClanHqBackgroundMusicType
local u9 = v7.ClanHqSkyboxType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "ClanHqLobby"
    end,
    ["__index"] = u4
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p15)
    p15.Name = "ClanHqLobby"
    p15.clanHqProfileJoin = false
end
function u12.KnitStart(u16) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u11
        [3] = u3
        [4] = u8
        [5] = u9
        [6] = u10
        [7] = u6
        [8] = u2
        [9] = u5
    --]]
    u4.KnitStart(u16)
    if u11.isLobbyServer() then
        u16.clanHqProfileJoin = u3:IsStudio()
        local u17 = u8.DEFAULT
        local u18 = u9.DEFAULT
        u10.Client:GetNamespace("Clans"):Get("ClanHqProfileJoin"):Connect(function(p19) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u8
                [3] = u17
                [4] = u9
                [5] = u18
                [6] = u6
                [7] = u2
            --]]
            u16.clanHqProfileJoin = true
            local v20 = p19.clanHq
            if v20 ~= nil then
                v20 = v20.selectedLobbyMusic
            end
            if v20 == nil then
                v20 = u8.DEFAULT
            end
            u17 = v20
            local v21 = p19.clanHq
            if v21 ~= nil then
                v21 = v21.selectedSykbox
            end
            if v21 == nil then
                v21 = u9.DEFAULT
            end
            u18 = v21
            local v22 = u6(u17)
            u2.Controllers.BackgroundMusicController:startMusic(v22.soundId, nil, {
                ["title"] = v22.title
            })
            u2.Controllers.LobbyLightingController:setupEnvironment(u18)
        end)
        u5.changed:connect(function(p23, p24) --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u8
                [3] = u16
                [4] = u6
                [5] = u2
                [6] = u18
                [7] = u9
            --]]
            local v25 = p23.Clans.myClan
            if v25 ~= nil then
                v25 = v25.clanHq
                if v25 ~= nil then
                    v25 = v25.selectedLobbyMusic
                end
            end
            local v26 = p24.Clans.myClan
            if v26 ~= nil then
                v26 = v26.clanHq
                if v26 ~= nil then
                    v26 = v26.selectedLobbyMusic
                end
            end
            if v25 ~= v26 then
                u17 = v25 or u8.DEFAULT
                if u16.clanHqProfileJoin then
                    local v27 = u6(u17)
                    u2.Controllers.BackgroundMusicController:startMusic(v27.soundId, nil, {
                        ["title"] = v27.title
                    })
                end
            end
            local v28 = p23.Clans.myClan
            if v28 ~= nil then
                v28 = v28.clanHq
                if v28 ~= nil then
                    v28 = v28.selectedSykbox
                end
            end
            local v29 = p24.Clans.myClan
            if v29 ~= nil then
                v29 = v29.clanHq
                if v29 ~= nil then
                    v29 = v29.selectedSykbox
                end
            end
            if v28 ~= v29 then
                u18 = v28 or u9.DEFAULT
                if u16.clanHqProfileJoin then
                    u2.Controllers.LobbyLightingController:setupEnvironment(u18)
                end
            end
        end)
    end
end
function u12.isClanHq(p30) --[[ Line: 113 ]]
    return p30.clanHqProfileJoin
end
u2.CreateController(u12.new())
return nil