-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local createSpy = require(script.Parent.createSpy);
    local Type = require(script.Parent.Type);
    local GlobalConfig = require(script.Parent.GlobalConfig);
    local Binding = require(script.Parent.Binding);
    describe("Binding.create", function() -- Line: 8
        -- upvalues: Binding (copy), Type (copy)
        it("should return a Binding object and an update function", function() -- Line: 9
            -- upvalues: Binding (ref), Type (ref)
            local v1, v2 = Binding.create(1);
            expect(Type.of(v1)).to.equal(Type.Binding);
            expect((typeof(v2))).to.equal("function");
        end);
        it("should support tostring on bindings", function() -- Line: 16
            -- upvalues: Binding (ref)
            local v3, v4 = Binding.create(1);
            expect((tostring(v3))).to.equal("RoactBinding(1)");
            v4("foo");
            expect((tostring(v3))).to.equal("RoactBinding(foo)");
        end);
    end);
    describe("Binding object", function() -- Line: 25
        -- upvalues: Binding (copy), createSpy (copy)
        it("should provide a getter and setter", function() -- Line: 26
            -- upvalues: Binding (ref)
            local v5, v6 = Binding.create(1);
            expect(v5:getValue()).to.equal(1);
            v6(3);
            expect(v5:getValue()).to.equal(3);
        end);
        it("should let users subscribe and unsubscribe to its updates", function() -- Line: 36
            -- upvalues: Binding (ref), createSpy (ref)
            local v7, v8 = Binding.create(1);
            local v9 = createSpy();
            local v10 = Binding.subscribe(v7, v9.value);
            expect(v9.callCount).to.equal(0);
            v8(2);
            expect(v9.callCount).to.equal(1);
            v9:assertCalledWith(2);
            v10();
            v8(3);
            expect(v9.callCount).to.equal(1);
        end);
    end);
    describe("Mapped bindings", function() -- Line: 56
        -- upvalues: Binding (copy), createSpy (copy)
        it("should be composable", function() -- Line: 57
            -- upvalues: Binding (ref)
            local v11, v12 = Binding.create("hi");
            local v13 = v11:map(string.len);
            local v15 = v13:map(function(p14) -- Line: 61
                return p14 % 2 == 0;
            end);
            expect(v11:getValue()).to.equal("hi");
            expect(v13:getValue()).to.equal(2);
            expect(v15:getValue()).to.equal(true);
            v12("sup");
            expect(v11:getValue()).to.equal("sup");
            expect(v13:getValue()).to.equal(3);
            expect(v15:getValue()).to.equal(false);
        end);
        it("should cascade updates when subscribed", function() -- Line: 76
            -- upvalues: Binding (ref), createSpy (ref)
            local v16, v17 = Binding.create("hi");
            local v18 = createSpy();
            local v19 = Binding.subscribe(v16, v18.value);
            local v20 = v16:map(string.len);
            local v21 = createSpy();
            local v22 = Binding.subscribe(v20, v21.value);
            local v24 = v20:map(function(p23) -- Line: 90
                return p23 % 2 == 0;
            end);
            local v25 = createSpy();
            local v26 = Binding.subscribe(v24, v25.value);
            expect(v18.callCount).to.equal(0);
            expect(v21.callCount).to.equal(0);
            expect(v25.callCount).to.equal(0);
            v17("nice");
            expect(v18.callCount).to.equal(1);
            v18:assertCalledWith("nice");
            expect(v21.callCount).to.equal(1);
            v21:assertCalledWith(4);
            expect(v25.callCount).to.equal(1);
            v25:assertCalledWith(true);
            v19();
            v22();
            v26();
            v17("goodbye");
            expect(v18.callCount).to.equal(1);
            expect(v25.callCount).to.equal(1);
            expect(v21.callCount).to.equal(1);
        end);
        it("should throw when updated directly", function() -- Line: 123
            -- upvalues: Binding (ref)
            local u28 = Binding.create(1):map(function(p27) -- Line: 125
                return p27;
            end);
            expect(function() -- Line: 129
                -- upvalues: Binding (ref), u28 (copy)
                Binding.update(u28, 5);
            end).to.throw();
        end);
    end);
    describe("Binding.join", function() -- Line: 135
        -- upvalues: Binding (copy), createSpy (copy), GlobalConfig (copy)
        it("should have getValue", function() -- Line: 136
            -- upvalues: Binding (ref)
            local v29 = Binding.create(1);
            local v30 = Binding.create(2);
            local v31 = Binding.create(3);
            local v32 = Binding.join({
                v29,
                v30,
                foo = v31
            }):getValue();
            expect(v32).to.be.a("table");
            expect(v32[1]).to.equal(1);
            expect(v32[2]).to.equal(2);
            expect(v32.foo).to.equal(3);
        end);
        it("should update when any one of the subscribed bindings updates", function() -- Line: 154
            -- upvalues: Binding (ref), createSpy (ref)
            local v33, v34 = Binding.create(1);
            local v35, v36 = Binding.create(2);
            local v37, v38 = Binding.create(3);
            local v39 = Binding.join({
                v33,
                v35,
                foo = v37
            });
            local v40 = createSpy();
            Binding.subscribe(v39, v40.value);
            expect(v40.callCount).to.equal(0);
            v34(3);
            expect(v40.callCount).to.equal(1);
            local v41 = v40:captureValues("value");
            expect(v41.value).to.be.a("table");
            expect(v41.value[1]).to.equal(3);
            expect(v41.value[2]).to.equal(2);
            expect(v41.value.foo).to.equal(3);
            v36(4);
            expect(v40.callCount).to.equal(2);
            local v42 = v40:captureValues("value");
            expect(v42.value).to.be.a("table");
            expect(v42.value[1]).to.equal(3);
            expect(v42.value[2]).to.equal(4);
            expect(v42.value.foo).to.equal(3);
            v38(8);
            expect(v40.callCount).to.equal(3);
            local v43 = v40:captureValues("value");
            expect(v43.value).to.be.a("table");
            expect(v43.value[1]).to.equal(3);
            expect(v43.value[2]).to.equal(4);
            expect(v43.value.foo).to.equal(8);
        end);
        it("should disconnect from all upstream bindings", function() -- Line: 198
            -- upvalues: Binding (ref), createSpy (ref)
            local v44, v45 = Binding.create(1);
            local v46, v47 = Binding.create(2);
            local v48 = Binding.join({ v44, v46 });
            local v49 = createSpy();
            local v50 = Binding.subscribe(v48, v49.value);
            expect(v49.callCount).to.equal(0);
            v45(3);
            expect(v49.callCount).to.equal(1);
            v47(3);
            expect(v49.callCount).to.equal(2);
            v50();
            v45(4);
            expect(v49.callCount).to.equal(2);
            v47(2);
            expect(v49.callCount).to.equal(2);
            local v51 = v48:getValue();
            expect(v51[1]).to.equal(4);
            expect(v51[2]).to.equal(2);
        end);
        it("should be okay with calling disconnect multiple times", function() -- Line: 227
            -- upvalues: Binding (ref)
            local v52 = Binding.join({});
            local v53 = Binding.subscribe(v52, function() -- Line: 230
            end);
            v53();
            v53();
        end);
        it("should throw if updated directly", function() -- Line: 236
            -- upvalues: Binding (ref)
            local u54 = Binding.join({});
            expect(function() -- Line: 239
                -- upvalues: Binding (ref), u54 (copy)
                Binding.update(u54, 0);
            end);
        end);
        it("should throw when a non-table value is passed", function() -- Line: 244
            -- upvalues: GlobalConfig (ref), Binding (ref)
            GlobalConfig.scoped({
                typeChecks = true
            }, function() -- Line: 247
                -- upvalues: Binding (ref)
                expect(function() -- Line: 248
                    -- upvalues: Binding (ref)
                    Binding.join("hi");
                end).to.throw();
            end);
        end);
        it("should throw when a non-binding value is passed via table", function() -- Line: 254
            -- upvalues: GlobalConfig (ref), Binding (ref)
            GlobalConfig.scoped({
                typeChecks = true
            }, function() -- Line: 257
                -- upvalues: Binding (ref)
                expect(function() -- Line: 258
                    -- upvalues: Binding (ref)
                    local v55 = { Binding.create(123), "abcde" };
                    Binding.join(v55);
                end).to.throw();
            end);
        end);
    end);
end;