-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local createElement = require(script.Parent.Parent.createElement);
    local createReconciler = require(script.Parent.Parent.createReconciler);
    local createSpy = require(script.Parent.Parent.createSpy);
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer);
    local GlobalConfig = require(script.Parent.Parent.GlobalConfig);
    local Component = require(script.Parent.Parent.Component);
    local u1 = createReconciler(NoopRenderer);
    it("should be invoked when mounted", function() -- Line: 12
        -- upvalues: GlobalConfig (copy), Component (copy), createSpy (copy), createElement (copy), u1 (copy)
        GlobalConfig.scoped({
            propValidation = true
        }, function() -- Line: 17
            -- upvalues: Component (ref), createSpy (ref), createElement (ref), u1 (ref)
            local v2 = Component:extend("MyComponent");
            local v3 = createSpy(function() -- Line: 20
                return true;
            end);
            v2.validateProps = v3.value;

            function v2.render(p4) -- Line: 26
                return nil;
            end;

            local v5 = createElement(v2);
            u1.mountVirtualNode(v5, nil, "Test");
            expect(v3.callCount).to.equal(1);
        end);
    end);
    it("should be invoked when props change", function() -- Line: 39
        -- upvalues: GlobalConfig (copy), Component (copy), createSpy (copy), createElement (copy), u1 (copy)
        GlobalConfig.scoped({
            propValidation = true
        }, function() -- Line: 44
            -- upvalues: Component (ref), createSpy (ref), createElement (ref), u1 (ref)
            local v6 = Component:extend("MyComponent");
            local v7 = createSpy(function() -- Line: 47
                return true;
            end);
            v6.validateProps = v7.value;

            function v6.render(p8) -- Line: 53
                return nil;
            end;

            local v9 = createElement(v6, {
                a = 1
            });
            local v10 = u1.mountVirtualNode(v9, nil, "Test");
            expect(v7.callCount).to.equal(1);
            v7:assertCalledWithDeepEqual({
                a = 1
            });
            local v11 = createElement(v6, {
                a = 2
            });
            u1.updateVirtualNode(v10, v11);
            expect(v7.callCount).to.equal(2);
            v7:assertCalledWithDeepEqual({
                a = 2
            });
        end);
    end);
    it("should not be invoked when state changes", function() -- Line: 76
        -- upvalues: GlobalConfig (copy), Component (copy), createSpy (copy), createElement (copy), u1 (copy)
        GlobalConfig.scoped({
            propValidation = true
        }, function() -- Line: 81
            -- upvalues: Component (ref), createSpy (ref), createElement (ref), u1 (ref)
            local v12 = Component:extend("MyComponent");
            local u13 = nil;
            local v14 = createSpy(function() -- Line: 85
                return true;
            end);
            v12.validateProps = v14.value;

            function v12.init(u15) -- Line: 91
                -- upvalues: u13 (ref)
                u13 = function(p16) -- Line: 92
                    -- upvalues: u15 (copy)
                    u15:setState(p16);
                end;
            end;

            function v12.render(p17) -- Line: 97
                return nil;
            end;

            local v18 = createElement(v12, {
                a = 1
            });
            u1.mountVirtualNode(v18, nil, "Test");
            expect(v14.callCount).to.equal(1);
            v14:assertCalledWithDeepEqual({
                a = 1
            });
            u13({
                b = 1
            });
            expect(v14.callCount).to.equal(1);
        end);
    end);
    it("should throw if validateProps is not a function", function() -- Line: 119
        -- upvalues: GlobalConfig (copy), Component (copy), createElement (copy), u1 (copy)
        GlobalConfig.scoped({
            propValidation = true
        }, function() -- Line: 124
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local v19 = Component:extend("MyComponent");
            v19.validateProps = 1;

            function v19.render(p20) -- Line: 128
                return nil;
            end;

            local u21 = createElement(v19);
            expect(function() -- Line: 136
                -- upvalues: u1 (ref), u21 (copy)
                u1.mountVirtualNode(u21, nil, "Test");
            end).to.throw();
        end);
    end);
    it("should throw if validateProps returns false", function() -- Line: 142
        -- upvalues: GlobalConfig (copy), Component (copy), createElement (copy), u1 (copy)
        GlobalConfig.scoped({
            propValidation = true
        }, function() -- Line: 147
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local v22 = Component:extend("MyComponent");

            function v22.validateProps() -- Line: 149
                return false;
            end;

            function v22.render(p23) -- Line: 153
                return nil;
            end;

            local u24 = createElement(v22);
            expect(function() -- Line: 161
                -- upvalues: u1 (ref), u24 (copy)
                u1.mountVirtualNode(u24, nil, "Test");
            end).to.throw();
        end);
    end);
    it("should include the component name in the error message", function() -- Line: 167
        -- upvalues: GlobalConfig (copy), Component (copy), createElement (copy), u1 (copy)
        GlobalConfig.scoped({
            propValidation = true
        }, function() -- Line: 172
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local v25 = Component:extend("MyComponent");

            function v25.validateProps() -- Line: 174
                return false;
            end;

            function v25.render(p26) -- Line: 178
                return nil;
            end;

            local u27 = createElement(v25);
            local success, result = pcall(function() -- Line: 186
                -- upvalues: u1 (ref), u27 (copy)
                u1.mountVirtualNode(u27, nil, "Test");
            end);
            expect(success).to.equal(false);
            local v28 = result:find("MyComponent");
            expect(v28).to.be.ok();
        end);
    end);
    it("should be invoked after defaultProps are applied", function() -- Line: 196
        -- upvalues: GlobalConfig (copy), Component (copy), createSpy (copy), createElement (copy), u1 (copy)
        GlobalConfig.scoped({
            propValidation = true
        }, function() -- Line: 201
            -- upvalues: Component (ref), createSpy (ref), createElement (ref), u1 (ref)
            local v29 = Component:extend("MyComponent");
            local v30 = createSpy(function() -- Line: 204
                return true;
            end);
            v29.validateProps = v30.value;

            function v29.render(p31) -- Line: 210
                return nil;
            end;

            v29.defaultProps = {
                b = 2
            };
            local v32 = createElement(v29, {
                a = 1
            });
            local v33 = u1.mountVirtualNode(v32, nil, "Test");
            expect(v30.callCount).to.equal(1);
            v30:assertCalledWithDeepEqual({
                a = 1,
                b = 2
            });
            local v34 = createElement(v29, {
                a = 2
            });
            u1.updateVirtualNode(v33, v34);
            expect(v30.callCount).to.equal(2);
            v30:assertCalledWithDeepEqual({
                a = 2,
                b = 2
            });
        end);
    end);
    it("should not be invoked if the flag is off", function() -- Line: 239
        -- upvalues: GlobalConfig (copy), Component (copy), createSpy (copy), createElement (copy), u1 (copy)
        GlobalConfig.scoped({
            propValidation = false
        }, function() -- Line: 244
            -- upvalues: Component (ref), createSpy (ref), createElement (ref), u1 (ref)
            local v35 = Component:extend("MyComponent");
            local v36 = createSpy(function() -- Line: 247
                return true;
            end);
            v35.validateProps = v36.value;

            function v35.render(p37) -- Line: 253
                return nil;
            end;

            local v38 = createElement(v35, {
                a = 1
            });
            local v39 = u1.mountVirtualNode(v38, nil, "Test");
            expect(v36.callCount).to.equal(0);
            local v40 = createElement(v35, {
                a = 2
            });
            u1.updateVirtualNode(v39, v40);
            expect(v36.callCount).to.equal(0);
        end);
    end);
end;