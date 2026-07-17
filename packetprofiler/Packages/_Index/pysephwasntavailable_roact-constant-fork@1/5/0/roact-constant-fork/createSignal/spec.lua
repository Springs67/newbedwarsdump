-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local createSignal = require(script.Parent.createSignal);
    local createSpy = require(script.Parent.createSpy);
    it("should fire subscribers and disconnect them", function() -- Line: 6
        -- upvalues: createSignal (copy), createSpy (copy)
        local v1 = createSignal();
        local v2 = createSpy();
        local v3 = v1:subscribe(v2.value);
        expect(v2.callCount).to.equal(0);
        local v4 = {};
        v1:fire(1, v4, "hello");
        expect(v2.callCount).to.equal(1);
        v2:assertCalledWith(1, v4, "hello");
        v3();
        v1:fire();
        expect(v2.callCount).to.equal(1);
    end);
    it("should handle multiple subscribers", function() -- Line: 29
        -- upvalues: createSignal (copy), createSpy (copy)
        local v5 = createSignal();
        local v6 = createSpy();
        local v7 = createSpy();
        local v8 = v5:subscribe(v6.value);
        local v9 = v5:subscribe(v7.value);
        expect(v6.callCount).to.equal(0);
        expect(v7.callCount).to.equal(0);
        local v10 = {};
        v5:fire(v10, 67);
        expect(v6.callCount).to.equal(1);
        v6:assertCalledWith(v10, 67);
        expect(v7.callCount).to.equal(1);
        v7:assertCalledWith(v10, 67);
        v8();
        v5:fire(67, v10);
        expect(v6.callCount).to.equal(1);
        expect(v7.callCount).to.equal(2);
        v7:assertCalledWith(67, v10);
        v9();
    end);
    it("should stop firing a connection if disconnected mid-fire", function() -- Line: 63
        -- upvalues: createSignal (copy), createSpy (copy)
        local v11 = createSignal();
        local u12 = nil;
        local u13 = nil;
        local v14 = createSpy(function() -- Line: 73
            -- upvalues: u13 (ref)
            u13();
        end);
        local v15 = createSpy(function() -- Line: 77
            -- upvalues: u12 (ref)
            u12();
        end);
        u12 = v11:subscribe(v14.value);
        u13 = v11:subscribe(v15.value);
        v11:fire();
        expect(v14.callCount + v15.callCount).to.equal(1);
    end);
    it("should allow adding listener in the middle of firing", function() -- Line: 90
        -- upvalues: createSignal (copy), createSpy (copy)
        local u16 = createSignal();
        local u17 = nil;
        local u18 = createSpy();
        local v21 = u16:subscribe(function(p19, p20) -- Line: 95
            -- upvalues: u17 (ref), u16 (copy), u18 (copy)
            u17 = u16:subscribe(u18.value);
        end);
        expect(u18.callCount).to.equal(0);
        local v22 = {};
        u16:fire(v22, 67);
        expect(u18.callCount).to.equal(0);
        u16:fire(67, v22);
        expect(u18.callCount).to.equal(1);
        u18:assertCalledWith(67, v22);
        u17();
        v21();
        u16:fire(v22);
        expect(u18.callCount).to.equal(1);
    end);
    it("should have one connection instance when add the same listener multiple times", function() -- Line: 122
        -- upvalues: createSignal (copy), createSpy (copy)
        local v23 = createSignal();
        local v24 = createSpy();
        local v25 = v23:subscribe(v24.value);
        expect(v24.callCount).to.equal(0);
        local v26 = {};
        v23:fire(v26, 67);
        expect(v24.callCount).to.equal(1);
        v24:assertCalledWith(v26, 67);
        local v27 = v23:subscribe(v24.value);
        v23:fire(67, v26);
        expect(v24.callCount).to.equal(2);
        v24:assertCalledWith(67, v26);
        v27();
        v23:fire(v26);
        expect(v24.callCount).to.equal(2);
        v25();
        v23:fire(v26);
        expect(v24.callCount).to.equal(2);
    end);
end;