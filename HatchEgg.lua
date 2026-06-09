-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("StarterGui");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_TextService_0 = game:GetService("TextService");
local _ = game:GetService("Stats");
local v7 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.Table.Array);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v9 = require(l_ReplicatedStorage_0.Shared.Framework.Classes.Maid);
local _ = require(l_ReplicatedStorage_0.Client.Framework.Utilities.UserInput);
local v11 = require(l_ReplicatedStorage_0.Shared.Framework.Classes.Spring);
local v12 = require(l_ReplicatedStorage_0.Shared.Utils.GetPetModel);
local v13 = require(l_ReplicatedStorage_0.Shared.Data.Pets);
local v14 = require(l_ReplicatedStorage_0.Client.Gui.Utils.PlayLocalSound);
local v15 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.Math.GetPositionOnArc);
local v16 = require(l_ReplicatedStorage_0.Shared.Utils.AnimateColor);
local v17 = require(l_ReplicatedStorage_0.Client.Gui.GuiFrame);
local v18 = require(l_ReplicatedStorage_0.Shared.Constants);
local v19 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.String.FormatPercent);
local v20 = require(l_ReplicatedStorage_0.Client.Gui.Tooltip);
local v21 = require(l_ReplicatedStorage_0.Client.Activation);
local v22 = require(l_ReplicatedStorage_0.Shared.Framework.Classes.Pool);
local v23 = require(l_ReplicatedStorage_0.Shared.Utils.Stats.ItemUtil);
local v24 = require(l_ReplicatedStorage_0.Client.Gui.Utils.Shiny);
local v25 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.SequenceUtil);
local v26 = require(script.SecretEgg);
local v27 = require(l_ReplicatedStorage_0.Client.Moonlite);
local v28 = require(l_ReplicatedStorage_0.Shared.Framework.Services.CollisionGroup);
local v29 = require(l_ReplicatedStorage_0.Client.Framework.Services.LocalData);
local v30 = require(l_ReplicatedStorage_0.Client.LowDetail);
local v31 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.every);
local v32 = require(l_ReplicatedStorage_0.Shared.Utils.Stats.PetUtil);
local v33 = require(l_ReplicatedStorage_0.Shared.Data.Eggs);
local v34 = require(l_ReplicatedStorage_0.Client.PlayerControls);
local v35 = require(l_ReplicatedStorage_0.Client.Effects.SetObjectStyle);
local v36 = require(l_ReplicatedStorage_0.Client.Gui.ProximityPrompt);
local v37 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.String.FormatCommas);
local v38 = require(l_ReplicatedStorage_0.Client.Music);
local v39 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.CharacterUtil);
local v40 = require(l_ReplicatedStorage_0.Client.Effects.Physics);
local v41 = require(l_ReplicatedStorage_0.Shared.Utils.GetChanceColor);
local v42 = require(l_ReplicatedStorage_0.Client.Tutorial);
local v43 = require(l_ReplicatedStorage_0.Client.Framework.Services.InputMode);
local XLService = require(l_ReplicatedStorage_0.Shared.Framework.Services.XLService)
local v44 = {
	_hatching = false
};
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_ScreenGui_0 = l_LocalPlayer_0.PlayerGui.ScreenGui;
local l_Hatching_0 = l_ScreenGui_0.Hatching;
local l_Template_0 = l_Hatching_0.Template;
l_Template_0.Parent = nil;
l_Hatching_0.Border.ImageTransparency = 1;
local l_Template_1 = l_Hatching_0.Last.Template;
l_Template_1.Parent = nil;
local v51 = v22.new(function() --[[ Line: 67 ]]
	-- upvalues: l_Template_1 (copy)
	return (l_Template_1:Clone());
end);
local v52 = Random.new();
local v53 = {
	[1] = {
		(Vector3.new(0, 0, 0.3499999940395355, 0))
	}, 
	[2] = {
		Vector3.new(0.6000000238418579, 0, 0.30000001192092896, 0), 
		(Vector3.new(-0.6000000238418579, 0, 0.30000001192092896, 0))
	}, 
	[3] = {
		Vector3.new(0, 0, 0, 0), 
		Vector3.new(-1, 0, -0.25, 0), 
		(Vector3.new(1, 0, -0.25, 0))
	}, 
	[4] = {
		Vector3.new(-0.5, -0.6000000238418579, 0, 0), 
		Vector3.new(0.5, -0.6000000238418579, 0, 0), 
		Vector3.new(-0.5, 0.6000000238418579, 0, 0), 
		(Vector3.new(0.5, 0.6000000238418579, 0, 0))
	}, 
	[5] = {
		Vector3.new(0, -0.550000011920929, 0, 0), 
		Vector3.new(-1, -0.550000011920929, 0, 0), 
		Vector3.new(1, -0.550000011920929, 0, 0), 
		Vector3.new(0.5, 0.6499999761581421, 0, 0), 
		(Vector3.new(-0.5, 0.6499999761581421, 0, 0))
	}, 
	[6] = {
		Vector3.new(0, -0.550000011920929, 0, 0), 
		Vector3.new(-1, -0.550000011920929, 0, 0), 
		Vector3.new(1, -0.550000011920929, 0, 0), 
		Vector3.new(1, 0.6499999761581421, 0, 0), 
		Vector3.new(0, 0.6499999761581421, 0, 0), 
		(Vector3.new(-1, 0.6499999761581421, 0, 0))
	}
};

-- CHATGPT COOKED
local SPACING_X, SPACING_Y = 1, 0.8
local FIXED_COLS = 5
local function generateGrid(n)
	local cols = FIXED_COLS
	local rows = math.ceil(n / cols)
	local positions = {}
	for i = 1, n do
		local idx = i - 1
		local row = math.floor(idx / cols)
		local col = idx % cols
		local offsetX = (col - (cols - 1) / 2) * SPACING_X
		local offsetY = ((rows - 1) / 2 - row) * SPACING_Y

		table.insert(positions, Vector3.new(offsetX, offsetY, 0))
	end
	return positions
end

for count = 7, 16 do
	v53[count] = generateGrid(count)
end
-- CHATGPT COOKED

local v54 = {
	Bounce = TweenInfo.new(0.7, Enum.EasingStyle.Bounce), 
	Pulse = TweenInfo.new(0.25, Enum.EasingStyle.Quint), 
	Shake = TweenInfo.new(1, Enum.EasingStyle.Quint), 
	Move = TweenInfo.new(0.5, Enum.EasingStyle.Quint), 
	Slow = TweenInfo.new(0.75, Enum.EasingStyle.Sine), 
	Vibrate = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), 
	VibrateFast = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), 
	Explosion = TweenInfo.new(0.5, Enum.EasingStyle.Quint), 
	Out = TweenInfo.new(0.2, Enum.EasingStyle.Back), 
	Grow = TweenInfo.new(0.5, Enum.EasingStyle.Back), 
	Spin = TweenInfo.new(0.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), 
	Shine = TweenInfo.new(0.75, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut)
};
local function v58(v55) --[[ Line: 123 ]] --[[ Name: getGrid ]]
	-- upvalues: v53 (copy), v7 (copy)
	local v56 = v53[v55];
	assert(v56 ~= nil, (("%* does not have valid matrix"):format(v55)));
	return v7.from(v56):map(function(v57) --[[ Line: 127 ]]
		return v57 * 3;
	end):table();
end;
local function v63(v59) --[[ Line: 134 ]] --[[ Name: getTweens ]]
	-- upvalues: v54 (copy)
	local v60 = {};
	for v61, v62 in v54 do
		v60[v61] = TweenInfo.new(v62.Time / (v59 or 1), v62.EasingStyle, v62.EasingDirection);
	end;
	return v60;
end;
local function v72(v64, v65, v66, v67) --[[ Line: 144 ]] --[[ Name: emitParticle ]]
	-- upvalues: v30 (copy), l_ReplicatedStorage_0 (copy), v25 (copy)
	if v30.Enabled then
		return;
	else
		local l_FirstChild_0 = l_ReplicatedStorage_0.Assets.Particles:FindFirstChild(v65);
		if not l_FirstChild_0 then
			return;
		else
			local v69 = l_FirstChild_0:Clone();
			v69.Enabled = false;
			v69.LockedToPart = true;
			v69.Parent = v64;
			if v67 then
				v69.Size = v25.transformNumberSequence(v69.Size, function(v70, _) --[[ Line: 163 ]]
					-- upvalues: v67 (copy)
					return NumberSequenceKeypoint.new(v70.Time, v70.Value * v67);
				end);
			end;
			v69:Emit(v66);
			task.delay(l_FirstChild_0.Lifetime.Max, function() --[[ Line: 170 ]]
				-- upvalues: v69 (copy)
				v69:Destroy();
			end);
			return;
		end;
	end;
end;
local function scaleModel(model, multiplier)
	for _, inst in ipairs(model:GetDescendants()) do
		if inst:IsA("BasePart") then
			inst.Size *= multiplier
		elseif inst:IsA("Attachment") then
			inst.Position *= multiplier
		end
	end
end

local function v84(v73) --[[ Line: 176 ]] --[[ Name: updateLast ]]
	-- upvalues: v13 (copy), v51 (copy), v24 (copy), v16 (copy), v18 (copy), l_TextService_0 (copy), v23 (copy), v19 (copy), v32 (copy), l_Hatching_0 (copy), v29 (copy)
	for _, v75 in v73.Pets do
		local v76 = v13[v75.Pet.Name];
		local petModel = v12(v75.Pet)
		local l_Name_0 = v75.Pet.Name;
		local v78 = v51:Get();
		v78.Name = l_Name_0;
		v78.Label.Text = l_Name_0;
		print("PetData", v76.Ancient, v76.Ultimatum, v76.Infinity, v76.Eternal, v76.Void, v76.Dev)
		if v75.Pet.Shiny then
			v78.Label.TextColor3 = Color3.new(1, 1, 1)
			v24:Add(v78.Icon.Label)

			v16.Cycle(v78.Label, "Shiny", {
				Speed = 0.5
			})

		elseif v75.Rarity == "Legendary" or v75.Rarity == "Secret" then
			v78.Label.TextColor3 = Color3.new(1, 1, 1)
			v24:Remove(v78.Icon.Label)

			v16.Cycle(v78.Label, "Rainbow", {
				Speed = 0.5
			})
			
		elseif v76.Ancient == true then
			v78.Label.TextColor3 = Color3.new(1, 1, 1)
			v24:Remove(v78.Icon.Label)

			v16.Shift(v78.Label, "Ancient", {
				Speed = 0.5
			})
		elseif v76.Ultimatum == true then
			v78.Label.TextColor3 = Color3.new(1, 1, 1)
			v24:Remove(v78.Icon.Label)

			v16.Shift(v78.Label, "Ultimatum", {
				Speed = 0.5
			})
			
		elseif v76.Infinity == true then
			v78.Label.TextColor3 = Color3.new(1, 1, 1)
			v24:Remove(v78.Icon.Label)

			v16.Shift(v78.Label, "Infinity", {
				Speed = 0.5
			})
		
		elseif v76.Eternal == true then
			v78.Label.TextColor3 = Color3.new(1, 1, 1)
			v24:Remove(v78.Icon.Label)
			
			v16.Shift(v78.Label, "Eternal", {
				Speed = 0.5
			})
			
		elseif v76.Void == true then
			v78.Label.TextColor3 = Color3.new(1, 1, 1)
			v24:Remove(v78.Icon.Label)

			v16.Shift(v78.Label, "Void", {
				Speed = 0.5
			})
		
		elseif v76.Dev == true then
			v78.Label.TextColor3 = Color3.new(1, 1, 1)
			v24:Remove(v78.Icon.Label)
			
			v16.Shift(v78.Label, "Dev", {
				Speed = 0.5
			})
			
		else
			v78.Label.TextColor3 = v18.RarityColors[v76.Rarity]
			v24:Remove(v78.Icon.Label)
			v16.None(v78.Label)
		end;
		local v79 = math.max(l_TextService_0:GetTextSize(v78.Label.Text, v78.Label.TextSize, v78.Label.Font, Vector2.new(1e999, 0)).X, l_TextService_0:GetTextSize(v78.Chance.Text, v78.Chance.TextSize, v78.Chance.Font, Vector2.new(1e999, 0)).X);
		v23:UpdateIcon(v78.Icon, v75.Pet);
		v78.Size = UDim2.fromOffset(v79 + 85, 80);
		v78.Chance.Text = v19(v32:GetChance(v75.Pet), true);
		v78.Parent = l_Hatching_0.Last;
	end;
	v51:Done();
	local v80 = false;
	local v81 = v29:Get();
	if v81 then
		for _, v83 in v81.MasteryUpgrades do
			if v83.Type == "StatEgg" then
				v80 = true;
				break;
			end;
		end;
	end;
	l_Hatching_0.Last.Visible = v80;
end;
local function _(v85, v86) --[[ Line: 227 ]] --[[ Name: getCFrameFromGrid ]]
	return CFrame.new(v85[v86] or Vector3.new()) * CFrame.new(0, #v85 >= 4 and -0.25 or 0, -6.5);
end;
local function v102(v88) --[[ Line: 233 ]] --[[ Name: playMythicEffect ]]
	-- upvalues: v11 (copy), l_CurrentCamera_0 (copy), v34 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), v39 (copy), l_LocalPlayer_0 (copy), v40 (copy)
	local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
	l_ColorCorrectionEffect_0.Brightness = 0;
	l_ColorCorrectionEffect_0.Contrast = 0;
	l_ColorCorrectionEffect_0.Saturation = 0;
	l_ColorCorrectionEffect_0.TintColor = Color3.new(1, 1, 1);
	l_ColorCorrectionEffect_0.Parent = game.Lighting;
	local v90 = v11.new((Vector3.new()));
	v90.Friction = 0.25;
	v90.Stiffness = 1.5;
	v90.Target = Vector3.new(-0.2617993950843811, 0, 0, 0);
	l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
	local l_CFrame_0 = l_CurrentCamera_0.CFrame;
	local l_NumberValue_0 = Instance.new("NumberValue");
	l_NumberValue_0.Value = 0;
	local l_FieldOfView_0 = l_CurrentCamera_0.FieldOfView;
	v34:Disable();
	local v94 = 0;
	local v97 = l_RunService_0.Heartbeat:Connect(function(v95) --[[ Line: 256 ]]
		-- upvalues: l_CFrame_0 (copy), l_NumberValue_0 (copy), v94 (ref), l_CurrentCamera_0 (ref), v90 (copy)
		local l_l_CFrame_0_0 = l_CFrame_0;
		if l_NumberValue_0.Value > 0 then
			l_l_CFrame_0_0 = l_l_CFrame_0_0 + Vector3.new(math.noise(v94, 0), math.noise(v94, 0, 100), math.noise(v94, 100, 0)) * l_NumberValue_0.Value;
		end;
		l_CurrentCamera_0.CFrame = l_l_CFrame_0_0 * CFrame.Angles(0, 0, v90.Value.X);
		v94 = v94 + v95 * 36;
	end);
	l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.75, Enum.EasingStyle.Sine), {
		Brightness = 0.2, 
		Contrast = 2, 
		Saturation = 1, 
		TintColor = Color3.fromRGB(255, 0, 234)
	}):Play();
	l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
		FieldOfView = l_FieldOfView_0 + 30
	}):Play();
	l_TweenService_0:Create(l_NumberValue_0, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {
		Value = 1.5
	}):Play();
	task.wait(0.3);
	v90.Target = Vector3.new();
	l_TweenService_0:Create(l_CurrentCamera_0, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
		FieldOfView = 70
	}):Play();
	task.wait(0.65);
	l_TweenService_0:Create(l_NumberValue_0, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
		Value = 0
	}):Play();
	l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
		Brightness = 0, 
		Contrast = 0, 
		Saturation = 0, 
		TintColor = Color3.new(1, 1, 1)
	}):Play();
	task.wait(0.5);
	local l_v39_RootPart_0 = v39:GetRootPart(l_LocalPlayer_0);
	if l_v39_RootPart_0 then
		local v99 = (l_v39_RootPart_0.Position - l_CurrentCamera_0.CFrame.Position) * Vector3.new(1, 0, 1, 0);
		l_LocalPlayer_0.Character:PivotTo(CFrame.new(l_v39_RootPart_0.Position, l_v39_RootPart_0.Position + v99));
	end;
	local l_Character_0 = l_LocalPlayer_0.Character;
	local v101 = l_Character_0 and l_Character_0:FindFirstChild("Humanoid");
	if v101 ~= nil then
		l_CurrentCamera_0.CameraSubject = v101;
		l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
	end;
	l_ColorCorrectionEffect_0:Destroy();
	v90:Destroy();
	l_NumberValue_0:Destroy();
	v97:Disconnect();
	v34:Enable();
	v40:Update();
	v88();
end;
local v103 = {};
local _ = function(v104) --[[ Line: 324 ]] --[[ Name: playSceneAnimation ]]
	-- upvalues: l_ReplicatedStorage_0 (copy), v9 (copy), v103 (copy), v28 (copy), v27 (copy), v54 (copy), l_Hatching_0 (copy), l_TweenService_0 (copy)
	local l_FirstChild_1 = l_ReplicatedStorage_0.Assets.Animations:FindFirstChild(v104);
	if not l_FirstChild_1 then
		return;
	else
		local v106 = v9.new();
		local v107 = false;
		local v108 = {};
		local v109 = v103[v104] or l_FirstChild_1:FindFirstChild("Events") and require(l_FirstChild_1:FindFirstChild("Events"));
		v103[v104] = v109;
		for _, v111 in l_FirstChild_1.Scene:GetChildren() do
			local v112 = v111:Clone();
			if v112:IsA("Model") or v112:IsA("BasePart") then
				v112:PivotTo(v112:GetPivot() + Vector3.new(10000, 0, 0, 0));
			end;
			if v112:IsA("Model") then
				v28:AddModel(v112, "Ignore");
			elseif v112:IsA("BasePart") then
				v28:AddBasePart(v112, "Ignore");
			end;
			v108[v112.Name] = v112;
			v112.Parent = workspace;
			v106:Add(v112);
		end;
		local v113 = v27.CreatePlayer(l_FirstChild_1.Animation);
		v113:Play();
		task.delay(0 - v54.Pulse.Time, function() --[[ Line: 358 ]]
			-- upvalues: l_Hatching_0 (ref), l_TweenService_0 (ref), v54 (ref)
			l_Hatching_0.Overlay.BackgroundColor3 = Color3.new();
			l_TweenService_0:Create(l_Hatching_0.Overlay, v54.Pulse, {
				BackgroundTransparency = 0
			}):Play();
		end);
		if v109 then
			for v114, v115 in v109 do
				local v116 = nil;
				do
					local l_v116_0 = v116;
					v113:GetMarkerReachedSignal(v114):Connect(function(_, v119) --[[ Line: 366 ]]
						-- upvalues: v115 (copy), v108 (copy), v113 (copy), l_v116_0 (ref), v106 (copy)
						local v120 = v115(v108, v119, v113);
						if v120 then
							l_v116_0 = v120;
							v106:Add(v120);
						end;
					end);
					v113:GetMarkerEndedSignal(v114):Connect(function() --[[ Line: 374 ]]
						-- upvalues: l_v116_0 (ref), v106 (copy)
						if l_v116_0 then
							v106:Remove(l_v116_0);
						end;
					end);
				end;
			end;
		end;
		v113.Completed:Connect(function() --[[ Line: 382 ]]
			-- upvalues: v54 (ref), v107 (ref), v113 (copy), v106 (copy), v108 (copy)
			task.wait(v54.Pulse.Time);
			v107 = true;
			v113:Destroy();
			v106:Cleanup();
			table.clear(v108);
		end);
		repeat
			task.wait();
		until v107;
		return;
	end;
end;
local v122 = {};
local function _(v123, v124) --[[ Line: 415 ]] --[[ Name: getEggModel ]]
	-- upvalues: l_ReplicatedStorage_0 (copy)
	local l_FirstChild_2 = l_ReplicatedStorage_0.Assets.Eggs:FindFirstChild((("%*%*"):format(v123, v124.Shiny and " Golden" or "")));
	if not l_FirstChild_2 then
		return l_ReplicatedStorage_0.Assets.Eggs["Common Egg"];
	else
		return l_FirstChild_2;
	end;
end;
local function v150(v127, v128, v129, v130, v131) --[[ Line: 423 ]] --[[ Name: createEggs ]]
	-- upvalues: l_ReplicatedStorage_0 (copy), v122 (copy), v33 (copy), v43 (copy)
	local v132 = {};
	for v133 = 1, v128 do
		local v134 = v129.Pets[v133];
		local l_Pet_0 = v134.Pet;
		local v136 = l_ReplicatedStorage_0.Assets.Eggs:FindFirstChild((("%*%*"):format(v127, l_Pet_0.Shiny and " Golden" or ""))) or l_ReplicatedStorage_0.Assets.Eggs["Common Egg"];
		if v127 == "Infinity Egg" then
			l_Pet_0 = v122[v134.Pet.Name];
			if l_Pet_0 then
				v136 = l_ReplicatedStorage_0.Assets.Eggs:FindFirstChild(l_Pet_0);
			else
				for v137, v138 in v33 do
					for _, v140 in v138.Pool do
						if v140.Item.Type == "Pet" and v140.Item.Name == v134.Pet.Name then
							v122[v134.Pet.Name] = v137;
							v136 = l_ReplicatedStorage_0.Assets.Eggs:FindFirstChild(v137);
							break;
						end;
					end;
					if v136.Name ~= "Infinity Egg" then
						break;
					end;
				end;
			end;
		end;
		l_Pet_0 = v136:Clone();
		for _, v142 in l_Pet_0:GetDescendants() do
			if v142:IsA("BasePart") then
				v142.CanCollide = false;
				v142.CastShadow = false;
			end;
		end;
		local l_NumberValue_1 = Instance.new("NumberValue");
		l_NumberValue_1.Value = 0.5;
		local l_Vector3Value_0 = Instance.new("Vector3Value");
		l_Vector3Value_0.Value = Vector3.new(0, 7, 0, 0);
		local l_PrimaryPart_0 = l_Pet_0.PrimaryPart;
		local l_Highlight_0 = Instance.new("Highlight");
		l_Highlight_0.DepthMode = Enum.HighlightDepthMode.Occluded;
		l_Highlight_0.FillColor = Color3.new(1, 1, 1);
		l_Highlight_0.OutlineColor = Color3.new();
		l_Highlight_0.OutlineTransparency = 0.8;
		l_Highlight_0.FillTransparency = 1;
		l_Highlight_0.Parent = l_Pet_0;
		l_Highlight_0.Enabled = v43.Mode ~= "Touch";
		local v147 = v129.Pets[v133];
		if v147.Pet.Shiny then
			local v148 = l_ReplicatedStorage_0.Assets.GoldenEgg:Clone();
			v148.CanCollide = false;
			v148.CFrame = v136.PrimaryPart and v136.PrimaryPart.CFrame or CFrame.new();
			v148.Parent = l_Pet_0;
		end;
		local l_Attachment_0 = Instance.new("Attachment");
		l_Attachment_0.Parent = l_PrimaryPart_0;
		v132[l_Pet_0] = {
			Index = v133, 
			Animator = l_Vector3Value_0, 
			Hatch = v130, 
			Pulse = v131, 
			Highlight = l_Highlight_0, 
			Intensity = l_NumberValue_1, 
			Delta = 0, 
			Shaking = false, 
			Attachment = l_Attachment_0, 
			Vibration = Instance.new("NumberValue"), 
			Position = Instance.new("Vector3Value"), 
			Data = v147
		};
	end;
	return v132;
end;
local function v163(v151) --[[ Line: 517 ]] --[[ Name: createPets ]]
	-- upvalues: v13 (copy), v12 (copy), v30 (copy), l_ReplicatedStorage_0 (copy)
	local v152 = {};
	for v153, v154 in v151.Pets do
		local v155 = v13[v154.Pet.Name];
		local v156 = v12(v154.Pet):Clone();
		local l_NumberValue_2 = Instance.new("NumberValue");
		l_NumberValue_2.Value = 1;
		local v158 = 1;
		if v154.Pet.Mythic then
			v158 = v158 * 1.25;
		end;
		if v13[v154.Pet.Name].Rarity == "Secret" then
			v158 = v158 * 1.5;
		end;
		if v13[v154.Pet.Name].Ancient == true then
			v158 = v158 * 1;
		end;
		if v13[v154.Pet.Name].Ultimatum == true then
			v158 = v158 * 1.5;
		end;
		if v13[v154.Pet.Name].Infinity == true then
			v158 = v158 * 2;
		end;
		if v13[v154.Pet.Name].Eternal == true then
			v158 = v158 * 2.25;
		end;
		if v13[v154.Pet.Name].Void == true then
			v158 = v158 * 2.5;
		end;
		if v13[v154.Pet.Name].Dev == true then
			v158 = v158 * 1;
		end;
		local v159 = v156:GetScale() * v158;
		v156:ScaleTo(v159);
		l_NumberValue_2:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 537 ]]
			-- upvalues: v156 (copy), v159 (copy), l_NumberValue_2 (copy)
			v156:ScaleTo(v159 * l_NumberValue_2.Value);
		end);
		for _, v161 in v156:GetDescendants() do
			if v161:IsA("BasePart") then
				v161.CanCollide = false;
				v161.CastShadow = false;
			end;
		end;
		local l_Attachment_1 = Instance.new("Attachment");
		l_Attachment_1.Parent = v156:FindFirstChild("Hitbox") or v156:FindFirstChildOfClass("BasePart");
		if (v155.Rarity == "Legendary" or v155.Rarity == "Secret") and not v30.Enabled then
			l_ReplicatedStorage_0.Assets.Particles.Aura:Clone().Parent = l_Attachment_1;
		end;
		v152[v156] = {
			Index = v153, 
			Scale = l_NumberValue_2, 
			Offset = CFrame.new(), 
			Attachment = l_Attachment_1, 
			Position = Instance.new("Vector3Value"), 
			Animator = Instance.new("Vector3Value"), 
			Rotation = Instance.new("NumberValue"), 
			Data = v154
		};
	end;
	return v152;
end;
local function _(v164) --[[ Line: 575 ]] --[[ Name: isFastAnimation ]]
	-- upvalues: v13 (copy), v29 (copy), v18 (copy)
	if not v164.Name then
		return false;
	else
		local v165 = v13[v164.Name];
		local v166 = v29:Get();
		local v167 = v165.Chance >= v18.EasyLegendaryThreshold;
		if v166 and v165.Rarity == "Legendary" and not v166.Settings["Skip Easy Legendary"] then
			v167 = false;
		end;
		if v164.Mythic then
			return false;
		else
			return v167;
		end;
	end;
end;
local v169 = 0;
local function v206(v170, v171, v172, v173, v174) --[[ Line: 597 ]] --[[ Name: animateEgg ]]
	-- upvalues: v13 (copy), v29 (copy), v18 (copy), v169 (ref), v63 (copy), l_TweenService_0 (copy), v14 (copy), v72 (copy), l_CurrentCamera_0 (copy), l_Hatching_0 (copy), l_ReplicatedStorage_0 (copy), v35 (copy), v54 (copy), l_ScreenGui_0 (copy), v30 (copy)
	local v175 = v13[v172.Data.Pet.Name];
	local l_Rarity_0 = v175.Rarity;
	local v177 = true;
	if l_Rarity_0 ~= "Legendary" then
		v177 = l_Rarity_0 == "Secret";
	end;
	local v178 = v173 == v175.Chance;
	local l_Pet_1 = v172.Data.Pet;
	local v180;
	if not l_Pet_1.Name then
		v180 = false;
	else
		local v181 = v13[l_Pet_1.Name];
		local v182 = v29:Get();
		local v183 = v181.Chance >= v18.EasyLegendaryThreshold;
		if v182 and v181.Rarity == "Legendary" and not v182.Settings["Skip Easy Legendary"] then
			v183 = false;
		end;
		v180 = not l_Pet_1.Mythic and v183;
	end;
	v169 = v169 + 1;
	l_Pet_1 = v63(v171);
	v170.Parent = workspace.Rendered.Generic;
	l_TweenService_0:Create(v172.Animator, l_Pet_1.Bounce, {
		Value = Vector3.new()
	}):Play();
	if v172.Index == 1 then
		task.delay(0.2 / v171, function() --[[ Line: 616 ]]
			-- upvalues: v14 (ref), v171 (copy)
			v14("Bounce1");
			task.wait(0.25 / v171);
			v14("Bounce2");
		end);
	end;
	task.wait(l_Pet_1.Bounce.Time + 0.1);
	v72(v172.Attachment, "Strike", 1);
	v172.Hatch.Target = Vector3.new(-0.1745329201221466, 0, 0, 0);
	v172.Pulse.Target = Vector3.new(0, 0, 0.25, 0);
	l_TweenService_0:Create(v172.Highlight, l_Pet_1.Pulse, {
		FillTransparency = 0.5
	}):Play();
	if v172.Index == 1 then
		if v171 < 1.25 then
			l_TweenService_0:Create(l_CurrentCamera_0, l_Pet_1.Pulse, {
				FieldOfView = 72
			}):Play();
		end;
		v14("Pop1");
	end;
	task.delay(0.1, function() --[[ Line: 638 ]]
		-- upvalues: v172 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (ref), l_Pet_1 (copy)
		if v172.Index == 1 then
			l_TweenService_0:Create(l_CurrentCamera_0, l_Pet_1.Pulse, {
				FieldOfView = 70
			}):Play();
		end;
		v172.Pulse.Target = Vector3.new();
		l_TweenService_0:Create(v172.Highlight, l_Pet_1.Pulse, {
			FillTransparency = 1
		}):Play();
	end);
	task.wait(0.3 / v171);
	v72(v172.Attachment, "Strike", 1);
	if v172.Index == 1 then
		if v171 < 1.25 then
			l_TweenService_0:Create(l_CurrentCamera_0, l_Pet_1.Pulse, {
				FieldOfView = 75
			}):Play();
		end;
		v14("Pop2");
	end;
	v172.Hatch.Target = Vector3.new(0.2617993950843811, 0, 0, 0);
	v172.Pulse.Target = Vector3.new(0, 0, 0.44999998807907104, 0);
	l_TweenService_0:Create(v172.Highlight, l_Pet_1.Pulse, {
		FillTransparency = 0.35
	}):Play();
	task.delay(0.1, function() --[[ Line: 658 ]]
		-- upvalues: v172 (copy), l_TweenService_0 (ref), l_Pet_1 (copy)
		v172.Pulse.Target = Vector3.new();
		l_TweenService_0:Create(v172.Highlight, l_Pet_1.Pulse, {
			FillTransparency = 1
		}):Play();
	end);
	if v177 then
		if not l_Hatching_0.Border:GetAttribute("Used") then
			if v172.Data.Pet.Mythic then
				l_Hatching_0.Border.UIGradient.Color = l_ReplicatedStorage_0.Assets.Gradients.Mythic.Color;
			else
				l_Hatching_0.Border.UIGradient.Color = l_ReplicatedStorage_0.Assets.Gradients.Rainbow.Color;
			end;
			l_Hatching_0.Border:SetAttribute("Used", true);
		end;
		l_TweenService_0:Create(l_Hatching_0.Border, l_Pet_1.Shine, {
			ImageTransparency = 0
		}):Play();
	end;
	task.wait(0.3 / v171);
	v172.Pulse.Target = Vector3.new(0, 0, 1, 0);
	if v172.Index == 1 then
		l_TweenService_0:Create(l_CurrentCamera_0, l_Pet_1.Slow, {
			FieldOfView = 67
		}):Play();
	end;
	if v177 then
		if v172.Data.Pet.Mythic then
			v35(v172.Highlight, {
				Type = "Cycle", 
				Color = l_ReplicatedStorage_0.Assets.Gradients.Mythic.Color
			});
		else
			v35(v172.Highlight, {
				Type = "Cycle", 
				Color = l_ReplicatedStorage_0.Assets.Gradients.Rainbow.Color
			});
		end;
	end;
	v172.Shaking = true;
	v172.Hatch.Target = Vector3.new();
	l_TweenService_0:Create(v172.Highlight, TweenInfo.new(2 / v171), {
		FillTransparency = 0.5
	}):Play();
	l_TweenService_0:Create(v172.Intensity, l_Pet_1.Shake, {
		Value = 1
	}):Play();
	v72(v172.Attachment, "Strike", 1);
	task.wait(l_Pet_1.Slow.Time * 0.75);
	local l_PrimaryPart_1 = v170.PrimaryPart;
	local l_Size_0 = l_PrimaryPart_1.Size;
	local v186 = l_ReplicatedStorage_0.Assets.Effects.EggGlow:Clone();
	v186.CanCollide = false;
	v186.CFrame = l_PrimaryPart_1.CFrame;
	v186.Size = l_Size_0 * 0.995;
	v186.Transparency = 1;
	v186.Parent = v170;
	v172.Shaking = false;
	v172.Hatch.Target = Vector3.new();
	if v172.ReorderedPosition then
		l_TweenService_0:Create(v172.Position, v54.Move, {
			Value = v172.ReorderedPosition
		}):Play();
	end;
	local v187 = (v173 or 100) <= v18.RareLegendaryThreshold;
	local v188 = l_Size_0 * 1.5;
	local v189 = v174 and v174 == "Secret";
	if (l_Rarity_0 == "Legendary" or l_Rarity_0 == "Secret") and v175.Chance == v173 and not v180 then
		task.wait(0.15);
		local v190 = nil;
		if not l_ScreenGui_0:FindFirstChild("Zoom") and v178 then
			local v191 = (v175.Chance <= v18.RareLegendaryThreshold and l_ReplicatedStorage_0.Assets.Sounds.Egg.Zoom or l_ReplicatedStorage_0.Assets.Sounds.Egg.ZoomFast):Clone();
			local v192 = v29:Get();
			local v193 = if v192 then v192.Settings["Sound Effects"] / 100 else 1;
			v191.Volume = v191.Volume * math.sqrt(v193);
			v191.Parent = l_ScreenGui_0;
			v191:Play();
			v190 = v191;
		end;
		local v194 = v172.ReorderedPosition or v172.Position.Value;
		task.delay(v54.Move.Time * 0.25, function() --[[ Line: 745 ]]
			-- upvalues: v187 (copy), l_TweenService_0 (ref), l_CurrentCamera_0 (ref), v172 (copy), v54 (ref), v194 (copy)
			if v187 then
				local v195 = TweenInfo.new(5.75, Enum.EasingStyle.Back);
				l_TweenService_0:Create(l_CurrentCamera_0, v195, {
					FieldOfView = 110
				}):Play();
				l_TweenService_0:Create(v172.Vibration, v54.Vibrate, {
					Value = 0.25
				}):Play();
				l_TweenService_0:Create(v172.Position, v195, {
					Value = v194 + Vector3.new(0, 0, 2, 0)
				}):Play();
				return;
			else
				l_TweenService_0:Create(l_CurrentCamera_0, v54.Vibrate, {
					FieldOfView = 85
				}):Play();
				l_TweenService_0:Create(v172.Vibration, v54.Vibrate, {
					Value = 0.5
				}):Play();
				l_TweenService_0:Create(v172.Position, v54.Vibrate, {
					Value = v194 + Vector3.new(0, 0, 1.5, 0)
				}):Play();
				return;
			end;
		end);
		do
			local l_v190_0 = v190;
			if l_v190_0 and not v187 then
				task.delay(1.35, function() --[[ Line: 759 ]]
					-- upvalues: l_TweenService_0 (ref), l_v190_0 (ref), v54 (ref)
					l_TweenService_0:Create(l_v190_0, v54.Move, {
						Volume = 0
					}):Play();
				end);
			end;
			task.wait(1.5);
			if v187 then
				if not v30.Enabled then
					task.delay(1, function() --[[ Line: 768 ]]
						-- upvalues: l_ReplicatedStorage_0 (ref), v172 (copy), v54 (ref)
						local v197 = l_ReplicatedStorage_0.Assets.Particles.Rays:Clone();
						v197:Emit(3);
						v197.Parent = v172.Attachment;
						local v198 = l_ReplicatedStorage_0.Assets.Particles.Electric:Clone();
						v198.Parent = v172.Attachment;
						task.wait(1.1 + v54.Move.Time - 0.05);
						v197:Destroy();
						v198.Enabled = false;
					end);
				end;
				task.wait(1.1);
				if not v189 then
					v14("HolyWhoosh");
				end;
				task.wait(v54.Move.Time - 0.05);
				v188 = v188 * 2.5;
			end;
			if not v30.Enabled then
				for _, v200 in (l_ReplicatedStorage_0.Assets.Particles.Confetti:GetChildren()) do
					local v201 = v200:Clone();
					v201.Enabled = false;
					v201.Parent = v172.Attachment;
					v201:Emit(12);
				end;
			end;
			if l_v190_0 then
				l_v190_0:Stop();
				l_v190_0:Destroy();
			end;
			v172.Vibration.Value = 0;
			l_TweenService_0:Create(v172.Vibration, v54.Pulse, {
				Value = 0
			}):Play();
			l_TweenService_0:Create(l_CurrentCamera_0, v54.Pulse, {
				FieldOfView = 70
			}):Play();
			l_TweenService_0:Create(v172.Position, v54.Pulse, {
				Value = v194
			}):Play();
		end;
	elseif v172.Index == 1 then
		l_TweenService_0:Create(l_CurrentCamera_0, l_Pet_1.Slow, {
			FieldOfView = 70
		}):Play();
	end;
	for _, v203 in v170:GetDescendants() do
		if v203:IsA("BasePart") and v203 ~= v186 then
			v203.Transparency = 1;
		elseif v203:IsA("ParticleEmitter") then
			v203.Enabled = false;
			v203:Clear();
		elseif v203:IsA("Beam") then
			v203.Enabled = false;
		elseif v203:IsA("PointLight") then
			v203.Enabled = false;
		end;
	end;
	if v189 then
		v172.Shaking = false;
		return;
	else
		if not v173 or v173 and v178 then
			local v204 = v172.Data.Pet.Shiny and "Shiny" or "";
			v72(v172.Attachment, "Streak" .. v204, 10);
			v72(v172.Attachment, "Poof" .. v204, 30);
			v72(v172.Attachment, "Sparkles" .. v204, 8);
			v72(v172.Attachment, "Explosion", 1);
			if v173 then
				v72(v172.Attachment, "Shockwave", 1);
			end;
			v186.Transparency = 0;
		end;
		if v177 and not v30.Enabled then
			local v205 = l_ReplicatedStorage_0.Assets.Particles.CircleExplode:Clone();
			v205.Parent = v172.Attachment;
			task.delay(1.5, function() --[[ Line: 853 ]]
				-- upvalues: v205 (copy)
				v205.Enabled = false;
			end);
		end;
		l_TweenService_0:Create(v186, l_Pet_1.Explosion, {
			Size = l_Size_0 * 1.5, 
			Transparency = 1
		}):Play();
		v169 = v169 - 1;
		return;
	end;
end;
local function v212(v207, v208) --[[ Line: 867 ]] --[[ Name: formatChance ]]
	-- upvalues: v32 (copy), v13 (copy), v37 (copy), v41 (copy)
	local l_v32_Chance_0 = v32:GetChance(v208);
	v207.TextSize = 40;
	local v210 = math.ceil(100 / l_v32_Chance_0);
	local v211 = v13[v208.Name];
	if v210 == 1 and v211.Tag then
		v207.Text = v211.Tag;
	else
		v207.Text = ("1 in %*"):format((v37(v210)));
	end;
	v207.TextColor3 = v41(l_v32_Chance_0, v211.Tag);
end;
local v213 = {};
local v214 = false;
local function v236() --[[ Line: 888 ]] --[[ Name: display ]]
	-- upvalues: v214 (ref), v213 (copy), l_ScreenGui_0 (copy), v42 (copy), v26 (copy), v9 (copy), v163 (copy), v58 (copy), v13 (copy), l_Template_0 (copy), v44 (copy), v36 (copy), l_Hatching_0 (copy), l_RunService_0 (copy), l_CurrentCamera_0 (copy), v14 (copy), l_ReplicatedStorage_0 (copy), v38 (copy), v16 (copy), v18 (copy), v212 (copy), l_TweenService_0 (copy), v54 (copy), v30 (copy), v72 (copy), v15 (copy), v17 (copy)
	if v214 then
		return;
	elseif #v213 == 0 then
		return;
	else
		local v215 = table.remove(v213, 1);
		if not v215 then
			return;
		else
			v214 = true;
			l_ScreenGui_0.HUD.Visible = false;
			if v42.Active then
				l_ScreenGui_0.Notifications.Visible = false;
			end;
			if v215.Egg then
				v26(v215.Egg, v215.Pet.Shiny);
			end;
			local v216 = v9.new();
			local v217 = {
				Deleted = false, 
				New = false, 
				Pet = v215.Pet
			};
			local v218 = v163({
				Pets = {
					v217
				}, 
				Name = "none", 
				Speed = 1
			});
			local v219 = next(v218);
			local v220 = v218[v219];
			local v221 = v58(1);
			local v222 = v219:FindFirstChild("Hitbox").Position.Y - v219:GetPivot().Y;
			local v223 = v13[v217.Pet.Name];
			local v224 = true;
			if v223.Rarity ~= "Legendary" then
				v224 = v223.Rarity == "Secret";
			end;
			if v223.Ancient == true then
				v224 = v223.Ancient == true;
			end;
			if v223.Ultimatum == true then
				v224 = v223.Ultimatum == true;
			end;
			if v223.Infinity == true then
				v224 = v223.Infinity == true;
			end;
			if v223.Eternal == true then
				v224 = v223.Eternal == true;
			end;
			if v223.Void == true then
				v224 = v223.Void == true;
			end;
			if v223.Dev == true then
				v224 = v223.Dev == true;
			end;
			local v225 = l_Template_0:Clone();
			v225.Label.Text = v217.Pet.Name;
			v225.New.Visible = v217.New;
			v225.Deleted.Visible = v217.Deleted;
			local l_Chance_0 = v225.Chance;
			local v227 = true;
			if v215.Egg == nil then
				v227 = v224;
			end;
			l_Chance_0.Visible = v227;
			v225.Shiny.Visible = v217.Pet.Shiny or false;
			v225.Visible = true;
			v225.Parent = l_ScreenGui_0;
			v44._hatching = true;
			v36:Disable();
			l_Hatching_0.Border:SetAttribute("Used", nil);
			v216:Add(v225);
			v216:Add(v219);
			v216:Add(l_RunService_0.RenderStepped:Connect(function() --[[ Line: 948 ]]
				-- upvalues: v219 (copy), l_CurrentCamera_0 (ref), v220 (copy), l_ScreenGui_0 (ref), v225 (copy)
				if not v219.Parent then
					return;
				else
					local v228 = l_CurrentCamera_0.CFrame * CFrame.new(v220.Position.Value + v220.Animator.Value) * v220.Offset * CFrame.Angles(0, v220.Rotation.Value, 0);
					local l_Hitbox_0 = v219:FindFirstChild("Hitbox");
					if l_Hitbox_0 then
						local v230 = l_CurrentCamera_0:WorldToScreenPoint(v228.Position + Vector3.new(0, l_Hitbox_0.Size.Y / 2 - 0.25, 0)) / l_ScreenGui_0.UIScale.Scale;
						v225.Position = UDim2.fromOffset(v230.X, v230.Y);
					end;
					v219:PivotTo(v228);
					return;
				end;
			end));
			v14("Hatch");
			if v217.Pet.Mythic then
				v225.Rarity.Text = "Mythic";
			else
				v225.Rarity.Text = v223.Rarity;
			end;
			
			if v223.Ancient == true then
				v225.Rarity.Text = "Ancient";
			else
				v225.Rarity.Text = v223.Rarity;
			end;

			if v223.Ultimatum == true then
				v225.Rarity.Text = "Ultimatum";
			else
				v225.Rarity.Text = v223.Rarity;
			end;
		
			if v223.Infinity == true then
				v225.Rarity.Text = "Infinity";
			else
				v225.Rarity.Text = v223.Rarity;
			end;
			
			if v223.Eternal == true then
				v225.Rarity.Text = "Eternal";
			else
				v225.Rarity.Text = v223.Rarity;
			end;
			
			if v223.Void == true then
				v225.Rarity.Text = "Void";
			else
				v225.Rarity.Text = v223.Rarity;
			end;
			
			if v223.Dev == true then
				v225.Rarity.Text = "Dev";
			else
				v225.Rarity.Text = v223.Rarity;
			end;
			
			l_Chance_0 = 0;
			if v223.Rarity == "Secret" then
				v227 = l_ReplicatedStorage_0.Assets.Particles.SecretExplode:Clone();
				v227.Enabled = true;
				v227.Parent = v220.Attachment;
				v227:Emit(40);
				v14("HolyExplosion");
				v14("SecretReveal");
				l_Hatching_0.Border.UIGradient.Color = l_ReplicatedStorage_0.Assets.Gradients.Secret.Color;
				l_Chance_0 = l_Chance_0 + 1.5;
				local l_v227_0 = v227 --[[ copy: 13 -> 18 ]];
				task.delay(1.5, function() --[[ Line: 983 ]]
					-- upvalues: v38 (ref), l_v227_0 (copy)
					v38:SetVolume(0.5);
					l_v227_0.Enabled = false;
				end);
			end;
			if v217.Pet.Mythic then
				l_Chance_0 = l_Chance_0 + 1;
				v16.Cycle(v225.Rarity, "Mythic", {
					Speed = 1
				});
			elseif v223.Rarity == "Legendary" then
				v16.Cycle(v225.Rarity, "Rainbow", {
					Speed = 0.5
				});
			elseif v223.Ancient == true then
				v16.Shift(v225.Rarity, "Ancient", {
					Speed = 0.5
				});
			elseif v223.Ultimatum == true then
				v16.Shift(v225.Rarity, "Ultimatum", {
					Speed = 0.5
				});
			elseif v223.Infinity == true then
				v16.Shift(v225.Rarity, "Infinity", {
					Speed = 0.5
				});
			elseif v223.Eternal == true then
				v16.Shift(v225.Rarity, "Eternal", {
					Speed = 0.5
				});
			elseif v223.Void == true then
				v16.Shift(v225.Rarity, "Void", {
					Speed = 0.5
				});
			elseif v223.Dev == true then
				v16.Shift(v225.Rarity, "Dev", {
					Speed = 0.5
				});
			else
				v16.None(v225.Rarity);
				v225.Rarity.TextColor3 = v18.RarityColors[v223.Rarity];
			end;
			if v225.Chance.Visible then
				v212(v225.Chance, v217.Pet);
			end;
			l_CurrentCamera_0.FieldOfView = 110;
			v219.Parent = workspace.Rendered.Generic;
			v220.Position.Value = (CFrame.new(v221[1] or Vector3.new()) * CFrame.new(0, #v221 >= 4 and -0.25 or 0, -6.5)).Position - Vector3.new(0, v222, 0);
			v220.Scale.Value = 3;
			v220.Animator.Value = Vector3.new(0, -0.75, 0, 0);
			l_TweenService_0:Create(l_CurrentCamera_0, v54.Pulse, {
				FieldOfView = 70
			}):Play();
			l_TweenService_0:Create(v220.Scale, v54.Pulse, {
				Value = 1.35
			}):Play();
			l_TweenService_0:Create(v220.Animator, v54.Pulse, {
				Value = Vector3.new()
			}):Play();
			l_TweenService_0:Create(l_Hatching_0.Border, v54.Shine, {
				ImageTransparency = 0
			}):Play();
			if not v30.Enabled then
				v227 = l_ReplicatedStorage_0.Assets.Particles.Shockwave:Clone();
				v227.Rate = 2;
				v227.Enabled = true;
				v227.Parent = v220.Attachment;
				local l_v227_1 = v227 --[[ copy: 13 -> 17 ]];
				v216:Add(l_RunService_0.Heartbeat:Connect(function() --[[ Line: 1019 ]]
					-- upvalues: l_v227_1 (copy)
					l_v227_1.Color = ColorSequence.new(Color3.fromHSV(os.clock() % 1, 1, 1));
				end));
			end;
			v227 = v215.Pet.Shiny and "Shiny" or "";
			v72(v220.Attachment, "Streak" .. v227, 10, 2);
			v72(v220.Attachment, "Poof" .. v227, 30, 2);
			v72(v220.Attachment, "Sparkles" .. v227, 8, 2);
			task.wait(v54.Pulse.Time + 2.5 + 1);
			local l_Value_0 = v220.Position.Value;
			local v234 = l_Value_0 * Vector3.new(0, 1, 1, 0) - Vector3.new(0, 7.5, 0, 0);
			local l_NumberValue_3 = Instance.new("NumberValue");
			v225.Visible = false;
			v220.Attachment:Destroy();
			l_NumberValue_3:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1036 ]]
				-- upvalues: v220 (copy), l_NumberValue_3 (copy), v15 (ref), l_Value_0 (copy), v234 (copy)
				v220.Scale.Value = math.max(1.35 - l_NumberValue_3.Value, 0.35);
				v220.Position.Value = v15(l_Value_0, v234, 6, l_NumberValue_3.Value);
			end);
			l_TweenService_0:Create(l_Hatching_0.Border, v54.Shine, {
				ImageTransparency = 1
			}):Play();
			task.delay(0.1, v14, "PetMove");
			v216:Add(l_NumberValue_3);
			l_TweenService_0:Create(l_NumberValue_3, v54.Spin, {
				Value = 1
			}):Play();
			task.wait(v54.Spin.Time);
			if #v213 == 0 then
				v17:OpenLast(true);
			end;
			v216:Cleanup();
			l_ScreenGui_0.HUD.Visible = true;
			l_ScreenGui_0.Notifications.Visible = true;
			v214 = false;
			v36:Enable();
			v44._hatching = false;
			return;
		end;
	end;
end;
v44.DisplayPetOnce = function(_, v238, v239) --[[ Line: 1059 ]] --[[ Name: DisplayPetOnce ]]
	-- upvalues: v213 (copy), v236 (copy)
	table.insert(v213, {
		Pet = v238, 
		Egg = v239
	});
	task.spawn(v236);
end;
local v240 = nil;
local v241 = 0;
v44.Play = function(v242, v243) --[[ Line: 1071 ]] --[[ Name: Play ]]
	-- upvalues: v58 (copy), v9 (copy), v63 (copy), v11 (copy), v150 (copy), v163 (copy), l_Hatching_0 (copy), v241 (ref), l_CurrentCamera_0 (copy), v14 (copy), v52 (copy), v72 (copy), l_ScreenGui_0 (copy), v240 (ref), v21 (copy), l_LocalPlayer_0 (copy), v35 (copy), v16 (copy), v42 (copy), v17 (copy), v20 (copy), v36 (copy), l_RunService_0 (copy), v13 (copy), v206 (copy), v102 (copy), l_Template_0 (copy), v18 (copy), v212 (copy), l_TweenService_0 (copy), v29 (copy), v15 (copy), v38 (copy), v26 (copy), v54 (copy), v44 (copy), v84 (copy), v169 (ref)
	local v244 = #v243.Pets;
	local v245 = v58(v244);
	local v246 = v9.new();
	local v247 = v63(v243.Speed);
	local v248 = v11.new((Vector3.new()));
	v248.Friction = 0.2;
	v248.Stiffness = 13;
	local v249 = v11.new((Vector3.new()));
	v249.Friction = 0.4;
	v249.Stiffness = 5;
	local v250 = v150(v243.Name, v244, v243, v248, v249);
	local v251 = v163(v243);
	local v252 = {};
	l_Hatching_0.Border.ImageTransparency = 1;
	local v253 = os.clock();
	local _ = os.clock();
	local v255 = nil;
	local v256 = {};
	local v257 = v241 + 1;
	v241 = v257;
	local v258 = 0;
	local function v271(v259) --[[ Line: 1099 ]] --[[ Name: update ]]
		-- upvalues: l_CurrentCamera_0 (ref), v250 (copy), v253 (ref), v14 (ref), v52 (ref), v72 (ref), v258 (ref), v251 (copy), v252 (copy), l_ScreenGui_0 (ref), l_Hatching_0 (ref)
		local l_CFrame_1 = l_CurrentCamera_0.CFrame;
		for v261, v262 in v250 do
			local v263 = l_CFrame_1 * CFrame.new(v262.Position.Value + v262.Animator.Value + v262.Pulse.Value) * CFrame.Angles(0, 0, v262.Hatch.Value.X);
			if v262.Shaking then
				if v262.Index == 1 and os.clock() - v253 > 0.05 then
					v14("Pop2");
					v253 = os.clock();
				end;
				if v52:NextInteger(1, 2) == 1 then
					v72(v262.Attachment, "CircleHit", 1);
					v72(v262.Attachment, "Strike", 1);
				end;
				v262.Delta = v262.Delta + v259 * 100 * v262.Intensity.Value;
				v262.Hatch.Target = Vector3.new(math.rad(math.sin(v262.Delta) * 7.5), 0, 0);
			end;
			if v262.Vibration.Value > 0 then
				local v264 = v258 * 36 + v262.Index;
				v263 = v263 + Vector3.new(math.noise(v264, 0), math.noise(v264, 0, 100), math.noise(v264, 100, 0)) * v262.Vibration.Value;
				if v52:NextInteger(1, 2) == 1 then
					v72(v262.Attachment, "Charge", 1);
				end;
			end;
			v261:PivotTo(v263);
		end;
		for v265, v266 in v251 do
			if v265.Parent then
				local v267 = l_CFrame_1 * CFrame.new(v266.Position.Value + v266.Animator.Value) * v266.Offset * CFrame.Angles(0, v266.Rotation.Value, 0);
				local v268 = v252[v266.Index];
				if v268 then
					local l_Hitbox_1 = v265:FindFirstChild("Hitbox");
					if l_Hitbox_1 then
						local v270 = l_CurrentCamera_0:WorldToScreenPoint(v267.Position + Vector3.new(0, l_Hitbox_1.Size.Y / 2 - 0.25, 0)) / l_ScreenGui_0.UIScale.Scale;
						v268.Position = UDim2.fromOffset(v270.X, v270.Y);
					end;
				end;
				v265:PivotTo(v267);
			end;
		end;
		v258 = v258 + v259;
		l_Hatching_0.Border.UIGradient.Rotation = v258 * 100 % 360;
	end;
	local v272 = {};
	local function _(v273) --[[ Line: 1155 ]] --[[ Name: playOnce ]]
		-- upvalues: v272 (copy), v14 (ref)
		if not v272[v273] then
			v272[v273] = true;
			v14(v273);
		end;
	end;
	if v240 ~= v243.Name then
		l_Hatching_0.Last.Visible = false;
	end;
	v240 = v243.Name;
	v21:Hide();
	l_LocalPlayer_0.CameraMinZoomDistance = 22;
	v246:Add(function() --[[ Line: 1170 ]]
		-- upvalues: v250 (copy), v35 (ref), v251 (copy), v252 (copy), v16 (ref), v247 (copy), v272 (copy)
		for v275, v276 in v250 do
			v276.Animator:Destroy();
			v276.Hatch:Destroy();
			v276.Pulse:Destroy();
			v276.Intensity:Destroy();
			v276.Highlight:Destroy();
			v276.Vibration:Destroy();
			v276.Position:Destroy();
			v35(v276.Highlight, {
				Type = "None"
			});
			v275:Destroy();
			v250[v275] = nil;
		end;
		for v277, v278 in v251 do
			local v279 = v252[v278.Index];
			local v280 = v279 and v279:FindFirstChild("Shiny");
			if v280 then
				v16.None(v280);
			end;
			v278.Position:Destroy();
			v278.Rotation:Destroy();
			v278.Animator:Destroy();
			v277:Destroy();
			v251[v277] = nil;
		end;
		table.clear(v251);
		table.clear(v250);
		table.clear(v247);
		table.clear(v272);
	end);
	if v42.Active then
		l_ScreenGui_0.Notifications.Visible = false;
	end;
	l_ScreenGui_0.HUD.Visible = false;
	l_ScreenGui_0.Hatching.Visible = true;
	v17:Close();
	v20:Hide();
	v36:Disable();
	l_Hatching_0.Border:SetAttribute("Used", nil);
	v242._hatching = true;
	v271(0);
	v246:Add(l_RunService_0.RenderStepped:Connect(v271));
	local v281 = false;
	for _, v283 in v243.Pets do
		local l_Rarity_1 = v13[v283.Pet.Name].Rarity;
		if l_Rarity_1 == "Legendary" or l_Rarity_1 == "Secret" then
			v281 = true;
			break;
		end;
	end;
	local v285 = 0;
	local v286 = false;
	local v287 = false;
	for v288, v289 in v250 do
		local v290 = nil;
		local v291 = nil;
		for v292, v293 in v251 do
			if v293.Index == v289.Index then
				v290 = v292;
				v291 = v293;
				break;
			end;
		end;
		local l_Position_0 = v289.Position;
		local l_Index_0 = v289.Index;
		l_Position_0.Value = (CFrame.new(v245[l_Index_0] or Vector3.new()) * CFrame.new(0, #v245 >= 4 and -0.25 or 0, -6.5)).Position;
		do
			local l_v290_0, l_v291_0 = v290, v291;
			task.delay((v289.Index - 1) / 75, function() --[[ Line: 1246 ]]
				-- upvalues: v206 (ref), v288 (copy), v243 (copy), v289 (copy), v255 (ref), v256 (copy), l_v291_0 (ref), v245 (copy), l_v290_0 (ref), v13 (ref), v281 (ref), v287 (ref), v286 (ref), v102 (ref), l_Template_0 (ref), l_ScreenGui_0 (ref), v252 (copy), v246 (copy), v272 (copy), v14 (ref), v16 (ref), v18 (ref), v212 (ref), l_TweenService_0 (ref), v247 (copy), v250 (copy), v29 (ref), v15 (ref), l_Hatching_0 (ref), v285 (ref)
				v206(v288, v243.Speed, v289, v255, #v256 > 0 and "Secret" or nil);
				local v298 = #v256 > 0;
				local v299 = v289.ReorderedIndex or l_v291_0.Index;
				local v300 = v289.ReorderedGrid or v245;
				local v301 = v300[v299];
				local v302 = l_v290_0:FindFirstChild("Hitbox").Position.Y - l_v290_0:GetPivot().Y;
				local v303 = v243.Pets[v289.Index];
				local v304 = v13[v303.Pet.Name];
				local v305 = true;
				if v304.Rarity ~= "Legendary" then
					v305 = v304.Rarity == "Secret";
				end;
				local v306 = v281 and v304.Chance == v255;
				local v307 = not v255 or v305 and v306;
				if v298 then
					if v306 then
						v287 = true;
					end;
					return;
				else
					local v308 = true;
					if v303.Pet.Mythic and not v286 then
						v286 = true;
						v308 = false;
						task.spawn(v102, function() --[[ Line: 1279 ]]
							-- upvalues: v308 (ref)
							v308 = true;
						end);
					end;
					local v309 = l_Template_0:Clone();
					v309.Label.Text = v303.Pet.Name;
					v309.New.Visible = v303.New;
					v309.Deleted.Visible = v303.Deleted;
					v309.Chance.Visible = not v303.Deleted and v305;
					v309.Shiny.Visible = v303.Pet.Shiny or false;
					v309.Visible = false;
					v309.Parent = l_ScreenGui_0.Hatching;
					v252[v289.Index] = v307 and v309 or nil;
					v246:Add(v309);
					if not v272.Hatch then
						v272.Hatch = true;
						v14("Hatch");
					end;
					if v303.Pet.Mythic then
						v309.Rarity.Text = "Mythic";
					else
						v309.Rarity.Text = v304.Rarity;
					end;
					if v303.Pet.Mythic then
						v16.Cycle(v309.Rarity, "Mythic", {
							Speed = 1
						});
					elseif v304.Rarity == "Legendary" then
						v16.Cycle(v309.Rarity, "Rainbow", {
							Speed = 0.5
						});
					elseif v304.Ancient == true then
						v16.Shift(v309.Rarity, "Ancient", {
							Speed = 0.5
						});
					elseif v304.Ultimatum == true then
						v16.Shift(v309.Rarity, "Ultimatum", {
							Speed = 0.5
						});
					elseif v304.Infinity == true then
						v16.Shift(v309.Rarity, "Infinity", {
							Speed = 0.5
						});
					elseif v304.Eternal == true then
						v16.Shift(v309.Rarity, "Eternal", {
							Speed = 0.5
						});
					elseif v304.Void == true then
						v16.Shift(v309.Rarity, "Void", {
							Speed = 0.5
						});
					elseif v304.Dev == true then
						v16.Shift(v309.Rarity, "Dev", {
							Speed = 0.5
						});
					
					
					else
						v16.None(v309.Rarity);
						v309.Rarity.TextColor3 = v18.RarityColors[v304.Rarity];
					end;
					if v309.Chance.Visible then
						v212(v309.Chance, v303.Pet);
					end;
					if v303.Pet.Shiny then
						if not v272.Shiny then
							v272.Shiny = true;
							v14("Shiny");
						end;
						v16.Cycle(v309.Shiny, "Shiny", {
							Speed = 1
						});
					end;
					if v303.Pet.Mythic and not v272.Mythic then
						v272.Mythic = true;
						v14("Mythic");
					end;
					if v303.New and not v272.Discovered then
						v272.Discovered = true;
						v14("Discovered");
					end;
					if v304.Rarity == "Legendary" and v306 and not v272.Legendary then
						v272.Legendary = true;
						v14("Legendary");
					end;
					if v304.Ancient == true and v306 and not v272.Legendary then
						v272.Ancient = true;
						v14("Ancient");
					end;
					if v304.Ultimatum == true and v306 and not v272.Legendary then
						v272.Ultimatum = true;
						v14("Ultimatum");
					end;
					if v304.Infinity == true and v306 and not v272.Legendary then
						v272.Infinity = true;
						v14("Infinity");
					end;
					if v304.Eternal == true and v306 and not v272.Legendary then
						v272.Eternal = true;
						v14("Eternal");
					end;
					if v304.Void == true and v306 and not v272.Legendary then
						v272.Void = true;
						v14("Void");
					end;
					if v304.Dev == true and v306 and not v272.Legendary then
						v272.Dev = true;
						v14("Dev");
					end;
					
					l_v290_0.Parent = workspace.Rendered.Generic;
					l_v291_0.Position.Value = (CFrame.new(v300[v299] or Vector3.new()) * CFrame.new(0, #v300 >= 4 and -0.25 or 0, -6.5)).Position - Vector3.new(0, v302, 0);
					l_v291_0.Rotation.Value = 3.141592653589793;
					l_v291_0.Scale.Value = 0.25;
					l_v291_0.Animator.Value = Vector3.new(0, -0.75, 0, 0);
					l_v291_0.Offset = CFrame.Angles(0.08726646259971647 * v301.Y, -0.08726646259971647 * v301.X, 0);
					l_TweenService_0:Create(l_v291_0.Scale, v247.Grow, {
						Value = 1
					}):Play();
					l_TweenService_0:Create(l_v291_0.Animator, v247.Grow, {
						Value = Vector3.new()
					}):Play();
					l_TweenService_0:Create(l_v291_0.Rotation, v247.Spin, {
						Value = 6.283185307179586
					}):Play();
					task.delay(0.2 / v243.Speed, function() --[[ Line: 1339 ]]
						-- upvalues: v309 (copy), v243 (ref), l_TweenService_0 (ref), v247 (ref), v307 (copy)
						if v309.New.Visible then
							task.delay(0.3 / v243.Speed, function() --[[ Line: 1341 ]]
								-- upvalues: l_TweenService_0 (ref), v309 (ref), v247 (ref)
								l_TweenService_0:Create(v309.New.UIGradient, v247.Shine, {
									Offset = Vector2.new(0.6, 0)
								}):Play();
							end);
						end;
						v309.Visible = v307;
						v309.UIScale.Scale = 0.75;
						v309.Label.TextSize = v309.New.Visible and 50 or 65;
						v309.Label.Size = UDim2.new(1, 0, 0, v309.Label.TextSize);
						l_TweenService_0:Create(v309.UIScale, v247.Grow, {
							Scale = 1
						}):Play();
					end);
					local v310 = (1.35 + v289.Index / (#v250 > 3 and 10 or 15)) / v243.Speed;
					if v305 then
						local l_Pet_2 = v289.Data.Pet;
						local v312;
						if not l_Pet_2.Name then
							v312 = false;
						else
							local v313 = v13[l_Pet_2.Name];
							local v314 = v29:Get();
							local v315 = v313.Chance >= v18.EasyLegendaryThreshold;
							if v314 and v313.Rarity == "Legendary" and not v314.Settings["Skip Easy Legendary"] then
								v315 = false;
							end;
							v312 = not l_Pet_2.Mythic and v315;
						end;
						if not v312 then
							v310 = v310 + (1 + (v303.Pet.Mythic and 0.5 or 0));
						end;
					end;
					if v281 and (v304.Rarity ~= "Legendary" and v304.Rarity ~= "Secret" or not v306) then
						v310 = 0;
					end;
					task.delay(v310, function() --[[ Line: 1359 ]]
						-- upvalues: l_v291_0 (ref), v309 (copy), v15 (ref), v304 (copy), v306 (copy), l_TweenService_0 (ref), l_Hatching_0 (ref), v247 (ref), v243 (ref), v14 (ref), v246 (ref), v285 (ref)
						local l_Value_1 = l_v291_0.Position.Value;
						local v317 = l_Value_1 * Vector3.new(0, 1, 1, 0) - Vector3.new(0, 7.5, 0, 0);
						local l_NumberValue_4 = Instance.new("NumberValue");
						v309.Visible = false;
						l_v291_0.Attachment:Destroy();
						l_NumberValue_4:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1366 ]]
							-- upvalues: l_v291_0 (ref), l_NumberValue_4 (copy), v15 (ref), l_Value_1 (copy), v317 (copy)
							l_v291_0.Scale.Value = math.max(1 - l_NumberValue_4.Value, 0.35);
							l_v291_0.Position.Value = v15(l_Value_1, v317, 6, l_NumberValue_4.Value);
						end);
						if (v304.Rarity == "Legendary" or v304.Rarity == "Secret") and v306 then
							l_TweenService_0:Create(l_Hatching_0.Border, v247.Shine, {
								ImageTransparency = 1
							}):Play();
						end;
						task.delay(0.1 / v243.Speed, v14, "PetMove");
						v246:Add(l_NumberValue_4);
						l_TweenService_0:Create(l_NumberValue_4, v247.Spin, {
							Value = 1
						}):Play();
						task.wait(v247.Spin.Time);
						v285 = v285 + 1;
					end);
					return;
				end;
			end);
		end;
	end;
	local v319 = {};
	for _, v321 in v250 do
		local v322 = v13[v321.Data.Pet.Name];
		local l_Rarity_2 = v322.Rarity;
		if l_Rarity_2 == "Legendary" or l_Rarity_2 == "Secret" then
			if l_Rarity_2 == "Secret" then
				table.insert(v256, v321);
			end;
			v255 = math.min(v255 or 1e999, v322.Chance);
			table.insert(v319, v321);
		end;
	end;
	if v255 then
		for v324 = #v319, 1, -1 do
			if v13[v319[v324].Data.Pet.Name].Chance ~= v255 then
				table.remove(v319, v324);
			end;
		end;
	end;
	if #v319 > 0 then
		local v325 = v58(#v319);
		local v326 = {};
		for _, v328 in v319 do
			local v329 = v245[v328.Index];
			local v330 = 1;
			local v331 = 1e999;
			for v332, v333 in v325 do
				if not v326[v332] then
					local l_Magnitude_0 = (v329 - v333).Magnitude;
					if l_Magnitude_0 < v331 then
						v331 = l_Magnitude_0;
						v330 = v332;
					end;
				end;
			end;
			v328.ReorderedIndex = v330;
			v328.ReorderedGrid = v325;
			v328.ReorderedPosition = (CFrame.new(v325[v330] or Vector3.new()) * CFrame.new(0, #v325 >= 4 and -0.25 or 0, -6.5)).Position;
			v326[v330] = true;
		end;
	end;
	repeat
		if v287 then
			l_Hatching_0.Border.ImageTransparency = 1;
			for v335, _ in v250 do
				v335.Parent = nil;
			end;
			for _, v338 in v256 do
				v38:SetVolume(0);
				l_Hatching_0.Overlay.BackgroundColor3 = Color3.new();
				l_Hatching_0.Overlay.BackgroundTransparency = 0;
				task.wait(0.75);
				l_TweenService_0:Create(l_Hatching_0.Overlay, TweenInfo.new(0.5), {
					BackgroundTransparency = 1
				}):Play();
				v26(v243.Name, v338.Data.Pet.Shiny);
				l_TweenService_0:Create(l_Hatching_0.Overlay, v54.Pulse, {
					BackgroundTransparency = 1
				}):Play();
				task.wait(0.25);
				local v339 = nil;
				local v340 = nil;
				for v341, v342 in v251 do
					if v342.Index == v338.Index then
						v339 = v341;
						v340 = v342;
						break;
					end;
				end;
				if v340 then
					v44:DisplayPetOnce(v340.Data.Pet);
					task.wait(4);
				end;
			end;
			v285 = v244;
		end;
		task.wait();
	until v285 == v244;
	v84(v243);
	v246:Cleanup();
	v21:Show();
	v36:Enable();
	if v257 == v241 then
		l_ScreenGui_0.Hatching.Visible = false;
		l_ScreenGui_0.HUD.Visible = true;
		l_ScreenGui_0.Notifications.Visible = true;
		l_Hatching_0.Overlay.BackgroundTransparency = 1;
		v169 = 0;
		v242._hatching = false;
	end;
	l_LocalPlayer_0.CameraMinZoomDistance = 0.5;
end;
v44.IsHatching = function(v343) --[[ Line: 1491 ]] --[[ Name: IsHatching ]]
	-- upvalues: v169 (ref), v213 (copy), v214 (ref)
	if v169 > 0 then
		return true;
	else
		return v343._hatching or #v213 > 0 or v214;
	end;
end;
v44.GetQueue = function(_) --[[ Line: 1499 ]] --[[ Name: GetQueue ]]
	-- upvalues: v213 (copy)
	return v213;
end;
for _, v346 in l_ReplicatedStorage_0.Assets.Animations:GetChildren() do
	if v346:FindFirstChild("Animation") then
		for _, v348 in v346:GetDescendants() do
			if v348:IsA("CFrameValue") then
				v348.Value = v348.Value + Vector3.new(10000, 0, 0, 0);
			end;
		end;
	end;
end;
v31(0.5, function() --[[ Line: 1517 ]]
	-- upvalues: v213 (copy), v214 (ref), v236 (copy)
	if #v213 > 0 and not v214 then
		v236();
	end;
end);


return v44;
