-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "electric-arc", "lib");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local RunService = v4.RunService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "SpearTravellingController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 28
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, ...) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7, ...);
    p7.Name = "SpearTravellingController";
    p7.maids = {};
    p7.random = Random.new();
end;

function u5.KnitStart(u8) -- Line: 38
    -- upvalues: KnitController (copy), CollectionService (copy), SoundManager (copy), GameSound (copy), u2 (copy), u3 (copy), u1 (copy), RunService (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u8);
    CollectionService:GetInstanceAddedSignal("spear-projectile"):Connect(function(u9) -- Line: 40
        -- upvalues: SoundManager (ref), GameSound (ref), u2 (ref), u8 (copy), u3 (ref), u1 (ref), RunService (ref)
        SoundManager:playSound(GameSound.WIZARD_ORB_TRAVEL_LOOP, {
            rollOffMaxDistance = 100,
            parent = u9.PrimaryPart,
            position = u9:GetPrimaryPartCFrame().Position
        });
        local v10 = u2.new();
        u8.maids[u9] = v10;
        local v11 = u8.random:NextInteger(3, 6);
        local u12 = table.create(v11);
        local v13 = false;
        local v14 = 0;

        while true do
            if v13 then
                v14 = v14 + 1;
            else
                v13 = true;
            end;

            if v14 >= v11 then
                v10:GiveTask(function() -- Line: 82
                    -- upvalues: u12 (copy)
                    for _, v in u12 do
                        v.arc:Destroy();
                        v.goalAttachment:Destroy();
                        v.sourceAttachment:Destroy();
                    end;
                end);
                v10:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 89
                    -- upvalues: u12 (copy), u9 (copy)
                    for _, v in u12 do
                        if u9.PrimaryPart == nil then
                            return nil;
                        end;

                        local Position = u9:GetPrimaryPartCFrame().Position;
                        local v15 = CFrame.lookAt(Position, Position + u9.PrimaryPart.AssemblyLinearVelocity.Unit) * CFrame.new(0, 0, -5);
                        local v16 = v15 * CFrame.new(math.noise(time() * 5, 0, v.seed) * 4, math.noise(time() * 5, 0, -v.seed) * 4, 10 + math.noise(time() * 5, 0, v.seed + v.seed) * 2);
                        v.sourceAttachment.WorldCFrame = v15;
                        v.goalAttachment.WorldCFrame = v16;
                    end;
                end));

                return;
            end;

            local v17 = u3("Attachment", {
                Parent = u9.PrimaryPart
            });
            local v18 = u3("Attachment", {
                Parent = u9.PrimaryPart
            });
            local v19 = u1.link(v17, v18, Color3.fromRGB(0, 0, 0), nil, 1);
            v19:SetColor(Color3.fromRGB(97, 157, 236):Lerp(Color3.fromRGB(70, 109, 236), u8.random:NextNumber()));
            local v20 = {
                goalAttachment = v18,
                sourceAttachment = v17,
                seed = u8.random:NextNumber(0, 100),
                arc = v19
            };
            table.insert(u12, v20);
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("spear-projectile"):Connect(function(p21) -- Line: 107
        -- upvalues: u8 (copy)
        local v22 = u8.maids[p21];

        if v22 ~= nil then
            v22:DoCleaning();
        end;

        u8.maids[p21] = nil;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p23) -- Line: 115
        -- upvalues: CollectionService (ref)
        if p23.projectileType == "spear" then
            CollectionService:AddTag(p23.projectile, "spear-projectile");
        end;
    end);
end;

KnitClient.CreateController(u5.new());

return nil;