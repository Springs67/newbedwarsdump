-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out");
local BlockEngine = v1.BlockEngine;
local GreedyBlockHandler = v1.GreedyBlockHandler;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v2.ColorUtil;
local GameQueryUtil = v2.GameQueryUtil;
local SoundManager = v2.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v3.Linear;
local OutQuad = v3.OutQuad;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v6.ReplicatedStorage;
local Workspace = v6.Workspace;
local Shuffle = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tableutil").Shuffle;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local getItemTypeFromId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type-id").getItemTypeFromId;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 32, Name: __tostring
        return "BlockDebrisController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 38
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 42
    -- upvalues: KnitController (copy)
    KnitController.constructor(p9);
    p9.Name = "BlockDebrisController";
end;

function u7.KnitStart(u10) -- Line: 46
    -- upvalues: KnitController (copy), default2 (copy), getItemTypeFromId (copy)
    KnitController.KnitStart(u10);
    default2.Client:Get("BlockDebris"):Connect(function(p11, p12, p13, p14, p15, p16) -- Line: 48
        -- upvalues: u10 (copy)
        local function _(p17) -- Line: 54
            return {
                blockPosition = p17.blockPosition,
                blockType = p17.blockType,
                blockData = p17.blockData
            };
        end;

        local v18 = table.create(#p11);

        for i, v in p11 do
            local _ = i - 1;
            v18[i] = {
                blockPosition = v.blockPosition,
                blockType = v.blockType,
                blockData = v.blockData
            };
        end;

        u10:processDebrisRequest(v18, p12, p13, p14, p15, p16 == nil and 1 or p16);
    end);
    default2.Client:Get("BlockDecayDebris"):Connect(function(u19) -- Line: 69
        -- upvalues: u10 (copy), getItemTypeFromId (ref)
        local success, result = pcall(function() -- Line: 70
            -- upvalues: u10 (ref), u19 (copy), getItemTypeFromId (ref)
            local v20 = u19;

            local function _(p21) -- Line: 73
                -- upvalues: getItemTypeFromId (ref)
                return {
                    blockPosition = p21.p,
                    blockType = getItemTypeFromId(p21.b),
                    blockData = p21.d
                };
            end;

            local v22 = table.create(#v20);

            for i, v in v20 do
                local _ = i - 1;
                v22[i] = {
                    blockPosition = v.p,
                    blockType = getItemTypeFromId(v.b),
                    blockData = v.d
                };
            end;

            u10:processDebrisRequest(v22, Vector3.new(0, -1, 0), nil, nil, true);
        end);

        if not success then
            warn(result);
        end;
    end);
end;

function u7.processDebrisRequest(u23, p24, u25, u26, u27, u28, p29) -- Line: 93
    -- upvalues: Shuffle (copy), BlockEngine (copy), RuntimeLib (copy), GreedyBlockHandler (copy), Workspace (copy), default (copy), OutQuad (copy)
    local v30 = Shuffle(p24);
    local v31 = 0;
    local u32 = 0;

    for _, v in v30 do
        local u33 = p29 == nil and true or v31 / #v30 < p29;
        local v34 = BlockEngine:getHandlerRegistry():getHandler(v.blockType);

        if RuntimeLib.instanceof(v34, GreedyBlockHandler) then
            local u35 = v34:createNewInstance(v.blockData);
            u35.Anchored = true;
            u35.CanCollide = false;
            u35.CanQuery = false;
            local u36 = CFrame.new(BlockEngine:getWorldPosition(v.blockPosition));
            u35.CFrame = u36;
            u35.Parent = Workspace;
            default(0.06, OutQuad, function(p37) -- Line: 109
                -- upvalues: u36 (copy), u25 (copy), u35 (copy)
                local v38 = u36 * CFrame.Angles((math.random() - 0.5) * 0.13962634015954636, (math.random() - 0.5) * 0.5235987755982988, 0);

                if u25 and u25.Magnitude ~= 0 then
                    v38 = v38 + u25.Unit * 0.8;
                end;

                u35.CFrame = u36:Lerp(v38, p37);
            end);
            task.delay(0.06, function() -- Line: 120
                -- upvalues: u33 (copy), u28 (copy), u23 (copy), u35 (copy), v (copy), u25 (copy), u32 (ref), u26 (copy), u27 (copy)
                if u33 then
                    if u28 then
                        u23:convertBlockToDebris(u35, v.blockType, v.blockPosition, u25 or Vector3.new(0, 0, 0), u32, u26, u27, nil, u28);
                    else
                        local v39 = false;
                        local v40 = 0;

                        while true do
                            if true then
                                if v39 then
                                    v40 = v40 + 1;
                                else
                                    v39 = true;
                                end;
                            end;

                            if v40 >= 0.8 + math.random() * 1 then
                                break;
                            end;

                            local v41 = u32;
                            u32 = u32 + 1;

                            if v41 > 30 then
                                break;
                            end;

                            u23:convertBlockToDebris(u35, v.blockType, v.blockPosition, u25 or Vector3.new(0, 0, 0), u32, u26, u27);
                        end;
                    end;
                end;

                u35:Destroy();
            end);
        end;

        v31 = v31 + 1;
    end;
end;

function u7.createDebris(p42, p43, p44, p45, p46) -- Line: 153
    -- upvalues: u4 (copy), Workspace (copy), u5 (copy)
    local v47 = u4.new();
    local v48 = {
        Name = "DebrisPart"
    };
    local v49;

    if p46 == nil then
        v49 = p46;
    else
        v49 = p46.material;
    end;

    if v49 == nil then
        v49 = Enum.Material.SmoothPlastic;
    end;

    v48.Material = v49;
    v48.CanQuery = false;
    v48.CanTouch = false;
    v48.Color = p44;
    local v50;

    if p46 == nil then
        v50 = p46;
    else
        v50 = p46.transparency;
    end;

    v48.Transparency = v50 == nil and 0 or v50;
    local v51;

    if p46 == nil then
        v51 = p46;
    else
        v51 = p46.size;
    end;

    if v51 == nil then
        local v52 = 0.9 + math.random() * 0.5;
        local v53 = 0.9 + math.random() * 0.5;
        v51 = Vector3.new(0.6, v52, v53);
    end;

    v48.Size = v51;
    v48.Anchored = false;
    v48.CanCollide = true;
    v48.Parent = Workspace;
    local v54 = u5("WedgePart", v48);
    v47:GiveTask(v54);
    local v55;

    if p46 == nil then
        v55 = p46;
    else
        v55 = p46.debrisId;
    end;

    local v56;

    if p46 == nil then
        v56 = p46;
    else
        v56 = p46.burnDebris;
    end;

    if p46 ~= nil then
        p46 = p46.burnColors;
    end;

    p42:setupAndThrowDebris(v54, p43, p45, v55, v56, p46);

    return v47;
end;

function u7.setupAndThrowDebris(p57, u58, p59, p60, p61, p62, u63, p64) -- Line: 214
    -- upvalues: GameQueryUtil (copy), BLOCK_SIZE (copy), ReplicatedStorage (copy), ColorUtil (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), default (copy), Linear (copy)
    u58.CollisionGroup = "Players";
    GameQueryUtil:setQueryIgnored(u58, true);
    local v65 = math.random() * 3.141592653589793 * 2;
    local v66 = math.random() * 10 + 5;
    local Unit = p60.Unit;
    local v67 = 5 + math.random() * 5;
    local v68 = v66 * math.cos(v65);
    local v69 = 5 + 5 * math.random();
    local v70 = v66 * math.sin(v65);
    local v71 = Vector3.new(v68, v69, v70);
    u58:ApplyImpulse(Unit * v67 + v71 * u58.Mass);
    local v72 = math.random() - 0.5;
    local v73 = math.random() - 0.5;
    local v74 = math.random() - 0.5;
    u58.Position = p59 + Vector3.new(v72, v73, v74) * (BLOCK_SIZE * 0.8);
    u58.CFrame = CFrame.new(u58.Position) * CFrame.Angles(math.random() * 3.141592653589793 * 2, math.random() * 3.141592653589793 * 2, math.random() * 3.141592653589793 * 2);
    local Name = u58.Name;

    if Name == "" or not Name then
        local function _(p75) -- Line: 235
            if p75:IsA("Texture") then
                p75.StudsPerTileU = 1.4;
                p75.StudsPerTileV = 1.4;
            end;
        end;

        for i, descendant in u58:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("Texture") then
                descendant.StudsPerTileU = 1.4;
                descendant.StudsPerTileV = 1.4;
            end;
        end;
    end;

    if math.random() < 0.8 and p62 then
        local v76 = ReplicatedStorage.Assets.Effects.Burn:GetChildren();

        local function _(p77) -- Line: 248
            return p77:Clone();
        end;

        local v78 = table.create(#v76);

        for i, v in v76 do
            local _ = i - 1;
            v78[i] = v:Clone();
        end;

        for _, v in v78 do
            v.Parent = u58;
        end;

        local v79 = u58:GetDescendants();

        local function v87(p80) -- Line: 261
            -- upvalues: u63 (copy), ColorUtil (ref)
            if p80:IsA("ParticleEmitter") then
                p80.Rate = p80.Rate * 0.5 * math.random();
                p80.VelocityInheritance = 0.5;
                p80.Acceleration = Vector3.new(0, 20, 0);
                p80.Speed = NumberRange.new(0, 0);
                local u81;

                if u63 then
                    u81 = u63[1];
                else
                    u81 = ColorUtil.hexColor(15903638);
                end;

                local u82;

                if u63 then
                    u82 = u63[2];
                else
                    u82 = ColorUtil.hexColor(14631746);
                end;

                if math.random() < 0.5 then
                    local Keypoints = p80.Color.Keypoints;

                    local function _(p83, p84) -- Line: 271
                        -- upvalues: u81 (copy), u82 (copy)
                        local Value = p83.Value;

                        if p84 == 0 then
                            Value = u81;
                        end;

                        if p84 == 1 then
                            Value = u82;
                        end;

                        return ColorSequenceKeypoint.new(p83.Time, Value);
                    end;

                    local v85 = table.create(#Keypoints);

                    for i, v in Keypoints do
                        local v86 = i - 1;
                        local Value = v.Value;

                        if v86 == 0 then
                            Value = u81;
                        end;

                        if v86 == 1 then
                            Value = u82;
                        end;

                        v85[i] = ColorSequenceKeypoint.new(v.Time, Value);
                    end;

                    p80.Color = ColorSequence.new(v85);
                end;
            end;
        end;

        for i, v in v79 do
            v87(v, i - 1, v79);
        end;

        EffectUtil:scaleEffect({ u58 }, 0.3);

        if p61 == nil or p61 < 5 then
            SoundManager:playSound(GameSound.BURN_LOOP, {
                volumeMultiplier = 0.5,
                rollOffMinDistance = 9,
                rollOffMaxDistance = 25,
                looped = true,
                parent = u58
            });
        end;
    end;

    task.delay(math.random() * 5, function() -- Line: 306
        -- upvalues: u58 (copy)
        if not u58.Parent then
            return nil;
        end;

        local function _(p88) -- Line: 311
            if p88:IsA("ParticleEmitter") then
                p88.Enabled = false;
            end;
        end;

        for i, descendant in u58:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = false;
            end;
        end;
    end);
    task.delay((p64 == nil and 6 or p64) + math.random() * 3, function() -- Line: 326
        -- upvalues: u58 (copy), default (ref), Linear (ref)
        if not u58.Parent then
            return nil;
        end;

        local Size = u58.Size;
        default(0.22, Linear, function(p89) -- Line: 331
            -- upvalues: u58 (ref), Size (copy)
            if not u58.Parent then
                return nil;
            end;

            u58.Transparency = p89;
            u58.Size = Size * (1 - p89);
        end);
        task.delay(0.5, function() -- Line: 339
            -- upvalues: u58 (ref)
            u58:Destroy();
        end);
    end);
end;

function u7.convertBlockToDebris(p90, p91, p92, p93, p94, p95, p96, p97, p98, p99, p100, p101, p102) -- Line: 344
    -- upvalues: u4 (copy), u5 (copy), Workspace (copy), getItemMeta (copy), BlockEngine (copy)
    local v103 = u4.new();
    local u104;

    if p99 then
        u104 = u5("Part", {
            Name = "blockDebris",
            Size = Vector3.new(3, 3, 3),
            CanCollide = false,
            CanQuery = false,
            CanTouch = false,
            Anchored = false,
            Position = p93,
            Parent = Workspace
        });
    else
        local v105 = {
            Material = p100 or p91.Material,
            Color = p101 or p91.Color
        };
        local v106;

        if p102 == nil then
            v106 = p102;
        else
            v106 = p102.X;
        end;

        local v107;

        if p102 == nil then
            v107 = p102;
        else
            v107 = p102.Y;
        end;

        local v108 = (v107 == nil and 0.9 or v107) + math.random() * 0.5;

        if p102 ~= nil then
            p102 = p102.Z;
        end;

        local v109 = (p102 == nil and 0.9 or p102) + math.random() * 0.5;
        v105.Size = Vector3.new(v106 == nil and 0.6 or v106, v108, v109);
        v105.Anchored = false;
        v105.CanCollide = true;
        v105.Parent = Workspace;
        u104 = u5("WedgePart", v105);
    end;

    v103:GiveTask(u104);
    local block = getItemMeta(p92).block;

    if block ~= nil then
        block = block.greedyMesh;

        if block ~= nil then
            block = block.textures;
        end;
    end;

    if block then
        u5("Texture", {
            Name = "Top",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Top,
            Texture = block[1],
            Parent = u104
        });
        local v110 = {
            Name = "Bottom",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Bottom
        };
        local v111;

        if #block == 1 then
            v111 = block[1];
        else
            v111 = block[2];
        end;

        v110.Texture = v111;
        v110.Parent = u104;
        u5("Texture", v110);
        local v112 = {
            Name = "Left",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Left
        };
        local v113;

        if #block == 1 then
            v113 = block[1];
        else
            v113 = block[3];
        end;

        v112.Texture = v113;
        v112.Parent = u104;
        u5("Texture", v112);
        local v114 = {
            Name = "Front",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Front
        };
        local v115;

        if #block == 1 then
            v115 = block[1];
        else
            v115 = block[4];
        end;

        v114.Texture = v115;
        v114.Parent = u104;
        u5("Texture", v114);
        local v116 = {
            Name = "Right",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Right
        };
        local v117;

        if #block == 1 then
            v117 = block[1];
        else
            v117 = block[5];
        end;

        v116.Texture = v117;
        v116.Parent = u104;
        u5("Texture", v116);
        local v118 = {
            Name = "Back",
            StudsPerTileU = 3,
            StudsPerTileV = 3,
            Face = Enum.NormalId.Back
        };
        local v119;

        if #block == 1 then
            v119 = block[1];
        else
            v119 = block[6];
        end;

        v118.Texture = v119;
        v118.Parent = u104;
        u5("Texture", v118);
    end;

    local function _(p120) -- Line: 455
        -- upvalues: u104 (ref)
        p120:Clone().Parent = u104;
    end;

    for i, child in p91:GetChildren() do
        local _ = i - 1;
        child:Clone().Parent = u104;
    end;

    p90:setupAndThrowDebris(u104, BlockEngine:getWorldPosition(p93), p94, p95, p96, p97, p98);

    return v103;
end;

KnitClient.CreateController(u7.new());

return nil;