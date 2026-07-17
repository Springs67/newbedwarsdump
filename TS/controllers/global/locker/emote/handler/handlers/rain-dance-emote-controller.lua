-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local NumberSequenceBuilder = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lobby", "ambience", "number-sequence-builder").NumberSequenceBuilder;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = {
    freqSeconds = 0.1,
    airMaxRelativeY = -1.5,
    groundMaxRelativeXz = 0.2,
    airXzSpread = { -1.5, 1.5 },
    groundYSpread = { -0.3, -1 }
};
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "RainDanceEmoteController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 37
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 41
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "RainDanceEmoteController";
end;

function u4.KnitStart(p7) -- Line: 45
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), u1 (copy), NumberSequenceBuilder (copy), RuntimeLib (copy), ReplicatedStorage (copy), Workspace (copy), u3 (copy)
    KnitController.KnitStart(p7);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local RAIN_DANCE = EmoteType.RAIN_DANCE;
    local u8 = EmoteHandler;
    local u9 = setmetatable({}, {
        __tostring = function() -- Line: 53, Name: __tostring
            return "Anonymous";
        end,

        __index = u8
    });
    u9.__index = u9;

    function u9.new(...) -- Line: 59
        -- upvalues: u9 (ref)
        local v10 = setmetatable({}, u9);

        return v10:constructor(...) or v10;
    end;

    function u9.constructor(p11, ...) -- Line: 63
        -- upvalues: u8 (copy), u1 (ref), NumberSequenceBuilder (ref)
        u8.constructor(p11, ...);
        p11.baseBeam = u1("Beam", {
            Enabled = true,
            Texture = "rbxassetid://8030734851",
            TextureSpeed = 2,
            FaceCamera = true,
            Segments = 1,
            Width0 = 0.1,
            Width1 = 0.1,
            Transparency = NumberSequenceBuilder.new():addKeypoint(0, 0.5):addKeypoint(1, 0.3):build(),
            Color = ColorSequence.new(Color3.fromRGB(59, 207, 195))
        });
    end;

    function u9.onEnable(u12, p13, u14, p15, u16) -- Line: 77
        -- upvalues: RuntimeLib (ref), ReplicatedStorage (ref), Workspace (ref), u1 (ref), u3 (ref)
        local u31 = RuntimeLib.Promise.delay(1):andThen(function() -- Line: 78
            -- upvalues: ReplicatedStorage (ref), u14 (copy), Workspace (ref), u16 (copy), u1 (ref), u12 (copy), u3 (ref)
            local v17 = ReplicatedStorage.Assets.Effects.Cloud:Clone();
            v17.Position = u14:GetPivot().Position + Vector3.new(0, 6, 0);
            v17.Parent = Workspace;
            local Cloud = v17:FindFirstChild("Cloud");

            if Cloud then
                Cloud.Enabled = true;
            end;

            u16:GiveTask(v17);
            wait(1);
            local v18 = false;
            local v19 = 0;
            local u20 = {};
            local u21 = {};
            local u22 = {};

            while true do
                if v18 then
                    v19 = v19 + 1;
                else
                    v18 = true;
                end;

                if v19 >= 15 then
                    u16:GiveTask(task.spawn(function() -- Line: 122
                        -- upvalues: u3 (ref), u20 (copy), u22 (copy), u21 (copy), u12 (ref)
                        while { wait(u3.freqSeconds) } do
                            local v23 = math.random() * (#u20 - 1);
                            local v24 = math.round(v23);
                            local v25 = u20[v24 + 1];
                            local v26 = u22[v24 + 1];
                            local v27 = u21[v24 + 1];

                            if not v25.Enabled then
                                v27.Position = u12:getRandomAirAttachmentPosition();
                                v26.Position = u12:getRandomGroundAttachmentPosition(v27.Position);
                            end;

                            v25.Enabled = not v25.Enabled;
                        end;
                    end));

                    return;
                end;

                local v28 = u1("Attachment", {
                    Parent = v17,
                    Position = u12:getRandomAirAttachmentPosition()
                });
                local v29 = u1("Attachment", {
                    Parent = v17,
                    Position = u12:getRandomGroundAttachmentPosition(v28.Position)
                });
                local v30 = u12.baseBeam:Clone();
                v30.Parent = v17;
                v30.Attachment0 = v28;
                v30.Attachment1 = v29;
                table.insert(u20, v30);
                table.insert(u21, v28);
                table.insert(u22, v29);
            end;
        end);
        u16:GiveTask(function() -- Line: 136
            -- upvalues: u31 (copy)
            return u31:cancel();
        end);
    end;

    function u9.onDisable(p32, p33, p34, p35) -- Line: 140
    end;

    function u9.getRandomAirAttachmentPosition(p36) -- Line: 142
        -- upvalues: u3 (ref)
        local v37 = math.random(u3.airXzSpread[1], u3.airXzSpread[2]);
        local v38 = math.random() * u3.airMaxRelativeY;

        return Vector3.new(v37, v38, math.random(u3.airXzSpread[1], u3.airXzSpread[2]));
    end;

    function u9.getRandomGroundAttachmentPosition(p39, p40) -- Line: 145
        -- upvalues: u3 (ref)
        local v41 = math.random() * (u3.groundYSpread[2] - u3.groundYSpread[1]) + u3.groundYSpread[1];
        local v42 = math.random() * u3.groundMaxRelativeXz;
        local v43 = math.random() * u3.groundMaxRelativeXz;

        return p40 + Vector3.new(v42, v41, v43);
    end;

    EmoteHandlerController:registerHandler(RAIN_DANCE, u9);
end;

KnitClient.CreateController(u4.new());

return nil;