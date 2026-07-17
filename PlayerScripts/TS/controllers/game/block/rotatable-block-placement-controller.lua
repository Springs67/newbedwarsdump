-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local getBlockRotationNormalsList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-modules", "game", "block-engine", "handlers", "rotatable-greedy-block-handler").getBlockRotationNormalsList;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "RotatableBlockController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "RotatableBlockController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), getItemMeta (copy), Workspace (copy), getBlockRotationNormalsList (copy)
    KnitController.KnitStart(p4);
    ClientSyncEvents.PlaceBlock:connect(function(p5) -- Line: 29
        -- upvalues: getItemMeta (ref), Workspace (ref), getBlockRotationNormalsList (ref)
        local block = getItemMeta(p5.blockType).block;

        if block ~= nil then
            block = block.greedyMesh;

            if block ~= nil then
                block = block.rotation;
            end;
        end;

        if not block then
            return nil;
        end;

        local Unit = Workspace.CurrentCamera.CFrame.LookVector.Unit;
        local u6 = getBlockRotationNormalsList();

        local function _(p7) -- Line: 43
            -- upvalues: u6 (copy), Unit (copy)
            local v8 = u6[p7 + 1];

            if v8 == Enum.NormalId.Top then
                v8 = Enum.NormalId.Bottom;
            elseif v8 == Enum.NormalId.Bottom then
                v8 = Enum.NormalId.Top;
            end;

            return (Unit - Vector3.FromNormalId(v8) * Vector3.new(1, 2, 1)).Magnitude;
        end;

        local v9 = false;
        local v10 = 0;
        local v11 = -1;

        while true do
            if v9 then
                v10 = v10 + 1;
            else
                v9 = true;
            end;

            if v10 >= #u6 then
                if v11 ~= -1 then
                    p5.blockData = v11;
                end;

                return;
            end;

            local v12 = u6[v10 + 1];
            local disallowedRotationDirections = block.disallowedRotationDirections;

            if disallowedRotationDirections ~= nil then
                disallowedRotationDirections = table.find(disallowedRotationDirections, v12) ~= nil;
            end;

            if not disallowedRotationDirections then
                if v11 == -1 then
                    v11 = v10;
                else
                    local v13 = u6[v10 + 1];

                    if v13 == Enum.NormalId.Top then
                        v13 = Enum.NormalId.Bottom;
                    elseif v13 == Enum.NormalId.Bottom then
                        v13 = Enum.NormalId.Top;
                    end;

                    local Magnitude = (Unit - Vector3.FromNormalId(v13) * Vector3.new(1, 2, 1)).Magnitude;
                    local v14 = u6[v11 + 1];

                    if v14 == Enum.NormalId.Top then
                        v14 = Enum.NormalId.Bottom;
                    elseif v14 == Enum.NormalId.Bottom then
                        v14 = Enum.NormalId.Top;
                    end;

                    if Magnitude < (Unit - Vector3.FromNormalId(v14) * Vector3.new(1, 2, 1)).Magnitude then
                        v11 = v10;
                    end;
                end;
            end;
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;