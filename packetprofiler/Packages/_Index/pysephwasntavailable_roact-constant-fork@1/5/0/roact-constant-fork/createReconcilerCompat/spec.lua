-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local createElement = require(script.Parent.createElement);
    local createReconciler = require(script.Parent.createReconciler);
    local Logging = require(script.Parent.Logging);
    local NoopRenderer = require(script.Parent.NoopRenderer);
    local createReconcilerCompat = require(script.Parent.createReconcilerCompat);
    local u1 = createReconciler(NoopRenderer);
    local u2 = createReconcilerCompat(u1);
    it("reify should only warn once per call site", function() -- Line: 12
        -- upvalues: Logging (copy), u2 (copy), createElement (copy), u1 (copy)
        local v5 = Logging.capture(function() -- Line: 13
            -- upvalues: u2 (ref), createElement (ref), u1 (ref)
            local v3 = u2.reify(createElement("StringValue"));
            u1.unmountVirtualTree(v3);
            local v4 = u2.reify(createElement("StringValue"));
            u1.unmountVirtualTree(v4);
        end);
        expect(#v5.warnings).to.equal(1);
        expect(v5.warnings[1]:find("reify")).to.be.ok();
        local v7 = Logging.capture(function() -- Line: 25
            -- upvalues: u2 (ref), createElement (ref), u1 (ref)
            local v6 = u2.reify(createElement("StringValue"));
            u1.unmountVirtualTree(v6);
        end);
        expect(#v7.warnings).to.equal(1);
        expect(v7.warnings[1]:find("reify")).to.be.ok();
    end);
    it("teardown should only warn once per call site", function() -- Line: 35
        -- upvalues: Logging (copy), u1 (copy), createElement (copy), u2 (copy)
        local v10 = Logging.capture(function() -- Line: 36
            -- upvalues: u1 (ref), createElement (ref), u2 (ref)
            local v8 = u1.mountVirtualTree(createElement("StringValue"));
            u2.teardown(v8);
            local v9 = u1.mountVirtualTree(createElement("StringValue"));
            u2.teardown(v9);
        end);
        expect(#v10.warnings).to.equal(1);
        expect(v10.warnings[1]:find("teardown")).to.be.ok();
        local v12 = Logging.capture(function() -- Line: 48
            -- upvalues: u1 (ref), createElement (ref), u2 (ref)
            local v11 = u1.mountVirtualTree(createElement("StringValue"));
            u2.teardown(v11);
        end);
        expect(#v12.warnings).to.equal(1);
        expect(v12.warnings[1]:find("teardown")).to.be.ok();
    end);
    it("update should only warn once per call site", function() -- Line: 58
        -- upvalues: Logging (copy), u1 (copy), createElement (copy), u2 (copy)
        local v14 = Logging.capture(function() -- Line: 59
            -- upvalues: u1 (ref), createElement (ref), u2 (ref)
            for _ = 1, 2 do
                local v13 = u1.mountVirtualTree(createElement("StringValue"));
                u2.reconcile(v13, createElement("StringValue"));
                u1.unmountVirtualTree(v13);
            end;
        end);
        expect(#v14.warnings).to.equal(1);
        expect(v14.warnings[1]:find("reconcile")).to.be.ok();
        local v16 = Logging.capture(function() -- Line: 72
            -- upvalues: u1 (ref), createElement (ref), u2 (ref)
            local v15 = u1.mountVirtualTree(createElement("StringValue"));
            u2.reconcile(v15, createElement("StringValue"));
            u1.unmountVirtualTree(v15);
        end);
        expect(#v16.warnings).to.equal(1);
        expect(v16.warnings[1]:find("reconcile")).to.be.ok();
    end);
end;