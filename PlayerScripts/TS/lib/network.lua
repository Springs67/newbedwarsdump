-- Decompiled with Potassium's decompiler.

local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");
local u1 = nil;
local u2 = nil;
local u3 = nil;
local u4 = nil;
local u5 = nil;
local u6 = nil;
local u7 = nil;
local u8 = nil;
local u9 = nil;
local _ = {
    CFrame.Angles(0, 0, 0),
    CFrame.Angles(1.5707963267948966, 0, 0),
    CFrame.Angles(0, 3.141592653589793, 3.141592653589793),
    CFrame.Angles(-1.5707963267948966, 0, 0),
    CFrame.Angles(0, 3.141592653589793, 1.5707963267948966),
    CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966),
    CFrame.Angles(0, 0, 1.5707963267948966),
    CFrame.Angles(0, -1.5707963267948966, 1.5707963267948966),
    CFrame.Angles(-1.5707963267948966, -1.5707963267948966, 0),
    CFrame.Angles(0, -1.5707963267948966, 0),
    CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0),
    CFrame.Angles(0, 1.5707963267948966, 3.141592653589793),
    CFrame.Angles(0, -1.5707963267948966, 3.141592653589793),
    CFrame.Angles(0, 3.141592653589793, 0),
    CFrame.Angles(-1.5707963267948966, -3.141592653589793, 0),
    CFrame.Angles(0, 0, 3.141592653589793),
    CFrame.Angles(1.5707963267948966, 3.141592653589793, 0),
    CFrame.Angles(0, 0, -1.5707963267948966),
    CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966),
    CFrame.Angles(0, -3.141592653589793, -1.5707963267948966),
    CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966),
    CFrame.Angles(1.5707963267948966, 1.5707963267948966, 0),
    CFrame.Angles(0, 1.5707963267948966, 0),
    CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0)
};

local function alloc(p10) -- Line: 49
    -- upvalues: u2 (ref), u3 (ref), u1 (ref), u5 (ref)
    if u3 < u2 + p10 then
        while u3 < u2 + p10 do
            u3 = u3 * 2;
        end;

        local v11 = buffer.create(u3);
        buffer.copy(v11, 0, u1, 0, u2);
        u1 = v11;
    end;

    u5 = u2;
    u2 = u2 + p10;

    return u5;
end;

local function read(p12) -- Line: 67
    -- upvalues: u7 (ref)
    local v13 = u7;
    u7 = u7 + p12;

    return v13;
end;

local function save() -- Line: 74
    -- upvalues: u1 (ref), u2 (ref), u3 (ref), u4 (ref)
    return {
        buff = u1,
        used = u2,
        size = u3,
        inst = u4
    };
end;

local function load(p14) -- Line: 83
    -- upvalues: u1 (ref), u2 (ref), u3 (ref), u4 (ref)
    u1 = p14.buff;
    u2 = p14.used;
    u3 = p14.size;
    u4 = p14.inst;
end;

local function load_empty() -- Line: 95
    -- upvalues: u1 (ref), u2 (ref), u3 (ref), u4 (ref)
    u1 = buffer.create(64);
    u2 = 0;
    u3 = 64;
    u4 = {};
end;

u1 = buffer.create(64);
u2 = 0;
u3 = 64;
u4 = {};
local v15 = {};

if not RunService:IsRunning() then
    local function v16() -- Line: 108
    end;

    return table.freeze({
        SendEvents = v16,
        EntityDamageEventZap = table.freeze({
            On = v16
        }),
        PickupItemEventZap = table.freeze({
            On = v16
        }),
        ProjectileLaunchZap = table.freeze({
            On = v16
        }),
        ProjectileImpactZap = table.freeze({
            On = v16
        }),
        UpdateMapDataZap = table.freeze({
            On = v16
        }),
        PlaceBlockEventZap = table.freeze({
            On = v16
        }),
        BreakBlockEventZap = table.freeze({
            On = v16
        }),
        EntityHealEventZap = table.freeze({
            On = v16
        }),
        AddMatchEventCountdownZap = table.freeze({
            On = v16
        }),
        KitsUpdateEventZap = table.freeze({
            On = v16
        }),
        FetchMapDataFuncZap = table.freeze({
            Call = v16
        })
    });
end;

if RunService:IsServer() then
    error("Cannot use the client module on the server!");
end;

local ZAP_RELIABLE = ReplicatedStorage:WaitForChild("ZAP"):WaitForChild("ZAP_RELIABLE");
local v17 = ZAP_RELIABLE:IsA("RemoteEvent");
assert(v17, "Expected ZAP_RELIABLE to be a RemoteEvent");

local function SendEvents() -- Line: 155
    -- upvalues: u2 (ref), u1 (ref), ZAP_RELIABLE (copy), u4 (ref), u3 (ref)
    if u2 ~= 0 then
        local v18 = buffer.create(u2);
        buffer.copy(v18, 0, u1, 0, u2);
        ZAP_RELIABLE:FireServer(v18, u4);
        u1 = buffer.create(64);
        u2 = 0;
        u3 = 64;
        table.clear(u4);
    end;
end;

RunService.Heartbeat:Connect(SendEvents);
local u19 = table.create(11);
local u20 = table.create(11);
local u21 = 0;
u19[0] = {};
u20[0] = {};
u19[1] = {};
u20[1] = {};
u19[2] = {};
u20[2] = {};
u19[3] = {};
u20[3] = {};
u19[4] = {};
u20[4] = {};
u19[5] = {};
u20[5] = {};
u19[6] = {};
u20[6] = {};
u19[7] = {};
u20[7] = {};
u19[8] = {};
u20[8] = {};
u19[9] = {};
u20[9] = {};
u20[10] = table.create(255);
ZAP_RELIABLE.OnClientEvent:Connect(function(p22, p23) -- Line: 195
    -- upvalues: u6 (ref), u8 (ref), u7 (ref), u9 (ref), u19 (copy), u20 (copy)
    u6 = p22;
    u8 = p23;
    u7 = 0;
    u9 = 0;
    local v24 = buffer.len(p22);

    while u7 < v24 do
        local v25 = u7;
        u7 = u7 + 1;
        local v26 = buffer.readu8(p22, v25);

        if v26 == 0 then
            u9 = u9 + 1;
            local v27 = u8[u9];
            assert(v27 ~= nil);
            assert(v27:IsA("Model"));
            local v28 = u7;
            u7 = u7 + 8;
            local v29 = buffer.readf64(u6, v28);
            local v30 = u7;
            u7 = u7 + 1;
            local v31 = buffer.readu8(u6, v30);
            local v32 = u7;
            u7 = u7 + 1;
            local v33;

            if buffer.readu8(u6, v32) == 1 then
                local v34 = u7;
                u7 = u7 + 4;
                local v35 = buffer.readf32(u6, v34);
                local v36 = u7;
                u7 = u7 + 4;
                local v37 = buffer.readf32(u6, v36);
                local v38 = u7;
                u7 = u7 + 4;
                local v39 = buffer.readf32(u6, v38);
                v33 = vector.create(v35, v37, v39);
            else
                v33 = nil;
            end;

            local v40 = u7;
            u7 = u7 + 1;
            local v41;

            if buffer.readu8(u6, v40) == 1 then
                u9 = u9 + 1;
                v41 = u8[u9];
                local v42 = v41 == nil and true or v41:IsA("Model");
                assert(v42);
            else
                v41 = nil;
            end;

            local v43 = u7;
            u7 = u7 + 1;
            local v44;

            if buffer.readu8(u6, v43) == 1 then
                v44 = {};
                local v45 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v45) == 1 then
                    local v46 = u7;
                    u7 = u7 + 8;
                    v44.horizontal = buffer.readf64(u6, v46);
                else
                    v44.horizontal = nil;
                end;

                local v47 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v47) == 1 then
                    local v48 = u7;
                    u7 = u7 + 8;
                    v44.vertical = buffer.readf64(u6, v48);
                else
                    v44.vertical = nil;
                end;

                local v49 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v49) == 1 then
                    local v50 = u7;
                    u7 = u7 + 1;
                    v44.disabled = buffer.readu8(u6, v50) == 1;
                else
                    v44.disabled = nil;
                end;
            else
                v44 = nil;
            end;

            local v51 = u7;
            u7 = u7 + 1;
            local v52;

            if buffer.readu8(u6, v51) == 1 then
                local v53 = u7;
                u7 = u7 + 2;
                v52 = buffer.readu16(u6, v53);
            else
                v52 = nil;
            end;

            local v54 = u7;
            u7 = u7 + 1;
            local v55;

            if buffer.readu8(u6, v54) == 1 then
                v55 = {};
                local v56 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v56) == 1 then
                    local v57 = u7;
                    u7 = u7 + 2;
                    local v58 = buffer.readu16(u6, v57);
                    local v59 = u7;
                    u7 = u7 + v58;
                    v55.itemUsed = buffer.readstring(u6, v59, v58);
                else
                    v55.itemUsed = nil;
                end;

                local v60 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v60) == 1 then
                    local v61 = u7;
                    u7 = u7 + 4;
                    v55.swingTimeRatio = buffer.readf32(u6, v61);
                else
                    v55.swingTimeRatio = nil;
                end;

                local v62 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v62) == 1 then
                    v55.projectileData = {};
                    local v63 = u7;
                    u7 = u7 + 2;
                    v55.projectileData.projectileType = buffer.readu16(u6, v63);
                    u9 = u9 + 1;
                    v55.projectileData.projectileModel = u8[u9];
                    assert(v55.projectileData.projectileModel ~= nil);
                    assert(v55.projectileData.projectileModel:IsA("Model"));
                else
                    v55.projectileData = nil;
                end;

                local v64 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v64) == 1 then
                    local v65 = u7;
                    u7 = u7 + 1;
                    v55.guidedProjectile = buffer.readu8(u6, v65);
                else
                    v55.guidedProjectile = nil;
                end;

                local v66 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v66) == 1 then
                    local v67 = u7;
                    u7 = u7 + 1;
                    v55.paintBlast = buffer.readu8(u6, v67) == 1;
                else
                    v55.paintBlast = nil;
                end;

                local v68 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v68) == 1 then
                    local v69 = u7;
                    u7 = u7 + 1;
                    v55.pyroBrittleAttack = buffer.readu8(u6, v69) == 1;
                else
                    v55.pyroBrittleAttack = nil;
                end;

                local v70 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v70) == 1 then
                    local v71 = u7;
                    u7 = u7 + 4;
                    v55.chargeRatio = buffer.readf32(u6, v71);
                else
                    v55.chargeRatio = nil;
                end;

                local v72 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v72) == 1 then
                    local v73 = u7;
                    u7 = u7 + 1;
                    v55.isVoidAttack = buffer.readu8(u6, v73) == 1;
                else
                    v55.isVoidAttack = nil;
                end;

                local v74 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v74) == 1 then
                    local v75 = u7;
                    u7 = u7 + 1;
                    v55.isDoubleHit = buffer.readu8(u6, v75) == 1;
                else
                    v55.isDoubleHit = nil;
                end;

                local v76 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v76) == 1 then
                    local v77 = u7;
                    u7 = u7 + 1;
                    v55.halloweenEventFog = buffer.readu8(u6, v77) == 1;
                else
                    v55.halloweenEventFog = nil;
                end;

                local v78 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v78) == 1 then
                    local v79 = u7;
                    u7 = u7 + 1;
                    v55.halloweenLaser = buffer.readu8(u6, v79) == 1;
                else
                    v55.halloweenLaser = nil;
                end;

                local v80 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v80) == 1 then
                    local v81 = u7;
                    u7 = u7 + 1;
                    v55.seahorseAttack = buffer.readu8(u6, v81) == 1;
                else
                    v55.seahorseAttack = nil;
                end;

                local v82 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v82) == 1 then
                    local v83 = u7;
                    u7 = u7 + 1;
                    v55.headshot = buffer.readu8(u6, v83) == 1;
                else
                    v55.headshot = nil;
                end;

                local v84 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v84) == 1 then
                    local v85 = u7;
                    u7 = u7 + 1;
                    v55.damageOverTime = buffer.readu8(u6, v85) == 1;
                else
                    v55.damageOverTime = nil;
                end;

                local v86 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v86) == 1 then
                    local v87 = u7;
                    u7 = u7 + 1;
                    v55.ignorePurgatoryDisable = buffer.readu8(u6, v87) == 1;
                else
                    v55.ignorePurgatoryDisable = nil;
                end;

                local v88 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v88) == 1 then
                    local v89 = u7;
                    u7 = u7 + 1;
                    v55.spiderKill = buffer.readu8(u6, v89) == 1;
                else
                    v55.spiderKill = nil;
                end;
            else
                v55 = nil;
            end;

            local v90 = u7;
            u7 = u7 + 1;
            local v91;

            if buffer.readu8(u6, v90) == 1 then
                local v92 = u7;
                u7 = u7 + 1;
                v91 = buffer.readu8(u6, v92) == 1;
            else
                v91 = nil;
            end;

            local v93 = u7;
            u7 = u7 + 1;
            local v94;

            if buffer.readu8(u6, v93) == 1 then
                local v95 = u7;
                u7 = u7 + 2;
                v94 = buffer.readu16(u6, v95);
            else
                v94 = nil;
            end;

            local v96 = u7;
            u7 = u7 + 1;
            local v97;

            if buffer.readu8(u6, v96) == 1 then
                v97 = {};
                local v98 = u7;
                u7 = u7 + 2;

                for i = 1, buffer.readu16(u6, v98) do
                    local v99 = u7;
                    u7 = u7 + 2;
                    v97[i] = buffer.readu16(u6, v99);
                end;
            else
                v97 = nil;
            end;

            local v100 = u7;
            u7 = u7 + 1;
            local v101;

            if buffer.readu8(u6, v100) == 1 then
                local v102 = u7;
                u7 = u7 + 1;
                v101 = buffer.readu8(u6, v102) == 1;
            else
                v101 = nil;
            end;

            local v103 = u7;
            u7 = u7 + 1;
            local v104;

            if buffer.readu8(u6, v103) == 1 then
                local v105 = u7;
                u7 = u7 + 1;
                v104 = buffer.readu8(u6, v105) == 1;
            else
                v104 = nil;
            end;

            local v106 = u7;
            u7 = u7 + 1;
            local v107;

            if buffer.readu8(u6, v106) == 1 then
                local v108 = u7;
                u7 = u7 + 1;
                v107 = buffer.readu8(u6, v108);
            else
                v107 = nil;
            end;

            if u19[0][1] then
                for _, v in u19[0] do
                    task.spawn(v, v27, v29, v31, v33, v41, v44, v52, v55, v91, v94, v97, v101, v104, v107);
                end;
            else
                table.insert(u20[0], {
                    v27,
                    v29,
                    v31,
                    v33,
                    v41,
                    v44,
                    v52,
                    v55,
                    v91,
                    v94,
                    v97,
                    v101,
                    v104,
                    v107
                });

                if #u20[0] > 64 then
                    warn((`[ZAP] {#u20[0]} events in queue for EntityDamageEventZap. Did you forget to attach a listener?`));
                end;
            end;
        elseif v26 == 1 then
            local v109 = u7;
            u7 = u7 + 2;
            local v110 = buffer.readu16(u6, v109);
            local v111 = u7;
            u7 = u7 + 4;
            local v112 = buffer.readf32(u6, v111);
            local v113 = u7;
            u7 = u7 + 4;
            local v114 = buffer.readf32(u6, v113);
            local v115 = u7;
            u7 = u7 + 4;
            local v116 = buffer.readf32(u6, v115);
            local v117 = vector.create(v112, v114, v116);

            if u19[1][1] then
                for _, v in u19[1] do
                    task.spawn(v, v110, v117);
                end;
            else
                table.insert(u20[1], { v110, v117 });

                if #u20[1] > 64 then
                    warn((`[ZAP] {#u20[1]} events in queue for PickupItemEventZap. Did you forget to attach a listener?`));
                end;
            end;
        elseif v26 == 2 then
            local v118 = u7;
            u7 = u7 + 1;
            local v119;

            if buffer.readu8(u6, v118) == 1 then
                u9 = u9 + 1;
                v119 = u8[u9];
            else
                v119 = nil;
            end;

            local v120 = u7;
            u7 = u7 + 4;
            local v121 = buffer.readf32(u6, v120);
            local v122 = u7;
            u7 = u7 + 4;
            local v123 = buffer.readf32(u6, v122);
            local v124 = u7;
            u7 = u7 + 4;
            local v125 = buffer.readf32(u6, v124);
            local v126 = vector.create(v121, v123, v125);
            u9 = u9 + 1;
            local v127 = u8[u9];
            assert(v127 ~= nil);
            assert(v127:IsA("Model"));
            local v128 = u7;
            u7 = u7 + 8;
            local v129 = buffer.readstring(u6, v128, 8);
            local v130 = u7;
            u7 = u7 + 1;
            local v131;

            if buffer.readu8(u6, v130) == 1 then
                u9 = u9 + 1;
                v131 = u8[u9];
                local v132 = v131 == nil and true or v131:IsA("Accessory");
                assert(v132);
            else
                v131 = nil;
            end;

            local v133 = u7;
            u7 = u7 + 1;
            local v134;

            if buffer.readu8(u6, v133) == 1 then
                u9 = u9 + 1;
                v134 = u8[u9];
                local v135 = v134 == nil and true or v134:IsA("BasePart");
                assert(v135);
            else
                v134 = nil;
            end;

            local v136 = u7;
            u7 = u7 + 1;
            local v137;

            if buffer.readu8(u6, v136) == 1 then
                u9 = u9 + 1;
                v137 = u8[u9];
                local v138 = v137 == nil and true or v137:IsA("Model");
                assert(v138);
            else
                v137 = nil;
            end;

            local v139 = u7;
            u7 = u7 + 1;
            local v140;

            if buffer.readu8(u6, v139) == 1 then
                v140 = {};
                local v141 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v141) == 1 then
                    local v142 = u7;
                    u7 = u7 + 4;
                    v140.drawDurationSec = buffer.readf32(u6, v142);
                else
                    v140.drawDurationSec = nil;
                end;

                local v143 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v143) == 1 then
                    local v144 = u7;
                    u7 = u7 + 8;
                    v140.shotId = buffer.readstring(u6, v144, 8);
                else
                    v140.shotId = nil;
                end;
            else
                v140 = nil;
            end;

            local v145 = u7;
            u7 = u7 + 1;
            local v146;

            if buffer.readu8(u6, v145) == 1 then
                local v147 = u7;
                u7 = u7 + 1;
                v146 = buffer.readu8(u6, v147) == 1;
            else
                v146 = nil;
            end;

            local v148 = u7;
            u7 = u7 + 1;
            local v149;

            if buffer.readu8(u6, v148) == 1 then
                local v150 = u7;
                u7 = u7 + 1;
                v149 = buffer.readu8(u6, v150) == 1;
            else
                v149 = nil;
            end;

            local v151 = u7;
            u7 = u7 + 1;
            local v152;

            if buffer.readu8(u6, v151) == 1 then
                v152 = {};
                local v153 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v153) == 1 then
                    local v154 = u7;
                    u7 = u7 + 1;
                    v152.detectHitTerrain = buffer.readu8(u6, v154) == 1;
                else
                    v152.detectHitTerrain = nil;
                end;
            else
                v152 = nil;
            end;

            if u19[2][1] then
                for _, v in u19[2] do
                    task.spawn(v, v119, v126, v127, v129, v131, v134, v137, v140, v146, v149, v152);
                end;
            else
                table.insert(u20[2], {
                    v119,
                    v126,
                    v127,
                    v129,
                    v131,
                    v134,
                    v137,
                    v140,
                    v146,
                    v149,
                    v152
                });

                if #u20[2] > 64 then
                    warn((`[ZAP] {#u20[2]} events in queue for ProjectileLaunchZap. Did you forget to attach a listener?`));
                end;
            end;
        elseif v26 == 3 then
            local v155 = u7;
            u7 = u7 + 4;
            local v156 = buffer.readf32(u6, v155);
            local v157 = u7;
            u7 = u7 + 4;
            local v158 = buffer.readf32(u6, v157);
            local v159 = u7;
            u7 = u7 + 4;
            local v160 = buffer.readf32(u6, v159);
            local v161 = vector.create(v156, v158, v160);
            local v162 = u7;
            u7 = u7 + 1;
            local v163 = buffer.readu8(u6, v162);
            u9 = u9 + 1;
            local v164 = u8[u9];
            assert(v164 ~= nil);
            assert(v164:IsA("Model"));
            local v165 = u7;
            u7 = u7 + 1;
            local v166;

            if buffer.readu8(u6, v165) == 1 then
                u9 = u9 + 1;
                v166 = u8[u9];
                local v167 = v166 == nil and true or v166:IsA("Accessory");
                assert(v167);
            else
                v166 = nil;
            end;

            local v168 = u7;
            u7 = u7 + 1;
            local v169;

            if buffer.readu8(u6, v168) == 1 then
                u9 = u9 + 1;
                v169 = u8[u9];
                local v170 = v169 == nil and true or v169:IsA("BasePart");
                assert(v170);
            else
                v169 = nil;
            end;

            local v171 = u7;
            u7 = u7 + 1;
            local v172;

            if buffer.readu8(u6, v171) == 1 then
                u9 = u9 + 1;
                v172 = u8[u9];
                local v173 = v172 == nil and true or v172:IsA("Player");
                assert(v173);
            else
                v172 = nil;
            end;

            local v174 = u7;
            u7 = u7 + 1;
            local v175;

            if buffer.readu8(u6, v174) == 1 then
                u9 = u9 + 1;
                v175 = u8[u9];
                local v176 = v175 == nil and true or v175:IsA("Model");
                assert(v176);
            else
                v175 = nil;
            end;

            local v177 = u7;
            u7 = u7 + 1;
            local v178;

            if buffer.readu8(u6, v177) == 1 then
                local v179 = u7;
                u7 = u7 + 1;
                v178 = buffer.readu8(u6, v179) == 1;
            else
                v178 = nil;
            end;

            if u19[3][1] then
                for _, v in u19[3] do
                    task.spawn(v, v161, v163, v164, v166, v169, v172, v175, v178);
                end;
            else
                table.insert(u20[3], {
                    v161,
                    v163,
                    v164,
                    v166,
                    v169,
                    v172,
                    v175,
                    v178
                });

                if #u20[3] > 64 then
                    warn((`[ZAP] {#u20[3]} events in queue for ProjectileImpactZap. Did you forget to attach a listener?`));
                end;
            end;
        elseif v26 == 4 then
            local v180 = {};
            local v181 = u7;
            u7 = u7 + 2;

            for i = 1, buffer.readu16(u6, v181) do
                local v182 = {};
                local v183 = u7;
                u7 = u7 + 2;
                local v184 = buffer.readu16(u6, v183);
                local v185 = u7;
                u7 = u7 + 2;
                local v186 = buffer.readu16(u6, v185);
                local v187 = u7;
                u7 = u7 + 2;
                local v188 = buffer.readu16(u6, v187);
                v182.center = vector.create(v184, v186, v188);
                local v189 = u7;
                u7 = u7 + 1;
                local v190 = buffer.readu8(u6, v189);
                local v191 = u7;
                u7 = u7 + 1;
                local v192 = buffer.readu8(u6, v191);
                v182.radius = vector.create(v190, v192, 0);
                local v193 = u7;
                u7 = u7 + 1;
                v182.box = buffer.readu8(u6, v193) == 1;
                local v194 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v194) == 1 then
                    local v195 = u7;
                    u7 = u7 + 2;
                    local v196 = buffer.readu16(u6, v195);
                    local v197 = u7;
                    u7 = u7 + v196;
                    v182.whiteListTeamId = buffer.readstring(u6, v197, v196);
                else
                    v182.whiteListTeamId = nil;
                end;

                v180[i] = v182;
            end;

            local v198 = u7;
            u7 = u7 + 1;
            local v199 = buffer.readu8(u6, v198) == 1;

            if u19[4][1] then
                for _, v in u19[4] do
                    task.spawn(v, v180, v199);
                end;
            else
                table.insert(u20[4], { v180, v199 });

                if #u20[4] > 64 then
                    warn((`[ZAP] {#u20[4]} events in queue for UpdateMapDataZap. Did you forget to attach a listener?`));
                end;
            end;
        elseif v26 == 5 then
            local v200 = u7;
            u7 = u7 + 2;
            local v201 = buffer.readu16(u6, v200);
            local v202 = u7;
            u7 = u7 + 2;
            local v203 = buffer.readu16(u6, v202);
            local v204 = u7;
            u7 = u7 + 2;
            local v205 = buffer.readu16(u6, v204);
            local v206 = vector.create(v201, v203, v205);
            local v207 = u7;
            u7 = u7 + 2;
            local v208 = buffer.readu16(u6, v207);
            local v209 = u7;
            u7 = u7 + v208;
            local v210 = buffer.readstring(u6, v209, v208);

            if u19[5][1] then
                for _, v in u19[5] do
                    task.spawn(v, v206, v210);
                end;
            else
                table.insert(u20[5], { v206, v210 });

                if #u20[5] > 64 then
                    warn((`[ZAP] {#u20[5]} events in queue for PlaceBlockEventZap. Did you forget to attach a listener?`));
                end;
            end;
        elseif v26 == 6 then
            local v211 = u7;
            u7 = u7 + 2;
            local v212 = buffer.readu16(u6, v211);
            local v213 = u7;
            u7 = u7 + 2;
            local v214 = buffer.readu16(u6, v213);
            local v215 = u7;
            u7 = u7 + 2;
            local v216 = buffer.readu16(u6, v215);
            local v217 = vector.create(v212, v214, v216);
            local v218 = u7;
            u7 = u7 + 2;
            local v219 = buffer.readu16(u6, v218);
            local v220 = u7;
            u7 = u7 + v219;
            local v221 = buffer.readstring(u6, v220, v219);
            local v222 = u7;
            u7 = u7 + 4;
            local v223 = buffer.readf32(u6, v222);
            local v224 = u7;
            u7 = u7 + 4;
            local v225 = buffer.readf32(u6, v224);
            local v226 = u7;
            u7 = u7 + 4;
            local v227 = buffer.readf32(u6, v226);
            local v228 = vector.create(v223, v225, v227);
            local v229 = u7;
            u7 = u7 + 1;
            local v230;

            if buffer.readu8(u6, v229) == 1 then
                local v231 = u7;
                u7 = u7 + 1;
                local v232 = buffer.readu8(u6, v231);
                local v233 = u7;
                u7 = u7 + 1;
                local v234 = buffer.readu8(u6, v233);
                local v235 = u7;
                u7 = u7 + 1;
                local v236 = buffer.readu8(u6, v235);
                v230 = vector.create(v232, v234, v236);
            else
                v230 = nil;
            end;

            local v237 = u7;
            u7 = u7 + 1;
            local v238;

            if buffer.readu8(u6, v237) == 1 then
                u9 = u9 + 1;
                v238 = u8[u9];
                local v239 = v238 == nil and true or v238:IsA("Player");
                assert(v239);
            else
                v238 = nil;
            end;

            if u19[6][1] then
                for _, v in u19[6] do
                    task.spawn(v, v217, v221, v228, v230, v238);
                end;
            else
                table.insert(u20[6], {
                    v217,
                    v221,
                    v228,
                    v230,
                    v238
                });

                if #u20[6] > 64 then
                    warn((`[ZAP] {#u20[6]} events in queue for BreakBlockEventZap. Did you forget to attach a listener?`));
                end;
            end;
        elseif v26 == 7 then
            u9 = u9 + 1;
            local v240 = u8[u9];
            assert(v240 ~= nil);
            assert(v240:IsA("Model"));
            local v241 = u7;
            u7 = u7 + 8;
            local v242 = buffer.readf64(u6, v241);
            local v243 = u7;
            u7 = u7 + 1;
            local v244;

            if buffer.readu8(u6, v243) == 1 then
                local v245 = u7;
                u7 = u7 + 2;
                local v246 = buffer.readu16(u6, v245);
                local v247 = u7;
                u7 = u7 + v246;
                v244 = buffer.readstring(u6, v247, v246);
            else
                v244 = nil;
            end;

            local v248 = u7;
            u7 = u7 + 1;
            local v249;

            if buffer.readu8(u6, v248) == 1 then
                local v250 = u7;
                u7 = u7 + 1;
                v249 = buffer.readu8(u6, v250) == 1;
            else
                v249 = nil;
            end;

            if u19[7][1] then
                for _, v in u19[7] do
                    task.spawn(v, v240, v242, v244, v249);
                end;
            else
                table.insert(u20[7], {
                    v240,
                    v242,
                    v244,
                    v249
                });

                if #u20[7] > 64 then
                    warn((`[ZAP] {#u20[7]} events in queue for EntityHealEventZap. Did you forget to attach a listener?`));
                end;
            end;
        elseif v26 == 8 then
            local v251 = u7;
            u7 = u7 + 2;
            local v252 = buffer.readu16(u6, v251);
            local v253 = u7;
            u7 = u7 + v252;
            local v254 = buffer.readstring(u6, v253, v252);
            local v255 = u7;
            u7 = u7 + 2;
            local v256 = buffer.readu16(u6, v255);
            local v257 = u7;
            u7 = u7 + v256;
            local v258 = buffer.readstring(u6, v257, v256);
            local v259 = u7;
            u7 = u7 + 2;
            local v260 = buffer.readu16(u6, v259);
            local v261 = u7;
            u7 = u7 + v260;
            local v262 = buffer.readstring(u6, v261, v260);
            local v263 = u7;
            u7 = u7 + 8;
            local v264 = buffer.readf64(u6, v263);
            local v265 = {};
            local v266 = u7;
            u7 = u7 + 1;
            v265.shouldDisplay = buffer.readu8(u6, v266) == 1;
            local v267 = u7;
            u7 = u7 + 1;

            if buffer.readu8(u6, v267) == 1 then
                local v268 = u7;
                u7 = u7 + 1;
                v265.permanentDisplay = buffer.readu8(u6, v268) == 1;
            else
                v265.permanentDisplay = nil;
            end;

            local v269 = u7;
            u7 = u7 + 1;
            local v270;

            if buffer.readu8(u6, v269) == 1 then
                local fromRGB = Color3.fromRGB;
                local v271 = u7;
                u7 = u7 + 1;
                local v272 = buffer.readu8(u6, v271);
                local v273 = u7;
                u7 = u7 + 1;
                local v274 = buffer.readu8(u6, v273);
                local v275 = u7;
                u7 = u7 + 1;
                v270 = fromRGB(v272, v274, (buffer.readu8(u6, v275)));
            else
                v270 = nil;
            end;

            local v276 = u7;
            u7 = u7 + 1;
            local v277;

            if buffer.readu8(u6, v276) == 1 then
                local fromRGB = Color3.fromRGB;
                local v278 = u7;
                u7 = u7 + 1;
                local v279 = buffer.readu8(u6, v278);
                local v280 = u7;
                u7 = u7 + 1;
                local v281 = buffer.readu8(u6, v280);
                local v282 = u7;
                u7 = u7 + 1;
                v277 = fromRGB(v279, v281, (buffer.readu8(u6, v282)));
            else
                v277 = nil;
            end;

            local v283 = u7;
            u7 = u7 + 1;
            local v284;

            if buffer.readu8(u6, v283) == 1 then
                local v285 = u7;
                u7 = u7 + 4;
                v284 = buffer.readf32(u6, v285);
            else
                v284 = nil;
            end;

            if u19[8][1] then
                for _, v in u19[8] do
                    task.spawn(v, v254, v258, v262, v264, v265, v270, v277, v284);
                end;
            else
                table.insert(u20[8], {
                    v254,
                    v258,
                    v262,
                    v264,
                    v265,
                    v270,
                    v277,
                    v284
                });

                if #u20[8] > 64 then
                    warn((`[ZAP] {#u20[8]} events in queue for AddMatchEventCountdownZap. Did you forget to attach a listener?`));
                end;
            end;
        elseif v26 == 9 then
            local v286 = u7;
            u7 = u7 + 8;
            local v287 = buffer.readf64(u6, v286);
            local v288 = u7;
            u7 = u7 + 2;
            local v289 = buffer.readu16(u6, v288);
            local v290 = u7;
            u7 = u7 + v289;
            local v291 = buffer.readstring(u6, v290, v289);

            if u19[9][1] then
                for _, v in u19[9] do
                    task.spawn(v, v287, v291);
                end;
            else
                table.insert(u20[9], { v287, v291 });

                if #u20[9] > 64 then
                    warn((`[ZAP] {#u20[9]} events in queue for KitsUpdateEventZap. Did you forget to attach a listener?`));
                end;
            end;
        elseif v26 == 10 then
            local v292 = u7;
            u7 = u7 + 1;
            local v293 = buffer.readu8(u6, v292);
            local v294 = {};
            local v295 = u7;
            u7 = u7 + 2;

            for i = 1, buffer.readu16(u6, v295) do
                local v296 = {};
                local v297 = u7;
                u7 = u7 + 2;
                local v298 = buffer.readu16(u6, v297);
                local v299 = u7;
                u7 = u7 + 2;
                local v300 = buffer.readu16(u6, v299);
                local v301 = u7;
                u7 = u7 + 2;
                local v302 = buffer.readu16(u6, v301);
                v296.center = vector.create(v298, v300, v302);
                local v303 = u7;
                u7 = u7 + 1;
                local v304 = buffer.readu8(u6, v303);
                local v305 = u7;
                u7 = u7 + 1;
                local v306 = buffer.readu8(u6, v305);
                v296.radius = vector.create(v304, v306, 0);
                local v307 = u7;
                u7 = u7 + 1;
                v296.box = buffer.readu8(u6, v307) == 1;
                local v308 = u7;
                u7 = u7 + 1;

                if buffer.readu8(u6, v308) == 1 then
                    local v309 = u7;
                    u7 = u7 + 2;
                    local v310 = buffer.readu16(u6, v309);
                    local v311 = u7;
                    u7 = u7 + v310;
                    v296.whiteListTeamId = buffer.readstring(u6, v311, v310);
                else
                    v296.whiteListTeamId = nil;
                end;

                v294[i] = v296;
            end;

            local v312 = u20[10][v293];

            if v312 then
                task.spawn(v312, v294);
            end;

            u20[10][v293] = nil;
        else
            error("Unknown event id");
        end;
    end;
end);
table.freeze(v15);

return {
    SendEvents = SendEvents,
    EntityDamageEventZap = {
        On = function(u313) -- Line: 721, Name: On
            -- upvalues: u19 (copy), u20 (copy)
            table.insert(u19[0], u313);

            for _, v in u20[0] do
                task.spawn(u313, unpack(v));
            end;

            u20[0] = {};

            return function() -- Line: 751
                -- upvalues: u19 (ref), u313 (copy)
                table.remove(u19[0], table.find(u19[0], u313));
            end;
        end
    },
    PickupItemEventZap = {
        On = function(u314) -- Line: 757, Name: On
            -- upvalues: u19 (copy), u20 (copy)
            table.insert(u19[1], u314);

            for _, v in u20[1] do
                task.spawn(u314, unpack(v));
            end;

            u20[1] = {};

            return function() -- Line: 763
                -- upvalues: u19 (ref), u314 (copy)
                table.remove(u19[1], table.find(u19[1], u314));
            end;
        end
    },
    ProjectileLaunchZap = {
        On = function(u315) -- Line: 769, Name: On
            -- upvalues: u19 (copy), u20 (copy)
            table.insert(u19[2], u315);

            for _, v in u20[2] do
                task.spawn(u315, unpack(v));
            end;

            u20[2] = {};

            return function() -- Line: 780
                -- upvalues: u19 (ref), u315 (copy)
                table.remove(u19[2], table.find(u19[2], u315));
            end;
        end
    },
    ProjectileImpactZap = {
        On = function(u316) -- Line: 786, Name: On
            -- upvalues: u19 (copy), u20 (copy)
            table.insert(u19[3], u316);

            for _, v in u20[3] do
                task.spawn(u316, unpack(v));
            end;

            u20[3] = {};

            return function() -- Line: 792
                -- upvalues: u19 (ref), u316 (copy)
                table.remove(u19[3], table.find(u19[3], u316));
            end;
        end
    },
    UpdateMapDataZap = {
        On = function(u317) -- Line: 798, Name: On
            -- upvalues: u19 (copy), u20 (copy)
            table.insert(u19[4], u317);

            for _, v in u20[4] do
                task.spawn(u317, unpack(v));
            end;

            u20[4] = {};

            return function() -- Line: 809
                -- upvalues: u19 (ref), u317 (copy)
                table.remove(u19[4], table.find(u19[4], u317));
            end;
        end
    },
    PlaceBlockEventZap = {
        On = function(u318) -- Line: 815, Name: On
            -- upvalues: u19 (copy), u20 (copy)
            table.insert(u19[5], u318);

            for _, v in u20[5] do
                task.spawn(u318, unpack(v));
            end;

            u20[5] = {};

            return function() -- Line: 821
                -- upvalues: u19 (ref), u318 (copy)
                table.remove(u19[5], table.find(u19[5], u318));
            end;
        end
    },
    BreakBlockEventZap = {
        On = function(u319) -- Line: 827, Name: On
            -- upvalues: u19 (copy), u20 (copy)
            table.insert(u19[6], u319);

            for _, v in u20[6] do
                task.spawn(u319, unpack(v));
            end;

            u20[6] = {};

            return function() -- Line: 833
                -- upvalues: u19 (ref), u319 (copy)
                table.remove(u19[6], table.find(u19[6], u319));
            end;
        end
    },
    EntityHealEventZap = {
        On = function(u320) -- Line: 839, Name: On
            -- upvalues: u19 (copy), u20 (copy)
            table.insert(u19[7], u320);

            for _, v in u20[7] do
                task.spawn(u320, unpack(v));
            end;

            u20[7] = {};

            return function() -- Line: 845
                -- upvalues: u19 (ref), u320 (copy)
                table.remove(u19[7], table.find(u19[7], u320));
            end;
        end
    },
    AddMatchEventCountdownZap = {
        On = function(u321) -- Line: 851, Name: On
            -- upvalues: u19 (copy), u20 (copy)
            table.insert(u19[8], u321);

            for _, v in u20[8] do
                task.spawn(u321, unpack(v));
            end;

            u20[8] = {};

            return function() -- Line: 860
                -- upvalues: u19 (ref), u321 (copy)
                table.remove(u19[8], table.find(u19[8], u321));
            end;
        end
    },
    KitsUpdateEventZap = {
        On = function(u322) -- Line: 866, Name: On
            -- upvalues: u19 (copy), u20 (copy)
            table.insert(u19[9], u322);

            for _, v in u20[9] do
                task.spawn(u322, unpack(v));
            end;

            u20[9] = {};

            return function() -- Line: 872
                -- upvalues: u19 (ref), u322 (copy)
                table.remove(u19[9], table.find(u19[9], u322));
            end;
        end
    },
    FetchMapDataFuncZap = {
        Call = function() -- Line: 878, Name: Call
            -- upvalues: alloc (copy), u1 (ref), u5 (ref), u21 (ref), u20 (copy)
            alloc(1);
            buffer.writeu8(u1, u5, 0);
            u21 = u21 + 1;
            u21 = u21 % 256;

            if u20[10][u21] then
                u21 = u21 - 1;
                error("Zap has more than 256 calls awaiting a response, and therefore this packet has been dropped");
            end;

            alloc(1);
            buffer.writeu8(u1, u5, u21);
            u20[10][u21] = coroutine.running();

            return coroutine.yield();
        end
    }
};