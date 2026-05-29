local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").getAbilityMeta
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "BaseKitController"
    end,
    ["__index"] = u9
})
u15.__index = u15
function u15.constructor(p16, p17, p18) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u10
        [4] = u11
    --]]
    u9.constructor(p16)
    p16.kit = p17
    p16.preloadAssets = p18
    p16.Name = "BaseKitController"
    p16.localLogicActivate = false
    p16.localKitMaid = u6.new()
    p16.replicationLogicActivate = false
    p16.replicationKitMaid = u6.new()
    p16.retryThread = nil
    p16.clientReady = false
    p16.playersUsingKit = {}
    p16.kitMeta = u10(p17)
    p16.logger = u11.getLogger(p16.kit .. "_controller")
end
function u15.KnitStart(u19) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u4
        [3] = u14
        [4] = u12
        [5] = u8
        [6] = u7
        [7] = u13
    --]]
    u9.KnitStart(u19)
    u4.Controllers.KitController:watchKit(function(p20, p21) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u14
            [3] = u4
            [4] = u12
        --]]
        if p21 == u19.kit then
            u19:add(p20)
            if u14.isGameServer() and u4.Controllers.MatchController:getMatchState() == u12.RUNNING then
                u19:initKit(p20)
            end
        end
    end)
    u8.MatchStateChange:connect(function(p22) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u19
            [3] = u7
        --]]
        if p22.matchState ~= u12.RUNNING then
            return nil
        end
        if next(u19.playersUsingKit) == nil then
            return nil
        end
        for v23 in u19.playersUsingKit do
            local v24 = u7:GetPlayerByUserId(v23)
            if v24 then
                u19:initKit(v24)
            end
        end
    end)
    u7.PlayerRemoving:Connect(function(p25) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u14
            [3] = u4
            [4] = u12
        --]]
        u19:remove(p25)
        if u14.isLobbyServer() or u4.Controllers.MatchController:getMatchState() == u12.RUNNING then
            u19:deinitKit(p25)
        end
    end)
    u8.KitUnequip:connect(function(p26) --[[ Line: 78 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u4
            [3] = u12
        --]]
        if p26.kit ~= u19.kit then
            return nil
        end
        u19:remove(p26.player)
        if u4.Controllers.MatchController:getMatchState() == u12.RUNNING then
            u19:deinitKit(p26.player)
        end
    end)
    u13.Client:Get("KitControllerReadyResponse"):Connect(function(p27) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        if p27 ~= u19.kit then
            return nil
        end
        u19.clientReady = true
    end)
end
function u15.add(p28, p29) --[[ Line: 94 ]]
    p28.playersUsingKit[p29.UserId] = true
    p28.logger:Verbose("[BASE-KIT-CONTROLLER] Add player " .. p29.Name .. " to kit: " .. p28.kit .. " ")
end
function u15.remove(p30, p31) --[[ Line: 100 ]]
    if p30.playersUsingKit[p31.UserId] == nil then
        return nil
    end
    p30.playersUsingKit[p31.UserId] = nil
    p30.logger:Verbose("[BASE-KIT-CONTROLLER] Remove player " .. p31.Name .. " from kit: " .. p30.kit .. " ")
end
function u15.initKit(u32, u33) --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u15
        [3] = u13
    --]]
    u32:activateKitReplication()
    if u33 == u7.LocalPlayer then
        u32:activateLocalKit()
    end
    if u7.LocalPlayer == u33 then
        if u32.retryThread then
            task.cancel(u32.retryThread)
            u32.retryThread = nil
        end
        u32.clientReady = false
        u32.retryThread = task.spawn(function() --[[ Line: 124 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u32
                [3] = u13
                [4] = u33
            --]]
            local v34 = 0
            while v34 < u15.RETRIES + 1 and not u32.clientReady do
                u13.Client:Get("KitControllerReady"):SendToServer(u32.kit)
                task.wait(u15.RETRY_DELAY)
                v34 = v34 + 1
            end
            if u15.RETRIES + 1 <= v34 and not u32.clientReady then
                u32.logger:Error("[BASE-KIT-CONTROLLER] Kit " .. u32.kit .. " failed to initialize for player " .. u33.Name)
            end
        end)
    end
    u32.logger:Verbose("[BASE-KIT-CONTROLLER] Init Kit " .. u32.kit .. " for player: " .. u33.Name)
end
function u15.deinitKit(p35, p36) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    p35.playersUsingKit[p36.UserId] = nil
    if p36 == u7.LocalPlayer then
        p35:deactivateLocalKit()
    end
    if next(p35.playersUsingKit) == nil then
        p35:deactivateKitReplication()
    end
    p35.logger:Verbose("[BASE-KIT-CONTROLLER] Deinit Kit " .. p35.kit .. " for player: " .. p36.Name)
end
function u15.activateLocalKit(p37) --[[ Line: 157 ]]
    if p37.localLogicActivate then
        return nil
    end
    p37.localLogicActivate = true
    p37:onKitLocalActivated(p37.localKitMaid)
    p37:preloadKitAssets()
    p37:setupInnateAbilities()
    p37.logger:Verbose("[BASE-KIT-CONTROLLER] Activated Local Kit: " .. p37.kit)
end
function u15.deactivateLocalKit(p38) --[[ Line: 167 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if not p38.localLogicActivate then
        return nil
    end
    p38.localLogicActivate = false
    if p38.kitMeta.abilities ~= nil and #p38.kitMeta.abilities ~= 0 then
        for v39, v40 in p38.kitMeta.abilities do
            local _ = v39 - 1
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(v40.abilityId)
        end
    end
    p38.localKitMaid:DoCleaning()
    p38:onKitLocalDeactivated()
    p38.logger:Verbose("[BASE-KIT-CONTROLLER] Deactivated Local Kit: " .. p38.kit)
end
function u15.activateKitReplication(u41) --[[ Line: 186 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if u41.replicationLogicActivate then
        return nil
    end
    u41.replicationLogicActivate = true
    if u41.kitMeta.abilities ~= nil and #u41.kitMeta.abilities ~= 0 then
        u41.localKitMaid:GiveTask(u8.AbilityUsed:connect(function(p42) --[[ Line: 192 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            u41:onAbilityUsed(p42.userCharacter, p42)
        end))
    end
    u41:onKitReplicationActivated(u41.replicationKitMaid)
    u41.logger:Verbose("[BASE-KIT-CONTROLLER] Activate Kit Replication: " .. u41.kit)
end
function u15.deactivateKitReplication(p43) --[[ Line: 199 ]]
    p43.replicationLogicActivate = false
    p43.replicationKitMaid:DoCleaning()
    p43:onKitReplicationDeactivated()
    p43.logger:Verbose("[BASE-KIT-CONTROLLER] Deactivate Kit Replication: " .. p43.kit)
end
function u15.preloadKitAssets(p44) --[[ Line: 205 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p44.preloadAssets then
        u4.Controllers.PreloadController:runPreload(p44.preloadAssets)
    end
end
function u15.setupInnateAbilities(u45) --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u5
        [4] = u8
        [5] = u12
        [6] = u4
    --]]
    local u46 = u45.kitMeta.abilities
    if u46 ~= nil then
        local v47 = 0
        u46 = {}
        for v48, v49 in u46 do
            local _ = v48 - 1
            if v49.innate == true then
                v47 = v47 + 1
                u46[v47] = v49
            end
        end
    end
    if u46 == nil or #u46 == 0 then
        return nil
    end
    local u50 = false
    local function u64(p51) --[[ Line: 233 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u2
            [3] = u3
            [4] = u45
            [5] = u5
        --]]
        u50 = true
        local function v61(u52) --[[ Line: 236 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u3
                [3] = u45
                [4] = u5
            --]]
            if not u52.innate then
                return nil
            end
            if u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u52.abilityId) then
                return nil
            end
            local v53 = u3(u52.abilityId)
            local v54 = u45.logger
            local v55 = u52.abilityId
            local v56 = u52.innate
            v54:Verbose("[BASE-KIT-CONTROLLER] Setup Innate Ability Request: " .. v55 .. " " .. tostring(v56) .. " " .. u5(u52.triggerConfigOverride or v53.triggerConfig))
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u52.abilityId, u52.triggerConfigOverride or v53.triggerConfig):andThen(function(p57) --[[ Line: 246 ]]
                --[[
                Upvalues:
                    [1] = u45
                    [2] = u52
                --]]
                local v58 = u45.logger
                local v59 = u52.abilityId
                local v60 = u52.innate
                v58:Verbose("[BASE-KIT-CONTROLLER] Setup Innate Ability Succcess: " .. v59 .. " " .. tostring(v60))
                u45:onInnateAbilityEnabled(u52, p57)
                u45.localKitMaid:GiveTask(p57)
            end)
        end
        for v62, v63 in p51 do
            v61(v63, v62 - 1, p51)
        end
    end
    u45.localKitMaid:GiveTask(u8.MatchStateChange:connect(function(p65) --[[ Line: 260 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u50
            [3] = u64
            [4] = u46
        --]]
        if p65.matchState == u12.RUNNING and not u50 then
            u64(u46)
        end
    end))
    if u4.Controllers.MatchController:getMatchState() == u12.RUNNING and not u50 then
        u64(u46)
    end
end
u15.RETRIES = 5
u15.RETRY_DELAY = 1
return {
    ["BaseKitController"] = u15
}