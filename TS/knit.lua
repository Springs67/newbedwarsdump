-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local PlaceId = v1.PlaceId;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local TeleportService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TeleportService;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local patchKnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "knit", "patch-knit").patchKnitClient;
local SharedModules = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "shared-modules").SharedModules;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local ClientBlockEngine = RuntimeLib.import(script, script.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;

return {
    setup = function() -- Line: 15, Name: setup
        -- upvalues: DeviceUtil (copy), TeleportService (copy), PlaceId (copy), default (copy), ClientBlockEngine (copy), SharedModules (copy), PlaceUtil (copy), patchKnitClient (copy), KnitClient (copy), u3 (copy), RuntimeLib (copy), u2 (copy)
        DeviceUtil.isMobileControls();

        local function _() -- Line: 18
            -- upvalues: TeleportService (ref), PlaceId (ref)
            task.spawn(function() -- Line: 19
                -- upvalues: TeleportService (ref), PlaceId (ref)
                TeleportService:Teleport(PlaceId.LOBBY);
            end);
        end;

        default.Info("[SETUP] Loading Client Block Engine...");
        default.Info("[SETUP] Loading Global modules (client, shared)...");
        SharedModules.loadGlobalModules();

        if PlaceUtil.isLobbyServer() then
            default.Info("[SETUP] Loading Lobby modules (client, shared)...");
            SharedModules.loadLobbyModules();
        end;

        if PlaceUtil.isGameServer() then
            default.Info("[SETUP] Loading Game modules (client, shared)...");
            SharedModules.loadGameModules("bedwars");
        end;

        if PlaceUtil.isAfkServer() then
            default.Info("[SETUP] Loading AFK Place modules (client, shared)...");
            SharedModules.loadAfkModules();
        end;

        default.Info("[SETUP] Patching Knit Client...");
        patchKnitClient(KnitClient);
        local u4 = 0;

        local function loadModules(p5, p6) -- Line: 49
            -- upvalues: u3 (ref), RuntimeLib (ref), default (ref), u4 (ref), loadModules (copy)
            if p6 == nil then
                p6 = false;
            end;

            for _, child in p5:GetChildren() do
                if child:IsA("ModuleScript") and u3.includes(child.Name, "controller") then
                    RuntimeLib.Promise.new(function(u7, u8) -- Line: 55
                        -- upvalues: RuntimeLib (ref), child (copy)
                        RuntimeLib.try(function() -- Line: 56
                            -- upvalues: u7 (copy), child (ref)
                            u7(require(child));
                        end, function(p9) -- Line: 58
                            -- upvalues: u8 (copy)
                            u8(p9);
                        end);
                    end):timeout(10):catch(function(p10) -- Line: 61
                        -- upvalues: default (ref), child (copy)
                        default.Warn("Error while trying to require controller script " .. child.Name .. " with reason: " .. tostring(p10));
                    end):await();
                    u4 = u4 + 1;
                elseif p6 and child:IsA("Folder") then
                    loadModules(child, true);
                end;
            end;
        end;

        local Parent = script.Parent;

        if not Parent then
            default.Fatal("[SETUP] Knit file (client) does not have parent.");
            task.spawn(function() -- Line: 19
                -- upvalues: TeleportService (ref), PlaceId (ref)
                TeleportService:Teleport(PlaceId.LOBBY);
            end);

            return nil;
        end;

        local controllers = Parent:FindFirstChild("controllers");

        if not controllers then
            default.Fatal("[SETUP] Missing controllers folder.");
            task.spawn(function() -- Line: 19
                -- upvalues: TeleportService (ref), PlaceId (ref)
                TeleportService:Teleport(PlaceId.LOBBY);
            end);

            return nil;
        end;

        local Parent2 = Parent.Parent;

        if not Parent2 then
            default.Fatal("[SETUP] Missing starter player scripts folder.");
            task.spawn(function() -- Line: 19
                -- upvalues: TeleportService (ref), PlaceId (ref)
                TeleportService:Teleport(PlaceId.LOBBY);
            end);

            return nil;
        end;

        local function v17(u11) -- Line: 90
            -- upvalues: RuntimeLib (ref), controllers (copy), loadModules (copy), default (ref), u2 (ref), TeleportService (ref), PlaceId (ref)
            RuntimeLib.Promise.new(function(p12, p13) -- Line: 91
                -- upvalues: controllers (ref), u11 (copy)
                local v14 = controllers:WaitForChild(u11, 14.5);

                if v14 then
                    p12(v14);

                    return;
                end;

                p13();
            end):timeout(15):andThen(function(p15) -- Line: 99
                -- upvalues: loadModules (ref)
                loadModules(p15, true);
            end):catch(function(p16) -- Line: 102
                -- upvalues: default (ref), u11 (copy), u2 (ref), TeleportService (ref), PlaceId (ref)
                default.Fatal("[SETUP] Failed to setup client " .. u11 .. " modules for reason " .. u2(p16));
                task.spawn(function() -- Line: 19
                    -- upvalues: TeleportService (ref), PlaceId (ref)
                    TeleportService:Teleport(PlaceId.LOBBY);
                end);
            end):await();
        end;

        default.Info("[SETUP] Loading Global Knit modules (client)...");
        v17("global");

        if PlaceUtil.isLobbyServer() then
            default.Info("[SETUP] Loading Lobby Knit modules (client)...");
            v17("lobby");
        end;

        if PlaceUtil.isAfkServer() then
            default.Info("[SETUP] Loading AFK Place Knit modules (client)...");
            v17("afk-place");
        end;

        if PlaceUtil.isGameServer() then
            default.Info("[SETUP] Loading Game Knit modules (client)...");
            v17("game");
            v17("games");
        end;

        default.Info("[SETUP] Loading Anti-Cheat Knit modules (client)...");
        RuntimeLib.Promise.new(function(p18, p19) -- Line: 128
            -- upvalues: Parent2 (copy)
            local Modules = Parent2:WaitForChild("Modules", 14.5);

            if Modules ~= nil then
                Modules = Modules:WaitForChild("anticheat", 14.5);
            end;

            if Modules then
                p18(Modules);

                return;
            end;

            p19();
        end):timeout(15):andThen(function(p20) -- Line: 140
            -- upvalues: loadModules (copy)
            loadModules(p20, true);
        end):catch(function(p21) -- Line: 143
            -- upvalues: default (ref), u2 (ref), TeleportService (ref), PlaceId (ref)
            default.Fatal("[SETUP] Failed to setup client anticheat modules for reason " .. u2(p21));
            task.spawn(function() -- Line: 19
                -- upvalues: TeleportService (ref), PlaceId (ref)
                TeleportService:Teleport(PlaceId.LOBBY);
            end);
        end):await();
        local u22 = os.clock();
        KnitClient.Start():andThen(function() -- Line: 150
            -- upvalues: u22 (copy), default (ref), u4 (ref)
            local v23 = (os.clock() - u22) * 1000;
            local v24 = math.floor(v23);
            default.Info("[Knit Client]: Started " .. tostring(u4) .. " controllers in " .. tostring(v24) .. "ms");
        end):catch(function(p25) -- Line: 154
            -- upvalues: default (ref), u2 (ref)
            default.Warn("[Knit Client] Error: " .. u2(p25));
        end);
    end
};