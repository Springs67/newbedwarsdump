-- Decompiled with Potassium's decompiler.

return function(u1, u2) -- Line: 3, Name: setupAnims
    local Humanoid = u1:WaitForChild("Humanoid");
    local ScaleDampeningPercent = u2:FindFirstChild("ScaleDampeningPercent");
    local u3 = {};
    local u4 = {};
    local u5 = {
        idle = { {
                id = "http://www.roblox.com/asset/?id=507766666",
                weight = 1
            }, {
                id = "http://www.roblox.com/asset/?id=507766951",
                weight = 1
            }, {
                id = "http://www.roblox.com/asset/?id=507766388",
                weight = 9
            } },
        walk = { {
                id = "http://www.roblox.com/asset/?id=507777826",
                weight = 10
            } },
        run = { {
                id = "http://www.roblox.com/asset/?id=507767714",
                weight = 10
            } },
        swim = { {
                id = "http://www.roblox.com/asset/?id=507784897",
                weight = 10
            } },
        swimidle = { {
                id = "http://www.roblox.com/asset/?id=507785072",
                weight = 10
            } },
        jump = { {
                id = "http://www.roblox.com/asset/?id=507765000",
                weight = 10
            } },
        fall = { {
                id = "http://www.roblox.com/asset/?id=507767968",
                weight = 10
            } },
        climb = { {
                id = "http://www.roblox.com/asset/?id=507765644",
                weight = 10
            } },
        sit = { {
                id = "http://www.roblox.com/asset/?id=2506281703",
                weight = 10
            } },
        toolnone = { {
                id = "http://www.roblox.com/asset/?id=507768375",
                weight = 10
            } },
        toolslash = { {
                id = "http://www.roblox.com/asset/?id=522635514",
                weight = 10
            } },
        toollunge = { {
                id = "http://www.roblox.com/asset/?id=522638767",
                weight = 10
            } },
        wave = { {
                id = "http://www.roblox.com/asset/?id=507770239",
                weight = 10
            } },
        point = { {
                id = "http://www.roblox.com/asset/?id=507770453",
                weight = 10
            } },
        dance = { {
                id = "http://www.roblox.com/asset/?id=507771019",
                weight = 10
            }, {
                id = "http://www.roblox.com/asset/?id=507771955",
                weight = 10
            }, {
                id = "http://www.roblox.com/asset/?id=507772104",
                weight = 10
            } },
        dance2 = { {
                id = "http://www.roblox.com/asset/?id=507776043",
                weight = 10
            }, {
                id = "http://www.roblox.com/asset/?id=507776720",
                weight = 10
            }, {
                id = "http://www.roblox.com/asset/?id=507776879",
                weight = 10
            } },
        dance3 = { {
                id = "http://www.roblox.com/asset/?id=507777268",
                weight = 10
            }, {
                id = "http://www.roblox.com/asset/?id=507777451",
                weight = 10
            }, {
                id = "http://www.roblox.com/asset/?id=507777623",
                weight = 10
            } },
        laugh = { {
                id = "http://www.roblox.com/asset/?id=507770818",
                weight = 10
            } },
        cheer = { {
                id = "http://www.roblox.com/asset/?id=507770677",
                weight = 10
            } }
    };
    math.randomseed(tick());

    function findExistingAnimationInSet(p6, p7)
        if p6 == nil or p7 == nil then
            return 0;
        end;

        for i = 1, p6.count do
            if p6[i].anim.AnimationId == p7.AnimationId then
                return i;
            end;
        end;

        return 0;
    end;

    function configureAnimationSet(u8, u9)
        -- upvalues: u4 (copy), u2 (copy), u3 (copy), Humanoid (copy)
        if u4[u8] ~= nil then
            for _, v in pairs(u4[u8].connections) do
                v:disconnect();
            end;
        end;

        u4[u8] = {};
        u4[u8].count = 0;
        u4[u8].totalWeight = 0;
        u4[u8].connections = {};
        local u10 = true;
        local success, _ = pcall(function() -- Line: 137
            -- upvalues: u10 (ref)
            u10 = game:GetService("StarterPlayer").AllowCustomAnimations;
        end);
        u10 = not success and true or u10;
        local v11 = u2:FindFirstChild(u8);

        if u10 and v11 ~= nil then
            table.insert(u4[u8].connections, v11.ChildAdded:connect(function(p12) -- Line: 145
                -- upvalues: u8 (copy), u9 (copy)
                configureAnimationSet(u8, u9);
            end));
            table.insert(u4[u8].connections, v11.ChildRemoved:connect(function(p13) -- Line: 146
                -- upvalues: u8 (copy), u9 (copy)
                configureAnimationSet(u8, u9);
            end));

            for _, child in pairs(v11:GetChildren()) do
                if child:IsA("Animation") then
                    local Weight = child:FindFirstChild("Weight");
                    local v14 = Weight == nil and 1 or Weight.Value;
                    u4[u8].count = u4[u8].count + 1;
                    local count = u4[u8].count;
                    u4[u8][count] = {};
                    u4[u8][count].anim = child;
                    u4[u8][count].weight = v14;
                    u4[u8].totalWeight = u4[u8].totalWeight + u4[u8][count].weight;
                    table.insert(u4[u8].connections, child.Changed:connect(function(p15) -- Line: 162
                        -- upvalues: u8 (copy), u9 (copy)
                        configureAnimationSet(u8, u9);
                    end));
                    table.insert(u4[u8].connections, child.ChildAdded:connect(function(p16) -- Line: 163
                        -- upvalues: u8 (copy), u9 (copy)
                        configureAnimationSet(u8, u9);
                    end));
                    table.insert(u4[u8].connections, child.ChildRemoved:connect(function(p17) -- Line: 164
                        -- upvalues: u8 (copy), u9 (copy)
                        configureAnimationSet(u8, u9);
                    end));
                end;
            end;
        end;

        if u4[u8].count <= 0 then
            for i, v in pairs(u9) do
                u4[u8][i] = {};
                u4[u8][i].anim = Instance.new("Animation");
                u4[u8][i].anim.Name = u8;
                u4[u8][i].anim.AnimationId = v.id;
                u4[u8][i].weight = v.weight;
                u4[u8].count = u4[u8].count + 1;
                u4[u8].totalWeight = u4[u8].totalWeight + v.weight;
            end;
        end;

        for _, v in pairs(u4) do
            for i = 1, v.count do
                if u3[v[i].anim.AnimationId] == nil then
                    Humanoid:LoadAnimation(v[i].anim);
                    u3[v[i].anim.AnimationId] = true;
                end;
            end;
        end;
    end;

    function configureAnimationSetOld(u18, u19)
        -- upvalues: u4 (copy), u2 (copy), Humanoid (copy)
        if u4[u18] ~= nil then
            for _, v in pairs(u4[u18].connections) do
                v:disconnect();
            end;
        end;

        u4[u18] = {};
        u4[u18].count = 0;
        u4[u18].totalWeight = 0;
        u4[u18].connections = {};
        local u20 = true;
        local success, _ = pcall(function() -- Line: 208
            -- upvalues: u20 (ref)
            u20 = game:GetService("StarterPlayer").AllowCustomAnimations;
        end);
        u20 = not success and true or u20;
        local v21 = u2:FindFirstChild(u18);

        if u20 and v21 ~= nil then
            table.insert(u4[u18].connections, v21.ChildAdded:connect(function(p22) -- Line: 216
                -- upvalues: u18 (copy), u19 (copy)
                configureAnimationSet(u18, u19);
            end));
            table.insert(u4[u18].connections, v21.ChildRemoved:connect(function(p23) -- Line: 217
                -- upvalues: u18 (copy), u19 (copy)
                configureAnimationSet(u18, u19);
            end));
            local v24 = 1;

            for _, child in pairs(v21:GetChildren()) do
                if child:IsA("Animation") then
                    table.insert(u4[u18].connections, child.Changed:connect(function(p25) -- Line: 221
                        -- upvalues: u18 (copy), u19 (copy)
                        configureAnimationSet(u18, u19);
                    end));
                    u4[u18][v24] = {};
                    u4[u18][v24].anim = child;
                    local Weight = child:FindFirstChild("Weight");

                    if Weight == nil then
                        u4[u18][v24].weight = 1;
                    else
                        u4[u18][v24].weight = Weight.Value;
                    end;

                    u4[u18].count = u4[u18].count + 1;
                    u4[u18].totalWeight = u4[u18].totalWeight + u4[u18][v24].weight;
                    v24 = v24 + 1;
                end;
            end;
        end;

        if u4[u18].count <= 0 then
            for i, v in pairs(u19) do
                u4[u18][i] = {};
                u4[u18][i].anim = Instance.new("Animation");
                u4[u18][i].anim.Name = u18;
                u4[u18][i].anim.AnimationId = v.id;
                u4[u18][i].weight = v.weight;
                u4[u18].count = u4[u18].count + 1;
                u4[u18].totalWeight = u4[u18].totalWeight + v.weight;
            end;
        end;

        for _, v in pairs(u4) do
            for i = 1, v.count do
                Humanoid:LoadAnimation(v[i].anim);
            end;
        end;
    end;

    function scriptChildModified(p26)
        -- upvalues: u5 (copy)
        local v27 = u5[p26.Name];

        if v27 ~= nil then
            configureAnimationSet(p26.Name, v27);
        end;
    end;

    u2.ChildAdded:connect(scriptChildModified);
    u2.ChildRemoved:connect(scriptChildModified);
    local u28 = 1;
    local u29 = "Standing";
    local u30 = "";
    local u31 = {
        wave = false,
        point = false,
        dance = true,
        dance2 = true,
        dance3 = true,
        laugh = false,
        cheer = false
    };
    local u32 = nil;
    local u33 = nil;
    local u34 = nil;
    local u35 = nil;
    local u36 = nil;

    for i, v in pairs(u5) do
        configureAnimationSet(i, v);
    end;

    local u37 = "None";
    local u38 = 0;
    local u39 = 0;
    local u40 = false;

    function stopAllAnimations()
        -- upvalues: u30 (ref), u31 (copy), u32 (ref), u33 (ref), u34 (ref), u35 (ref), u36 (ref)
        local v41 = u30;
        local v42 = u31[v41] ~= nil and u31[v41] == false and "idle" or v41;
        u30 = "";
        u32 = nil;

        if u33 ~= nil then
            u33:disconnect();
        end;

        if u34 ~= nil then
            u34:Stop();
            u34:Destroy();
            u34 = nil;
        end;

        if u35 ~= nil then
            u35:disconnect();
        end;

        if u36 ~= nil then
            u36:Stop();
            u36:Destroy();
            u36 = nil;
        end;

        return v42;
    end;

    function getHeightScale()
        -- upvalues: Humanoid (copy), ScaleDampeningPercent (ref), u2 (copy)
        if not Humanoid then
            return 1;
        end;

        if not Humanoid.AutomaticScalingEnabled then
            return 1;
        end;

        local v43 = Humanoid.HipHeight / 2;

        if ScaleDampeningPercent == nil then
            ScaleDampeningPercent = u2:FindFirstChild("ScaleDampeningPercent");
        end;

        if ScaleDampeningPercent ~= nil then
            v43 = 1 + (Humanoid.HipHeight - 2) * ScaleDampeningPercent.Value / 2;
        end;

        return v43;
    end;

    local function rootMotionCompensation(p44) -- Line: 348
        return p44 * 1.25 / getHeightScale();
    end;

    local function setRunSpeed(p45) -- Line: 356
        -- upvalues: u34 (ref), u36 (ref)
        local v46 = p45 * 1.25 / getHeightScale();
        local v47 = 0.0001;
        local v48 = v46 / 0.5;
        local v49 = v46 / 1;
        local v50;

        if v46 <= 0.5 then
            v47 = 1;
            v50 = 0.0001;
        elseif v46 < 1 then
            v50 = (v46 - 0.5) / 0.5;
            v47 = 1 - v50;
            v48 = 1;
            v49 = 1;
        else
            v50 = 1;
        end;

        u34:AdjustWeight(v47);
        u36:AdjustWeight(v50);
        u34:AdjustSpeed(v48);
        u36:AdjustSpeed(v49);
    end;

    function setAnimationSpeed(p51)
        -- upvalues: u30 (ref), setRunSpeed (copy), u28 (ref), u34 (ref)
        if u30 == "walk" then
            setRunSpeed(p51);

            return;
        end;

        if p51 ~= u28 then
            u28 = p51;
            u34:AdjustSpeed(u28);
        end;
    end;

    function keyFrameReachedFunc(p52)
        -- upvalues: u30 (ref), u36 (ref), u34 (ref), u31 (copy), u28 (ref), Humanoid (copy)
        if p52 == "End" then
            if u30 == "walk" then
                u36.TimePosition = 0;
                u34.TimePosition = 0;

                return;
            end;

            local v53 = u30;
            playAnimation(u31[v53] ~= nil and u31[v53] == false and "idle" or v53, 0.15, Humanoid);
            setAnimationSpeed(u28);
        end;
    end;

    function rollAnimation(p54)
        -- upvalues: u4 (copy)
        local v55 = math.random(1, u4[p54].totalWeight);
        local v56 = 1;

        while u4[p54][v56].weight < v55 do
            v55 = v55 - u4[p54][v56].weight;
            v56 = v56 + 1;
        end;

        return v56;
    end;

    local function switchToAnim(p57, p58, p59, p60) -- Line: 443
        -- upvalues: u32 (ref), u34 (ref), u36 (ref), u28 (ref), u30 (ref), u33 (ref), u4 (copy), u35 (ref)
        if p57 ~= u32 then
            if u34 ~= nil then
                u34:Stop(p59);
                u34:Destroy();
            end;

            if u36 ~= nil then
                u36:Stop(p59);
                u36:Destroy();
            end;

            u28 = 1;
            u34 = p60:LoadAnimation(p57);
            u34.Priority = Enum.AnimationPriority.Core;
            u34:Play(p59);
            u30 = p58;
            u32 = p57;

            if u33 ~= nil then
                u33:disconnect();
            end;

            u33 = u34.KeyframeReached:connect(keyFrameReachedFunc);

            if p58 == "walk" then
                local v61 = rollAnimation("run");
                u36 = p60:LoadAnimation(u4.run[v61].anim);
                u36.Priority = Enum.AnimationPriority.Core;
                u36:Play(p59);

                if u35 ~= nil then
                    u35:disconnect();
                end;

                u35 = u36.KeyframeReached:connect(keyFrameReachedFunc);
            end;
        end;
    end;

    function playAnimation(p62, p63, p64)
        -- upvalues: u4 (copy), switchToAnim (copy), u40 (ref)
        local v65 = rollAnimation(p62);
        switchToAnim(u4[p62][v65].anim, p62, p63, p64);
        u40 = false;
    end;

    function playEmote(p66, p67, p68)
        -- upvalues: switchToAnim (copy), u40 (ref)
        switchToAnim(p66, p66.Name, p67, p68);
        u40 = true;
    end;

    local u69 = "";
    local u70 = nil;
    local u71 = nil;
    local u72 = nil;

    function toolKeyFrameReachedFunc(p73)
        -- upvalues: u69 (ref), Humanoid (copy)
        if p73 == "End" then
            playToolAnimation(u69, 0, Humanoid);
        end;
    end;

    function playToolAnimation(p74, p75, p76, p77)
        -- upvalues: u4 (copy), u71 (ref), u70 (ref), u69 (ref), u72 (ref)
        local v78 = rollAnimation(p74);
        local anim = u4[p74][v78].anim;

        if u71 ~= anim then
            if u70 ~= nil then
                u70:Stop();
                u70:Destroy();
                p75 = 0;
            end;

            u70 = p76:LoadAnimation(anim);

            if p77 then
                u70.Priority = p77;
            end;

            u70:Play(p75);
            u69 = p74;
            u71 = anim;
            u72 = u70.KeyframeReached:connect(toolKeyFrameReachedFunc);
        end;
    end;

    function stopToolAnimations()
        -- upvalues: u69 (ref), u72 (ref), u71 (ref), u70 (ref)
        local v79 = u69;

        if u72 ~= nil then
            u72:disconnect();
        end;

        u69 = "";
        u71 = nil;

        if u70 ~= nil then
            u70:Stop();
            u70:Destroy();
            u70 = nil;
        end;

        return v79;
    end;

    function onRunning(p80)
        -- upvalues: Humanoid (copy), u29 (ref), u31 (copy), u30 (ref), u40 (ref)
        if p80 <= 0.75 then
            if u31[u30] == nil and not u40 then
                playAnimation("idle", 0.2, Humanoid);
                u29 = "Standing";
            end;

            return;
        end;

        playAnimation("walk", 0.2, Humanoid);
        setAnimationSpeed(p80 / 16);
        u29 = "Running";
    end;

    function onDied()
        -- upvalues: u29 (ref)
        u29 = "Dead";
    end;

    function onJumping()
        -- upvalues: Humanoid (copy), u39 (ref), u29 (ref)
        playAnimation("jump", 0.1, Humanoid);
        u39 = 0.31;
        u29 = "Jumping";
    end;

    function onClimbing(p81)
        -- upvalues: Humanoid (copy), u29 (ref)
        playAnimation("climb", 0.1, Humanoid);
        setAnimationSpeed(p81 / 5);
        u29 = "Climbing";
    end;

    function onGettingUp()
        -- upvalues: u29 (ref)
        u29 = "GettingUp";
    end;

    function onFreeFall()
        -- upvalues: u39 (ref), Humanoid (copy), u29 (ref)
        if u39 <= 0 then
            playAnimation("fall", 0.2, Humanoid);
        end;

        u29 = "FreeFall";
    end;

    function onFallingDown()
        -- upvalues: u29 (ref)
        u29 = "FallingDown";
    end;

    function onSeated()
        -- upvalues: u29 (ref)
        u29 = "Seated";
    end;

    function onPlatformStanding()
        -- upvalues: u29 (ref)
        u29 = "PlatformStanding";
    end;

    function onSwimming(p82)
        -- upvalues: Humanoid (copy), u29 (ref)
        if p82 <= 1 then
            playAnimation("swimidle", 0.4, Humanoid);
            u29 = "Standing";

            return;
        end;

        playAnimation("swim", 0.4, Humanoid);
        setAnimationSpeed(p82 / 10);
        u29 = "Swimming";
    end;

    function animateTool()
        -- upvalues: u37 (ref), Humanoid (copy)
        if u37 == "None" then
            playToolAnimation("toolnone", 0.1, Humanoid, Enum.AnimationPriority.Idle);

            return;
        end;

        if u37 == "Slash" then
            playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action);

            return;
        end;

        if u37 ~= "Lunge" then
            return;
        end;

        playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action);
    end;

    function getToolAnim(p83)
        for _, child in ipairs(p83:GetChildren()) do
            if child.Name == "toolanim" and child.className == "StringValue" then
                return child;
            end;
        end;

        return nil;
    end;

    local u84 = 0;

    function stepAnimate(p85)
        -- upvalues: u84 (ref), u39 (ref), u29 (ref), Humanoid (copy), u1 (copy), u37 (ref), u38 (ref), u71 (ref)
        local v86 = p85 - u84;
        u84 = p85;

        if u39 > 0 then
            u39 = u39 - v86;
        end;

        if u29 == "FreeFall" and u39 <= 0 then
            playAnimation("fall", 0.2, Humanoid);
        else
            if u29 == "Seated" then
                playAnimation("sit", 0.5, Humanoid);

                return;
            end;

            if u29 == "Running" then
                playAnimation("walk", 0.2, Humanoid);
            elseif u29 == "Dead" or (u29 == "GettingUp" or (u29 == "FallingDown" or (u29 == "Seated" or u29 == "PlatformStanding"))) then
                stopAllAnimations();
            end;
        end;

        local v87 = u1:FindFirstChildOfClass("Tool");

        if v87 and v87:FindFirstChild("Handle") then
            local v88 = getToolAnim(v87);

            if v88 then
                u37 = v88.Value;
                v88.Parent = nil;
                u38 = p85 + 0.3;
            end;

            if u38 < p85 then
                u38 = 0;
                u37 = "None";
            end;

            animateTool();

            return;
        end;

        stopToolAnimations();
        u37 = "None";
        u71 = nil;
        u38 = 0;
    end;

    local u89 = {};
    table.insert(u89, Humanoid.Died:connect(onDied));
    table.insert(u89, Humanoid.Running:connect(onRunning));
    table.insert(u89, Humanoid.Jumping:connect(onJumping));
    playAnimation("idle", 0.1, Humanoid);
    u29 = "Standing";
    local u90 = true;
    task.defer(function() -- Line: 748
        -- upvalues: u1 (copy), u90 (ref)
        while u1.Parent ~= nil and u90 == true do
            local _, v91 = wait(0.1);
            stepAnimate(v91);
        end;
    end);

    return function() -- Line: 755
        -- upvalues: u90 (ref), u89 (copy)
        u90 = false;

        for _, v in pairs(u89) do
            v:Disconnect();
        end;
    end;
end;