local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.PlaceId
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TeleportService
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "knit", "patch-knit").patchKnitClient
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "shared-modules").SharedModules
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u13 = u1.import(script, script.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine
return {
    ["setup"] = function() --[[ Name: setup, Line 15 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
            [3] = u4
            [4] = u7
            [5] = u13
            [6] = u11
            [7] = u12
            [8] = u10
            [9] = u5
            [10] = u9
            [11] = u1
            [12] = u6
        --]]
        u3.isMobileControls()
        u7.Info("[SETUP] Loading Client Block Engine...")
        u7.Info("[SETUP] Loading Global modules (client, shared)...")
        u11.loadGlobalModules()
        if u12.isLobbyServer() then
            u7.Info("[SETUP] Loading Lobby modules (client, shared)...")
            u11.loadLobbyModules()
        end
        if u12.isGameServer() then
            u7.Info("[SETUP] Loading Game modules (client, shared)...")
            u11.loadGameModules("bedwars")
        end
        if u12.isAfkServer() then
            u7.Info("[SETUP] Loading AFK Place modules (client, shared)...")
            u11.loadAfkModules()
        end
        u7.Info("[SETUP] Patching Knit Client...")
        u10(u5)
        local u14 = 0
        local function u22(p15, p16) --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u1
                [3] = u7
                [4] = u14
                [5] = u22
            --]]
            if p16 == nil then
                p16 = false
            end
            for _, u17 in p15:GetChildren() do
                if u17:IsA("ModuleScript") and u9.includes(u17.Name, "controller") then
                    u1.Promise.new(function(u18, u19) --[[ Line: 55 ]]
                        --[[
                        Upvalues:
                            [1] = u1
                            [2] = u17
                        --]]
                        u1.try(function() --[[ Line: 56 ]]
                            --[[
                            Upvalues:
                                [1] = u18
                                [2] = u17
                            --]]
                            u18(require(u17))
                        end, function(p20) --[[ Line: 58 ]]
                            --[[
                            Upvalues:
                                [1] = u19
                            --]]
                            u19(p20)
                        end)
                    end):timeout(10):catch(function(p21) --[[ Line: 61 ]]
                        --[[
                        Upvalues:
                            [1] = u7
                            [2] = u17
                        --]]
                        u7.Warn("Error while trying to require controller script " .. u17.Name .. " with reason: " .. tostring(p21))
                    end):await()
                    u14 = u14 + 1
                elseif p16 and u17:IsA("Folder") then
                    u22(u17, true)
                end
            end
        end
        local v23 = script.Parent
        if not v23 then
            u7.Fatal("[SETUP] Knit file (client) does not have parent.")
            task.spawn(function() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u4
                --]]
                u8:Teleport(u4.LOBBY)
            end)
            return nil
        end
        local u24 = v23:FindFirstChild("controllers")
        if not u24 then
            u7.Fatal("[SETUP] Missing controllers folder.")
            task.spawn(function() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u4
                --]]
                u8:Teleport(u4.LOBBY)
            end)
            return nil
        end
        local u25 = v23.Parent
        if not u25 then
            u7.Fatal("[SETUP] Missing starter player scripts folder.")
            task.spawn(function() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u4
                --]]
                u8:Teleport(u4.LOBBY)
            end)
            return nil
        end
        local function v32(u26) --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u24
                [3] = u22
                [4] = u7
                [5] = u6
                [6] = u8
                [7] = u4
            --]]
            u1.Promise.new(function(p27, p28) --[[ Line: 91 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u26
                --]]
                local v29 = u24:WaitForChild(u26, 14.5)
                if v29 then
                    p27(v29)
                else
                    p28()
                end
            end):timeout(15):andThen(function(p30) --[[ Line: 99 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                u22(p30, true)
            end):catch(function(p31) --[[ Line: 102 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u26
                    [3] = u6
                    [4] = u8
                    [5] = u4
                --]]
                u7.Fatal("[SETUP] Failed to setup client " .. u26 .. " modules for reason " .. u6(p31))
                task.spawn(function() --[[ Line: 19 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u4
                    --]]
                    u8:Teleport(u4.LOBBY)
                end)
            end):await()
        end
        u7.Info("[SETUP] Loading Global Knit modules (client)...")
        v32("global")
        if u12.isLobbyServer() then
            u7.Info("[SETUP] Loading Lobby Knit modules (client)...")
            v32("lobby")
        end
        if u12.isAfkServer() then
            u7.Info("[SETUP] Loading AFK Place Knit modules (client)...")
            v32("afk-place")
        end
        if u12.isGameServer() then
            u7.Info("[SETUP] Loading Game Knit modules (client)...")
            v32("game")
            v32("games")
        end
        u7.Info("[SETUP] Loading Anti-Cheat Knit modules (client)...")
        u1.Promise.new(function(p33, p34) --[[ Line: 128 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            local v35 = u25:WaitForChild("Modules", 14.5)
            if v35 ~= nil then
                v35 = v35:WaitForChild("anticheat", 14.5)
            end
            if v35 then
                p33(v35)
            else
                p34()
            end
        end):timeout(15):andThen(function(p36) --[[ Line: 140 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22(p36, true)
        end):catch(function(p37) --[[ Line: 143 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u6
                [3] = u8
                [4] = u4
            --]]
            u7.Fatal("[SETUP] Failed to setup client anticheat modules for reason " .. u6(p37))
            task.spawn(function() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u4
                --]]
                u8:Teleport(u4.LOBBY)
            end)
        end):await()
        local u38 = os.clock()
        u5.Start():andThen(function() --[[ Line: 150 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u7
                [3] = u14
            --]]
            local v39 = (os.clock() - u38) * 1000
            local v40 = math.floor(v39)
            local v41 = u14
            u7.Info("[Knit Client]: Started " .. tostring(v41) .. " controllers in " .. tostring(v40) .. "ms")
        end):catch(function(p42) --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u6
            --]]
            u7.Warn("[Knit Client] Error: " .. u6(p42))
        end)
    end
}