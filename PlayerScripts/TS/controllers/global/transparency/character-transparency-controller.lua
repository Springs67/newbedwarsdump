-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local StatusModifier = v1.StatusModifier;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "CharacterTransparencyController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 20
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "CharacterTransparencyController";
    p5.transparencyModifiers = {};
    p5.overrideModifiers = {};
    p5.modifierSetByUpdate = {};
end;

function u3.KnitStart(u6) -- Line: 31
    -- upvalues: WatchCollectionTag (copy), EntityUtil (copy), u2 (copy)
    WatchCollectionTag("entity", function(u7) -- Line: 32
        -- upvalues: EntityUtil (ref), u2 (ref), u6 (copy)
        local u8 = EntityUtil:getEntity(u7);

        if u8 ~= nil then
            u8 = u8:getInstance();
        end;

        if not u8 then
            return nil;
        end;

        local u9 = u2.new();
        u9:GiveTask(u8.AncestryChanged:Connect(function() -- Line: 43
            -- upvalues: u7 (copy), u9 (copy)
            if not u7.Parent then
                u9:DoCleaning();
            end;
        end));
        local u10 = u6:getTransparencyModifier(u8);
        u9:GiveTask(function() -- Line: 49
            -- upvalues: u6 (ref), u8 (copy)
            u6.transparencyModifiers[u8] = nil;
            u6.overrideModifiers[u8] = nil;
            u6.modifierSetByUpdate[u8] = nil;
        end);
        u9:GiveTask(u8:GetAttributeChangedSignal("Transparency"):Connect(function() -- Line: 54
            -- upvalues: u8 (copy), u6 (ref), u10 (copy)
            local u11 = u8:GetAttribute("Transparency");

            if u11 == u6.modifierSetByUpdate[u8] then
                return nil;
            end;

            local v12 = {};
            local v13 = #v12;

            for i in u10:getModifiers() do
                v13 = v13 + 1;
                v12[v13] = i;
            end;

            local function _(p14) -- Line: 72
                -- upvalues: u11 (copy)
                local v15 = u11;

                return p14.transparency == (v15 == nil and 0 or v15);
            end;

            local v16 = nil;

            for i, v in v12 do
                local _ = i - 1;

                if v.transparency == (u11 == nil and 0 or u11) == true then
                    v16 = v;
                    break;
                end;
            end;

            if not v16 then
                if u6.overrideModifiers[u8] ~= nil then
                    u10:removeModifier(u6.overrideModifiers[u8]);
                end;

                local v17 = {
                    transparency = u11 == nil and 0 or u11
                };
                u10:addModifier(v17);
                u6.overrideModifiers[u8] = v17;
            end;

            u10:updateModifiers();
        end));
    end);
end;

function u3.getTransparencyModifier(u18, u19) -- Line: 109
    -- upvalues: StatusModifier (copy)
    local v20 = u18.transparencyModifiers[u19];

    if v20 then
        return v20;
    end;

    local v25 = StatusModifier.new(function(p21) -- Line: 116
        -- upvalues: u18 (copy), u19 (copy)
        local v22 = 0;

        if #p21 == 1 then
            v22 = p21[1].transparency;
        elseif #p21 > 1 then
            local function _(p23, p24) -- Line: 123
                return math.max(p23, p24.transparency);
            end;

            v22 = 0;

            for i = 1, #p21 do
                local _ = i - 1;
                v22 = math.max(v22, p21[i].transparency);
            end;
        end;

        u18.modifierSetByUpdate[u19] = v22;
        u19:SetAttribute("Transparency", v22);
    end);
    u18.transparencyModifiers[u19] = v25;
    v25:updateModifiers();

    return v25;
end;

function u3.getCharacterWithoutModifiers(u26, u27) -- Line: 148
    local v28 = u26:getTransparencyModifier(u27):getModifiers();
    u26:getTransparencyModifier(u27):clear();
    local v29 = u27:Clone();

    local function _(p30) -- Line: 152
        -- upvalues: u26 (copy), u27 (copy)
        u26:getTransparencyModifier(u27):addModifier(p30);
    end;

    for i in v28 do
        u26:getTransparencyModifier(u27):addModifier(i);
    end;

    return v29;
end;

KnitClient.CreateController(u3.new());

return nil;