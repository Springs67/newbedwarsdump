-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "WhirlwindEffectController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "WhirlwindEffectController";
    p5.whirlwindBlocksMap = {};
    p5.activeWhirlwinds = {};
end;

function u3.KnitStart(u6) -- Line: 35
    -- upvalues: KnitController (copy), default2 (copy)
    KnitController.KnitStart(u6);
    default2.Client:OnEvent("WhirlwindEffect", function(p7) -- Line: 37
        -- upvalues: u6 (copy)
        u6:initializeWhirlwindBlock(p7.id, p7.blockType, p7.startPosition, p7.originPart);
    end);
end;

u3.initializeWhirlwindBlock = RuntimeLib.async(function(p8, p9, p10, p11, p12) -- Line: 41
    -- upvalues: MapUtil (copy)
    local v13 = MapUtil.getOrCreate(p8.whirlwindBlocksMap, p9, {});
    local v14 = {
        duration = 0,
        elapsedTime = 0,
        travelling = true,
        debris = p8:getDebrisBlock(p10, p11),
        originPart = p12
    };
    local v15 = math.random(-5, 5);
    local v16 = math.random(-10, 20);
    v14.offset = Vector3.new(v15, v16, math.random(-5, 5));
    v14.circleOffset = math.random(0, 100);
    table.insert(v13, v14);
    local v17 = #v13 > 60 and table.remove(v13, 1);

    if v17 then
        p8:destroyDebris(v17.debris);
    end;

    if table.find(p8.activeWhirlwinds, p9) == nil then
        p8:activateWhirlwind(p9);
    end;

    return true;
end);

function u3.activateWhirlwind(u18, u19) -- Line: 67
    -- upvalues: RunService (copy), MapUtil (copy)
    table.insert(u18.activeWhirlwinds, u19);
    RunService.Heartbeat:Connect(function(p20) -- Line: 73
        -- upvalues: MapUtil (ref), u18 (copy), u19 (copy)
        for _, v in MapUtil.getOrCreate(u18.whirlwindBlocksMap, u19, {}) do
            v.elapsedTime = v.elapsedTime + p20;
            local Position = v.originPart.Position;
            local v21 = math.sin((v.elapsedTime + v.circleOffset) * 3) * 10;
            local v22 = math.cos((v.elapsedTime + v.circleOffset) * 5) * 5;
            local v23 = math.cos((v.elapsedTime + v.circleOffset) * 3) * 10;
            local v24 = Position + Vector3.new(v21, v22, v23) + v.offset;

            if v.travelling then
                v.debris:PivotTo(CFrame.new(v.debris.Position:Lerp(v24, 0.1)));

                if (v.debris.Position - v24).Magnitude < 1 then
                    v.travelling = false;
                end;
            else
                v.debris:PivotTo(CFrame.new(v24));
            end;

            local v25 = CFrame.new(v.debris.Position);
            local v26 = CFrame.Angles(v.elapsedTime, v.elapsedTime * 3, v.elapsedTime);
            v.debris.CFrame = v25 * v26;
        end;
    end);
end;

function u3.getDebrisBlock(p27, p28, p29) -- Line: 95
    -- upvalues: u1 (copy), Workspace (copy), getItemMeta (copy)
    local v30 = u1("Part", {
        Name = "blockDebris",
        Size = Vector3.new(3, 3, 3),
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        CastShadow = false,
        Anchored = true,
        Position = p29,
        Parent = Workspace
    });
    local block = getItemMeta(p28).block;

    if block ~= nil then
        block = block.greedyMesh;

        if block ~= nil then
            block = block.textures;
        end;
    end;

    if block then
        u1("Texture", {
            Name = "Top",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Top,
            Texture = block[1],
            Parent = v30
        });
        local v31 = {
            Name = "Bottom",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Bottom
        };
        local v32;

        if #block == 1 then
            v32 = block[1];
        else
            v32 = block[2];
        end;

        v31.Texture = v32;
        v31.Parent = v30;
        u1("Texture", v31);
        local v33 = {
            Name = "Left",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Left
        };
        local v34;

        if #block == 1 then
            v34 = block[1];
        else
            v34 = block[3];
        end;

        v33.Texture = v34;
        v33.Parent = v30;
        u1("Texture", v33);
        local v35 = {
            Name = "Front",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Front
        };
        local v36;

        if #block == 1 then
            v36 = block[1];
        else
            v36 = block[4];
        end;

        v35.Texture = v36;
        v35.Parent = v30;
        u1("Texture", v35);
        local v37 = {
            Name = "Right",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Right
        };
        local v38;

        if #block == 1 then
            v38 = block[1];
        else
            v38 = block[5];
        end;

        v37.Texture = v38;
        v37.Parent = v30;
        u1("Texture", v37);
        local v39 = {
            Name = "Back",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Back
        };
        local v40;

        if #block == 1 then
            v40 = block[1];
        else
            v40 = block[6];
        end;

        v39.Texture = v40;
        v39.Parent = v30;
        u1("Texture", v39);
    end;

    return v30;
end;

u3.destroyDebris = RuntimeLib.async(function(p41, u42) -- Line: 168
    -- upvalues: default (copy), Linear (copy)
    local u43 = u42:GetChildren();
    u42.Transparency = 1;
    default(0.1, Linear, function(p44) -- Line: 171
        -- upvalues: u43 (copy)
        for _, v in u43 do
            if v:IsA("Texture") then
                v.Transparency = p44;
            end;
        end;
    end);
    task.delay(0.5, function() -- Line: 178
        -- upvalues: u42 (copy)
        u42:Destroy();
    end);
end);
KnitClient.CreateController(u3.new());

return nil;