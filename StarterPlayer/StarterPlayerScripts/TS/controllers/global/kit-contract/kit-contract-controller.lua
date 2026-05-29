local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.MarketplaceService
local u6 = v4.Players
local u7 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = u1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "KitContractController"
    end,
    ["__index"] = u7
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
    --]]
    u7.constructor(p14)
    p14.Name = "KitContractController"
    p14.remotes = u10.Client:GetNamespace("KitStat")
end
function u11.KnitStart(p15) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
    --]]
    u7.KnitStart(p15)
    p15.remotes:Get("UpdateKitStats"):Connect(function(p16) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        u8:dispatch({
            ["type"] = "LobbyUpdateAllKitStatsProfiles",
            ["kitStatsProfiles"] = p16.kitStatsProfiles
        })
    end)
end
function u11.getKitContractProfile(p17, u18, p19) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u1
    --]]
    if p19 then
        local v20 = p17.remotes:Get("GetKitContractProfile"):CallServerAsync(u18)
        v20:andThen(function(p21) --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u18
            --]]
            if p21 then
                u8:dispatch({
                    ["type"] = "LobbySetKitContractProfile",
                    ["kit"] = u18,
                    ["kitContractProfile"] = p21
                })
            end
        end)
        return v20
    end
    local u22 = u8:getState().Lobby.kitContractProfiles[u18]
    if u22 then
        return u1.Promise.new(function(p23) --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            return p23(u22)
        end)
    end
    local v24 = p17.remotes:Get("GetKitContractProfile"):CallServerAsync(u18)
    v24:andThen(function(p25) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u18
        --]]
        if p25 then
            u8:dispatch({
                ["type"] = "LobbySetKitContractProfile",
                ["kit"] = u18,
                ["kitContractProfile"] = p25
            })
        end
    end)
    return v24
end
function u11.getKitStats(p26, u27, p28) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u1
    --]]
    if p28 then
        local v29 = p26.remotes:Get("GetKitStats"):CallServerAsync(u27)
        v29:andThen(function(p30) --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u27
            --]]
            if p30 then
                u8:dispatch({
                    ["type"] = "LobbySetKitStatsProfile",
                    ["kit"] = u27,
                    ["kitStatsProfile"] = p30
                })
            end
        end)
        return v29
    end
    local u31 = u8:getState().Lobby.kitStatsProfiles[u27]
    if u31 then
        return u1.Promise.new(function(p32) --[[ Line: 92 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            return p32(u31)
        end)
    end
    local v33 = p26.remotes:Get("GetKitStats"):CallServerAsync(u27)
    v33:andThen(function(p34) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u27
        --]]
        if p34 then
            u8:dispatch({
                ["type"] = "LobbySetKitStatsProfile",
                ["kit"] = u27,
                ["kitStatsProfile"] = p34
            })
        end
    end)
    return v33
end
function u11.getKitsStats(p35, p36, p37) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u1
    --]]
    if p37 then
        local v38 = p35.remotes:Get("GetKitsStats"):CallServerAsync(p36)
        v38:andThen(function(p39) --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u8
            --]]
            for v40, v41 in u3.entries(p39) do
                local _ = v40 - 1
                u8:dispatch({
                    ["type"] = "LobbySetKitStatsProfile",
                    ["kit"] = v41[1],
                    ["kitStatsProfile"] = v41[2]
                })
            end
        end)
        return v38
    end
    local u42 = {}
    for v43, v44 in p36 do
        local _ = v43 - 1
        local v45 = u8:getState().Lobby.kitStatsProfiles[v44]
        if v45 then
            u42[v44] = v45
        end
    end
    local v46 = 0
    for _ in u42 do
        v46 = v46 + 1
    end
    if v46 == #p36 then
        return u1.Promise.new(function(p47) --[[ Line: 147 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            return p47(u42)
        end)
    end
    local v48 = u3.keys(u42)
    local v49 = 0
    local v50 = {}
    for v51, v52 in p36 do
        local _ = v51 - 1
        if table.find(v48, v52) == nil == true then
            v49 = v49 + 1
            v50[v49] = v52
        end
    end
    local v53 = u1.Promise.all
    local v54 = {}
    local v56 = u1.Promise.new(function(p55) --[[ Line: 169 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        return p55(u42)
    end)
    local v57 = p35.remotes:Get("GetKitsStats"):CallServerAsync(v50)
    v57:andThen(function(p58) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
        --]]
        for v59, v60 in u3.entries(p58) do
            local _ = v59 - 1
            u8:dispatch({
                ["type"] = "LobbySetKitStatsProfile",
                ["kit"] = v60[1],
                ["kitStatsProfile"] = v60[2]
            })
        end
    end)
    __set_list(v54, 1, {v56, v57})
    return v53(v54):andThen(function(p61) --[[ Line: 172 ]]
        local v62 = p61[1]
        local v63 = p61[2]
        local v64 = {}
        for v65, v66 in v62 do
            v64[v65] = v66
        end
        for v67, v68 in v63 do
            v64[v67] = v68
        end
        return v64
    end)
end
function u11.promptPurchaseToContract(_, p69) --[[ Line: 188 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
        [3] = u6
        [4] = u9
    --]]
    u10.Client:Get("AttemptKitContractPurchase"):SendToServer({
        ["kit"] = p69
    })
    u5:PromptProductPurchase(u6.LocalPlayer, u9.KIT_CONTRACT)
end
v2.CreateController(u11.new())
return nil