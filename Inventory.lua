

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Workspace");
local _ = game:GetService("StarterGui");
local _ = game:GetService("RunService");
local _ = game:GetService("HttpService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v7 = require(l_ReplicatedStorage_0.Client.Framework.Classes.VirtualGrid);
local v8 = require(l_ReplicatedStorage_0.Shared.Framework.Classes.Pool);
local v9 = require(l_ReplicatedStorage_0.Client.Gui.Utils.GetPetRenderList);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v11 = require(l_ReplicatedStorage_0.Client.Framework.Services.LocalData);
local l_ScreenGui_0 = l_Players_0.LocalPlayer.PlayerGui.ScreenGui;
local v13 = require(l_ReplicatedStorage_0.Shared.Utils.AnimateColor);
local v14 = require(l_ReplicatedStorage_0.Client.Gui.Utils.Shiny);
local v15 = require(l_ReplicatedStorage_0.Shared.Data.Pets);
local v16 = require(l_ReplicatedStorage_0.Client.Gui.Utils.ClickableButton);
local v17 = require(l_ReplicatedStorage_0.Client.Gui.Tooltip);
local v18 = require(l_ReplicatedStorage_0.Shared.Data.Builders.TooltipBuilder);
local v19 = require(l_ReplicatedStorage_0.Shared.Constants);
local v20 = require(l_ReplicatedStorage_0.Shared.Framework.Network.Remote);
local v21 = require(l_ReplicatedStorage_0.Shared.Utils.Stats.StatsUtil);
local v22 = require(l_ReplicatedStorage_0.Client.Gui.GuiFrame);
local v23 = require(l_ReplicatedStorage_0.Shared.Utils.RichText);
local v24 = require(l_ReplicatedStorage_0.Shared.Palette);
local v25 = require(l_ReplicatedStorage_0.Shared.Data.Potions);
local v26 = require(l_ReplicatedStorage_0.Shared.Data.Powerups);
local v27 = require(l_ReplicatedStorage_0.Client.Framework.Utilities.Gui.HookScrollingFrame);
local v28 = require(l_ReplicatedStorage_0.Shared.Utils.Stats.ItemUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.String.FormatRomanNumeral);
local v30 = require(l_ReplicatedStorage_0.Shared.Data.Titles);
local v31 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.String.FormatSuffix);
local v32 = require(l_ReplicatedStorage_0.Shared.Data.Builders.PromptBuilder);
local v33 = require(l_ReplicatedStorage_0.Client.Gui.Prompt);
local v34 = require(l_ReplicatedStorage_0.Client.Gui.Utils.AutoButtonColor);
local v35 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.String.FormatCommas);
local v36 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.String.FormatPlural);
local v37 = require(l_ReplicatedStorage_0.Client.Gui.Utils.Achievement);
local v38 = require(l_ReplicatedStorage_0.Shared.Data.Builders.AchievementBuilder);
local v39 = require(l_ReplicatedStorage_0.Shared.Utils.PetLevelUtil);
local v40 = require(l_ReplicatedStorage_0.Shared.Utils.Stats.PetUtil);
local v41 = require(l_ReplicatedStorage_0.Client.Gui.Utils.UpdateWhileGuiOpen);
local v42 = require(l_ReplicatedStorage_0.Client.Gui.PetEntryAppearance);
local v43 = require(l_ReplicatedStorage_0.Shared.Utils.SortPetsList);
local v44 = require(l_ReplicatedStorage_0.Client.Gui.Utils.LootPoolPage);
local v45 = require(l_ReplicatedStorage_0.Client.Gui.HookKeybind);
local v46 = require(l_ReplicatedStorage_0.Shared.Data.Flavors);
local v47 = require(l_ReplicatedStorage_0.Shared.Data.Currency);
local v48 = require(l_ReplicatedStorage_0.Client.Gui.Frames.PetChoosePrompt);
local v49 = require(l_ReplicatedStorage_0.Client.Gui.Frames.Enchants);
local v50 = require(l_ReplicatedStorage_0.Shared.Utils.EnchantUtil);
local v51 = require(l_ReplicatedStorage_0.Client.Gui.Frames.Potions);
local v52 = require(l_ReplicatedStorage_0.Client.Gui.Frames.Shiny);
local v53 = require(l_ReplicatedStorage_0.Shared.Utils.ShinyUtil);
local v54 = require(l_ReplicatedStorage_0.Shared.Utils.PetStackUtil);
local v55 = require(l_ReplicatedStorage_0.Shared.Data.Enchants);
local v56 = require(l_ReplicatedStorage_0.Client.Gui.Utils.ItemFrame);
local v57 = require(l_ReplicatedStorage_0.Shared.Utils.CurrencyUtil);
local _ = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.Math.Time);
local v59 = require(l_ReplicatedStorage_0.Client.Gui.Animations.ProcessingPurchase);
local v60 = require(l_ReplicatedStorage_0.Shared.Data.Gamepasses);
local _ = require(l_ReplicatedStorage_0.Shared.Data.Eggs);
local v62 = require(l_ReplicatedStorage_0.Client.Gui.Utils.CheckInventorySpace);
local v63 = require(l_ReplicatedStorage_0.Client.Framework.Services.InputMode);
local v64 = require(l_ReplicatedStorage_0.Client.Gui.Utils.PlayLocalSound);
local v65 = require(l_ReplicatedStorage_0.Client.Effects.HatchEgg);
local l_UIScale_0 = l_ScreenGui_0.UIScale;
local l_Inner_0 = l_ScreenGui_0.Inventory.Frame.Inner;
local l_Tray_0 = l_ScreenGui_0.Inventory.Frame.Tray;
local l_Search_0 = l_Tray_0.Search;
local l_PropertyChangedSignal_0 = l_Search_0.Search.Bar.TextBox:GetPropertyChangedSignal("Text");
local function v72(v71) --[[ Line: 87 ]] --[[ Name: makeSearchable ]]
    return string.lower((string.gsub(v71, "%s", "")));
end;
local function _(v73) --[[ Line: 91 ]] --[[ Name: getPetSearchName ]]
    -- upvalues: v15 (copy), v72 (copy)
    local l_Name_0 = v73.Name;
    l_Name_0 = ("%* %*"):format(v15[v73.Name].Rarity, l_Name_0);
    if v73.Mythic then
        l_Name_0 = ("Mythic %*"):format(l_Name_0);
    end;
    if v73.Shiny then
        l_Name_0 = ("Shiny %*"):format(l_Name_0);
    end;
    return v72(l_Name_0);
end;
local function _() --[[ Line: 106 ]] --[[ Name: getSearch ]]
    -- upvalues: l_Search_0 (copy), v72 (copy)
    local l_Text_0 = l_Search_0.Search.Bar.TextBox.Text;
    return v72(l_Text_0);
end;
local function _() --[[ Line: 111 ]] --[[ Name: clearSearch ]]
    -- upvalues: l_Search_0 (copy)
    l_Search_0.Search.Bar.TextBox.Text = "";
end;
l_Search_0.Search.Bar.TextBox.Focused:Connect(function() --[[ Line: 115 ]]
    -- upvalues: v17 (copy)
    v17:Hide();
end);
local v79 = nil;
local v80 = nil;
local l_CancelAutoExclusiveEggHatch_0 = l_ScreenGui_0.CancelAutoExclusiveEggHatch;
local v82 = 0;
local l_l_CancelAutoExclusiveEggHatch_0_0 = l_CancelAutoExclusiveEggHatch_0 --[[ copy: 78 -> 129 ]];
do
    local l_v82_0 = v82;
    v79 = function(v85) --[[ Line: 129 ]] --[[ Name: autoExclusiveEgg ]]
        -- upvalues: l_v82_0 (ref), v11 (copy), v22 (copy), l_l_CancelAutoExclusiveEggHatch_0_0 (copy), v20 (copy), v65 (copy)
        local v86 = l_v82_0 + 1;
        l_v82_0 = v86;
        local v87 = v11:Get();
        if not v87 then
            return;
        else
            v22:Close();
            l_l_CancelAutoExclusiveEggHatch_0_0.Visible = true;
            while v87.Powerups[v85] > 0 and l_v82_0 == v86 do
                v20:FireServer("HatchPowerupEgg", v85, (math.min(6, v87.Powerups[v85])));
                task.wait(0.2);
                repeat
                    task.wait();
                until not v65:IsHatching();
            end;
            l_l_CancelAutoExclusiveEggHatch_0_0.Visible = false;
            return;
        end;
    end;
    v80 = function() --[[ Line: 150 ]] --[[ Name: stopAutoExclusiveEgg ]]
        -- upvalues: l_v82_0 (ref), l_l_CancelAutoExclusiveEggHatch_0_0 (copy)
        l_v82_0 = l_v82_0 + 1;
        l_l_CancelAutoExclusiveEggHatch_0_0.Visible = false;
    end;
    v34(l_CancelAutoExclusiveEggHatch_0.Button, v24.Button.Red);
    v16(l_CancelAutoExclusiveEggHatch_0.Button, function() --[[ Line: 157 ]]
        -- upvalues: v80 (ref)
        v80();
    end);
end;
l_CancelAutoExclusiveEggHatch_0 = nil;
v82 = l_Inner_0.Pets.Main.ScrollingFrame.Pets.Parent.Team.Title;
local l_v82_1 = v82 --[[ copy: 79 -> 130 ]];
l_CancelAutoExclusiveEggHatch_0 = function() --[[ Line: 179 ]] --[[ Name: stopRenamingTeam ]]
    -- upvalues: l_v82_1 (copy)
    l_v82_1.Edit.TextBox:ReleaseFocus();
    l_v82_1.Edit.Visible = false;
    l_v82_1.Main.Visible = true;
end;
local function _() --[[ Line: 185 ]] --[[ Name: startRenamingTeam ]]
    -- upvalues: l_v82_1 (copy)
    l_v82_1.Edit.TextBox.Text = "";
    l_v82_1.Edit.Visible = true;
    l_v82_1.Main.Visible = false;
    l_v82_1.Edit.TextBox:CaptureFocus();
end;
v82.Edit.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 192 ]]
    -- upvalues: l_v82_1 (copy), v19 (copy)
    l_v82_1.Edit.TextBox.Text = string.sub(l_v82_1.Edit.TextBox.Text, 1, v19.MaxTeamNameLength);
end);
local function v92() --[[ Line: 196 ]] --[[ Name: updateRenameAvailability ]]
    -- upvalues: v11 (copy), v21 (copy), l_v82_1 (copy)
    local v90 = v11:Get();
    local v91 = v90 and v21:GetMaxPetTeams(v90) > 1;
    l_v82_1.Main.Rename.Visible = v91;
end;
local v93 = v11:Get();
local v94 = v93 and v21:GetMaxPetTeams(v93) > 1;
v82.Main.Rename.Visible = v94;
v11:ConnectDataChanged({
    "MasteryLevels", 
    "MasteryUpgrades"
}, v92);
v82.Edit.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 204 ]]
    -- upvalues: l_v82_1 (copy)
    if #l_v82_1.Edit.TextBox.Text == 0 then
        l_v82_1.Edit.TextBox.UIStrokeText.Transparency = 0.6;
        return;
    else
        l_v82_1.Edit.TextBox.UIStrokeText.Transparency = 0;
        return;
    end;
end);
v34(v82.Main.Rename.Button, v24.Button.Purple);
v16(v82.Main.Rename.Button, function() --[[ Line: 214 ]]
    -- upvalues: l_v82_1 (copy)
    l_v82_1.Edit.TextBox.Text = "";
    l_v82_1.Edit.Visible = true;
    l_v82_1.Main.Visible = false;
    l_v82_1.Edit.TextBox:CaptureFocus();
end);
v34(v82.Edit.Confirm.Button, v24.Button.Purple);
v16(v82.Edit.Confirm.Button, function() --[[ Line: 219 ]]
    -- upvalues: l_v82_1 (copy), v20 (copy), l_CancelAutoExclusiveEggHatch_0 (ref)
    local v95 = string.match(l_v82_1.Edit.TextBox.Text, "^%s*(.-)%s*$");
    if v95 and #v95 > 0 then
        v20:FireServer("RenameTeam", v95);
        l_CancelAutoExclusiveEggHatch_0();
    end;
end);
v34(v82.Edit.Cancel.Button, v24.Button.Red);
v16(v82.Edit.Cancel.Button, function() --[[ Line: 228 ]]
    -- upvalues: l_CancelAutoExclusiveEggHatch_0 (ref)
    l_CancelAutoExclusiveEggHatch_0();
end);
v22:BindOnClosed("Inventory", l_CancelAutoExclusiveEggHatch_0);
v11:ConnectDataChanged("Teams", l_CancelAutoExclusiveEggHatch_0);
v82 = function(v96) --[[ Line: 244 ]] --[[ Name: formatBytesAsMB ]]
    local v97 = string.format("%.02f", v96 / 1000000);
    v97 = string.gsub(v97, "0+$", "");
    return (string.gsub(v97, "%.$", ""));
end;
v41("Inventory", {
    "Pets", 
    "PermanentBuffs", 
    "Passes", 
    "MasteryLevels", 
    "MasteryUpgrades"
}, function() --[[ Line: 252 ]] --[[ Name: updateStorage ]]
    -- upvalues: v11 (copy), l_ScreenGui_0 (copy), v21 (copy), v35 (copy)
    local v98 = v11:Get();
    if not v98 then
        return;
    else
        local l_StorageHolder_0 = l_ScreenGui_0.Inventory.Frame.Top.StorageHolder;
        local l_v21_MaxPetStorage_0 = v21:GetMaxPetStorage(v98);
        local l_v21_UsedPetStorage_0 = v21:GetUsedPetStorage(v98);
        local v102 = math.min(l_v21_MaxPetStorage_0, l_v21_UsedPetStorage_0);
        local v103 = l_v21_MaxPetStorage_0 <= l_v21_UsedPetStorage_0;
        local v104 = if v103 then Color3.fromHex("#ff2f2f") else Color3.fromRGB(255, 255, 255);
        local v105 = v21:HasDigitalStorage(v98);
        if v105 then
            local l_Digital_0 = l_StorageHolder_0.Digital;
            local v107 = "\240\159\146\190 %* / %* MB";
            local v108 = string.format("%.02f", v102 / 1000000);
            v108 = string.gsub(v108, "0+$", "");
            l_Digital_0.Text = v107:format(string.gsub(v108, "%.$", ""), l_v21_MaxPetStorage_0 // 1000000);
            l_StorageHolder_0.Digital.TextColor3 = v104;
            l_StorageHolder_0.Digital.Visible = true;
            l_StorageHolder_0.Storage.Visible = false;
            l_StorageHolder_0.Digital.Bar.Fill.Size = UDim2.fromScale(v102 / l_v21_MaxPetStorage_0, 1);
            l_StorageHolder_0.Digital.Bar.Fill.UIGradient.Color = if not v103 then ColorSequence.new(Color3.fromHex("#00ffff"), Color3.fromHex("#00bbff")) else ColorSequence.new(Color3.fromHex("#ff2f2f"), Color3.fromHex("#d50000"));
        else
            l_StorageHolder_0.Storage.Text = ("\240\159\147\166 %* / %*"):format(v35(l_v21_UsedPetStorage_0), (v35(l_v21_MaxPetStorage_0)));
            l_StorageHolder_0.Storage.TextColor3 = v104;
            l_StorageHolder_0.Storage.Visible = true;
            l_StorageHolder_0.Digital.Visible = false;
        end;
        l_StorageHolder_0.Buy.Button.Visible = not v105;
        return;
    end;
end);
v92 = l_ScreenGui_0.Inventory.Frame.Top.StorageHolder.Buy.Button;
v34(v92, v24.Button.Orange);
v16(v92, function() --[[ Line: 291 ]]
    -- upvalues: v59 (copy), l_MarketplaceService_0 (copy), l_Players_0 (copy), v60 (copy), v19 (copy)
    v59:Show();
    l_MarketplaceService_0:PromptGamePassPurchase(l_Players_0.LocalPlayer, v60[v19.DigitalStoragePassName].Id);
end);
local l_v92_0 = v92 --[[ copy: 81 -> 131 ]];
v22:BindOnOpened("Inventory", function() --[[ Line: 296 ]]
    -- upvalues: v14 (copy), l_v92_0 (copy)
    v14:Add(l_v92_0);
end);
v22:BindOnClosed("Inventory", function() --[[ Line: 299 ]]
    -- upvalues: v14 (copy), l_v92_0 (copy)
    v14:Remove(l_v92_0);
end);
v92 = v42.animatedGradients;
v93 = nil;
v94 = v23.new():size(20);
local l_v94_0 = v94 --[[ copy: 83 -> 132 ]];
v93 = function(v111) --[[ Line: 314 ]] --[[ Name: formatAmountText ]]
    -- upvalues: v23 (copy), l_v94_0 (copy), v31 (copy)
    return v23.autoStroke((("%*%*"):format(l_v94_0("x"), (v31(v111, 1000)))));
end;
v94 = nil;
local l_Notification_0 = l_ScreenGui_0.Inventory.Frame.Sidebar.Buttons.Pets.Button.Notification;
local v113 = 0;
local l_l_Notification_0_0 = l_Notification_0 --[[ copy: 84 -> 133 ]];
do
    local l_v113_0 = v113;
    local function _() --[[ Line: 326 ]] --[[ Name: update ]]
        -- upvalues: l_l_Notification_0_0 (copy), l_v113_0 (ref)
        l_l_Notification_0_0.Visible = l_v113_0 > 0;
        l_l_Notification_0_0.Label.Text = if l_v113_0 < 10 then tostring(l_v113_0) else "!";
    end;
    v94 = function() --[[ Line: 331 ]] --[[ Name: clearPetsNotifications ]]
        -- upvalues: l_v113_0 (ref), l_l_Notification_0_0 (copy)
        l_v113_0 = 0;
        l_l_Notification_0_0.Visible = l_v113_0 > 0;
        l_l_Notification_0_0.Label.Text = if l_v113_0 < 10 then tostring(l_v113_0) else "!";
    end;
    v22:BindOnOpened("Inventory", function() --[[ Line: 336 ]]
        -- upvalues: l_Inner_0 (copy), v94 (ref)
        if l_Inner_0.Pets.Visible then
            v94();
        end;
    end);
    v20.Event("AddPetNotification"):Connect(function(v117) --[[ Line: 342 ]]
        -- upvalues: l_Inner_0 (copy), v22 (copy), l_v113_0 (ref), l_l_Notification_0_0 (copy)
        if not l_Inner_0.Pets.Visible or not v22:IsOpen("Inventory") then
            l_v113_0 = l_v113_0 + (v117 or 1);
            l_l_Notification_0_0.Visible = l_v113_0 > 0;
            l_l_Notification_0_0.Label.Text = if l_v113_0 < 10 then tostring(l_v113_0) else "!";
        end;
    end);
    v94();
end;
l_Notification_0 = nil;
v113 = l_ScreenGui_0.Inventory.Frame.Sidebar.Buttons.Items.Button.Notification;
local v118 = 0;
local l_v113_1 = v113 --[[ copy: 85 -> 134 ]];
do
    local l_v118_0 = v118;
    local function _() --[[ Line: 359 ]] --[[ Name: update ]]
        -- upvalues: l_v113_1 (copy), l_v118_0 (ref)
        l_v113_1.Visible = l_v118_0 > 0;
        l_v113_1.Label.Text = if l_v118_0 < 10 then tostring(l_v118_0) else "!";
    end;
    l_Notification_0 = function() --[[ Line: 364 ]] --[[ Name: clearItemsNotifications ]]
        -- upvalues: l_v118_0 (ref), l_v113_1 (copy)
        l_v118_0 = 0;
        l_v113_1.Visible = l_v118_0 > 0;
        l_v113_1.Label.Text = if l_v118_0 < 10 then tostring(l_v118_0) else "!";
    end;
    v22:BindOnOpened("Inventory", function() --[[ Line: 369 ]]
        -- upvalues: l_Inner_0 (copy), l_Notification_0 (ref)
        if l_Inner_0.Items.Visible then
            l_Notification_0();
        end;
    end);
    v20.Event("AddItemNotification"):Connect(function(v122) --[[ Line: 375 ]]
        -- upvalues: l_Inner_0 (copy), v22 (copy), l_v118_0 (ref), l_v113_1 (copy)
        if not l_Inner_0.Items.Visible or not v22:IsOpen("Inventory") then
            l_v118_0 = l_v118_0 + (v122 or 1);
            l_v113_1.Visible = l_v118_0 > 0;
            l_v113_1.Label.Text = if l_v118_0 < 10 then tostring(l_v118_0) else "!";
        end;
    end);
    l_Notification_0();
end;
v113 = nil;
v118 = nil;
local v123 = nil;
local v124 = nil;
local l_ScrollingFrame_0 = l_Inner_0.Pets.Main.ScrollingFrame;
local l_Pets_0 = l_ScrollingFrame_0.Pets;
local l_UIGridLayout_0 = l_Pets_0.UIGridLayout;
local l_Details_0 = l_Inner_0.Pets.Details;
l_Details_0.Stats.Bubbles.Icon.Image = v46["Bubble Gum"].Image;
l_Details_0.Stats.Bubbles.Amount.TextColor3 = v46["Bubble Gum"].Color;
l_Details_0.Stats.Gems.Icon.Image = v47.Gems.Image;
l_Details_0.Stats.Gems.Amount.TextColor3 = v47.Gems.Color;
local l_l_Details_0_0 = l_Details_0 --[[ copy: 92 -> 135 ]];
local function v133() --[[ Line: 413 ]] --[[ Name: updateStatSizes ]]
    -- upvalues: l_l_Details_0_0 (copy), l_UIScale_0 (copy)
    local v130 = math.ceil(l_l_Details_0_0.Stats.Bubbles.Amount.TextBounds.X / l_UIScale_0.Scale) + 1;
    local v131 = math.ceil(l_l_Details_0_0.Stats.Currency.Amount.TextBounds.X / l_UIScale_0.Scale) + 1;
    local v132 = math.ceil(l_l_Details_0_0.Stats.Gems.Amount.TextBounds.X / l_UIScale_0.Scale) + 1;
    l_l_Details_0_0.Stats.Bubbles.Amount.Size = UDim2.new(0, v130, 1, 0);
    l_l_Details_0_0.Stats.Currency.Amount.Size = UDim2.new(0, v131, 1, 0);
    l_l_Details_0_0.Stats.Gems.Amount.Size = UDim2.new(0, v132, 1, 0);
end;
l_Details_0.Stats.Bubbles.Amount:GetPropertyChangedSignal("TextBounds"):Connect(v133);
l_Details_0.Stats.Currency.Amount:GetPropertyChangedSignal("TextBounds"):Connect(v133);
l_Details_0.Stats.Gems.Amount:GetPropertyChangedSignal("TextBounds"):Connect(v133);
l_UIScale_0:GetPropertyChangedSignal("Scale"):Connect(v133);
v133();
local l_Template_0 = l_Pets_0.Template;
l_Template_0.Parent = nil;
local v135 = nil;
local v136 = nil;
local v137 = "Power";
local v138 = {};
local v139 = false;
local l_MultiDelete_0 = l_Inner_0.Parent.MultiDelete;
local l_l_MultiDelete_0_0 = l_MultiDelete_0 --[[ copy: 100 -> 136 ]];
local l_v138_0 = v138 --[[ copy: 98 -> 137 ]];
do
    local l_v135_0, l_v136_0, l_v137_0, l_v139_0 = v135, v136, v137, v139;
    local function v148() --[[ Line: 442 ]] --[[ Name: updateMultiDeleteUI ]]
        -- upvalues: l_v139_0 (ref), l_l_MultiDelete_0_0 (copy), l_Tray_0 (copy), l_v138_0 (copy)
        if not l_v139_0 then
            l_l_MultiDelete_0_0.Visible = false;
            l_Tray_0.Buttons.Buttons.Delete.Button.Highlight.ImageColor3 = Color3.fromRGB(255, 255, 255);
            return;
        else
            local v147 = #l_v138_0;
            if v147 == 0 then
                l_l_MultiDelete_0_0.Label.Text = "Select pets to delete";
                l_l_MultiDelete_0_0.Label.TextSize = 28;
            else
                l_l_MultiDelete_0_0.Label.Text = ("Selected %* pet%* to delete"):format(v147, v147 == 1 and "" or "s");
                l_l_MultiDelete_0_0.Label.TextSize = 24;
            end;
            l_l_MultiDelete_0_0.Visible = true;
            l_Tray_0.Buttons.Buttons.Delete.Button.Highlight.ImageColor3 = Color3.fromRGB(235, 70, 70);
            return;
        end;
    end;
    v123 = function() --[[ Line: 461 ]] --[[ Name: getIsMultiDeleting ]]
        -- upvalues: l_v139_0 (ref)
        return l_v139_0;
    end;
    local l_v148_0 = v148 --[[ copy: 101 -> 138 ]];
    v124 = function() --[[ Line: 465 ]] --[[ Name: stopMultiDeleting ]]
        -- upvalues: l_v138_0 (copy), l_v139_0 (ref), l_v148_0 (copy), v113 (ref)
        table.clear(l_v138_0);
        l_v139_0 = false;
        l_v148_0();
        v113();
    end;
    local _ = function(v150, v151) --[[ Line: 473 ]] --[[ Name: findPet ]]
        for _, v153 in v150 do
            if v153.Id == v151 then
                return v153;
            end;
        end;
        return nil;
    end;
    local l_l_Template_0_0 = l_Template_0 --[[ copy: 94 -> 139 ]];
    local v171 = v8.new(function() --[[ Line: 483 ]]
        -- upvalues: l_l_Template_0_0 (copy), v17 (copy), v11 (copy), l_ScreenGui_0 (copy), v63 (copy), l_v139_0 (ref), v18 (copy), v16 (copy), l_CancelAutoExclusiveEggHatch_0 (ref), l_v138_0 (copy), l_v148_0 (copy), l_v135_0 (ref), l_v136_0 (ref), v113 (ref), v118 (ref)
        local v156 = l_l_Template_0_0:Clone();
        v17:OnEnter(v156.Inner.Button, function() --[[ Line: 486 ]]
            -- upvalues: v11 (ref), l_ScreenGui_0 (ref), v156 (copy), v63 (ref), l_v139_0 (ref), v18 (ref)
            local v157 = false;
            local v158 = v11:Get();
            if not v158 then
                return;
            elseif l_ScreenGui_0:FindFirstChild("Prompt") then
                return;
            else
                local v159 = string.sub(v156.Name, 1, 36);
                local v160;
                for _, v162 in v158.Pets do
                    if v162.Id == v159 then
                        v160 = v162;
                        v157 = true;
                    end;
                    if v157 then
                        break;
                    end;
                end;
                if not v157 then
                    v160 = nil;
                end;
                v157 = false;
                if not v160 then
                    return;
                elseif v63.Mode == "Touch" then
                    return;
                elseif l_v139_0 and v63.Mode ~= "Keyboard" then
                    return;
                else
                    return v18.fromPet(v160, v158);
                end;
            end;
        end);
        v16(v156.Inner.Button, function() --[[ Line: 510 ]]
            -- upvalues: v11 (ref), l_CancelAutoExclusiveEggHatch_0 (ref), v156 (copy), l_v139_0 (ref), l_v138_0 (ref), l_v148_0 (ref), l_v135_0 (ref), l_v136_0 (ref), v113 (ref), v118 (ref)
            local v163 = v11:Get();
            if not v163 then
                return;
            else
                l_CancelAutoExclusiveEggHatch_0();
                local l_Name_1 = v156.Name;
                local v165 = string.sub(l_Name_1, 1, 36);
                local v166 = nil;
                for _, v168 in v163.Pets do
                    if v168.Id == v165 then
                        v166 = v168;
                        break;
                    end;
                end;
                if not v166 then
                    return;
                else
                    if l_v139_0 then
                        if v166.Locked then
                            return;
                        else
                            local v169 = table.find(l_v138_0, l_Name_1);
                            if v169 ~= nil then
                                table.remove(l_v138_0, v169);
                            else
                                table.insert(l_v138_0, l_Name_1);
                            end;
                            l_v148_0();
                        end;
                    else
                        l_v135_0 = l_Name_1;
                        l_v136_0 = false;
                    end;
                    v113();
                    v118();
                    return;
                end;
            end;
        end);
        return v156;
    end, function(v170) --[[ Line: 554 ]]
        -- upvalues: v92 (copy), v13 (copy), v14 (copy)
        v92[v170.Inner.Background.UIGradient] = nil;
        v13.None(v170.Inner.Button);
        v13.None(v170.Inner.Button.Inner);
        v14:Remove(v170.Inner.Effect);
    end);
    local v173 = v8.new(function() --[[ Line: 563 ]]
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.BackgroundTransparency = 1;
        return l_Frame_0;
    end);
    local l_Text_1 = l_Search_0.Search.Bar.TextBox.Text;
    local v175 = string.lower((string.gsub(l_Text_1, "%s", "")));
    l_Text_1 = nil;
    local v176 = nil;
    local v177 = {};
    local l_v177_0 = v177 --[[ copy: 108 -> 140 ]];
    local l_l_UIGridLayout_0_0 = l_UIGridLayout_0 --[[ copy: 91 -> 141 ]];
    local l_v173_0 = v173 --[[ copy: 104 -> 142 ]];
    local l_v171_0 = v171 --[[ copy: 103 -> 143 ]];
    local v222 = v7.new(l_ScrollingFrame_0, l_UIGridLayout_0, function(v182) --[[ Line: 575 ]]
        -- upvalues: v11 (copy), l_Text_1 (ref), v176 (ref), l_Search_0 (copy), v175 (ref), v43 (copy), l_v137_0 (ref), l_v177_0 (copy), v15 (copy), v54 (copy), l_l_UIGridLayout_0_0 (copy), v9 (copy), l_v173_0 (copy), l_v171_0 (copy), l_v135_0 (ref), v42 (copy), l_v138_0 (copy)
        local v183 = v11:Get();
        if not v183 then
            return function() --[[ Line: 578 ]]
                return nil;
            end, function() --[[ Line: 578 ]]
                return 0;
            end;
        else
            local l_l_Text_1_0 = l_Text_1;
            local l_v176_0 = v176;
            local l_Text_2 = l_Search_0.Search.Bar.TextBox.Text;
            local v187 = string.lower((string.gsub(l_Text_2, "%s", "")));
            if not v176 or not l_l_Text_1_0 or not v182 or v175 ~= v187 then
                l_Text_2 = {};
                l_l_Text_1_0 = {};
                local v188 = {};
                for _, v190 in v183.Teams[v183.TeamEquipped].Pets do
                    v188[v190] = (v188[v190] or 0) + 1;
                end;
                local v191 = {};
                local v192 = {};
                for _, v194 in v183.Pets do
                    table.insert(v191, v194.Id);
                    v192[v194.Id] = v194;
                end;
                v43(v191, v192, l_v137_0);
                table.clear(l_v177_0);
                for _, v196 in v191 do
                    local v197 = v192[v196];
                    local l_Name_2 = v197.Name;
                    local l_Name_3 = v197.Name;
                    l_Name_3 = ("%* %*"):format(v15[v197.Name].Rarity, l_Name_3);
                    if v197.Mythic then
                        l_Name_3 = ("Mythic %*"):format(l_Name_3);
                    end;
                    if v197.Shiny then
                        l_Name_3 = ("Shiny %*"):format(l_Name_3);
                    end;
                    local v200 = string.lower((string.gsub(l_Name_3, "%s", "")));
                    if #v187 <= 0 or string.find(v200, v187, 1, true) then
                        if v15[l_Name_2].Rarity == "Secret" then
                            l_Text_2[v196] = true;
						end;
						if v15[l_Name_2].Infinity == true then
							l_Text_2[v196] = true;
						end;
						if v15[l_Name_2].Void == true then
							l_Text_2[v196] = true;
						end;
						if v15[l_Name_2].Ancient == true then
							l_Text_2[v196] = true;
						end;
						if v15[l_Name_2].Ultimatum == true then
							l_Text_2[v196] = true;
						end;
						if v15[l_Name_2].Dev == true then
							l_Text_2[v196] = true;
						end;
						if v15[l_Name_2].Eternal == true then
							l_Text_2[v196] = true;
						end
                        local v201 = v188[v196] or 0;
                        if v197.Amount == nil then
                            if v201 <= 0 then
                                local v202 = ("%*-0"):format(v196);
                                table.insert(l_l_Text_1_0, v202);
                                l_v177_0[v196] = v202;
                            end;
                            v188[v196] = v201 - 1;
                        else
                            local v203 = math.max(0, v197.Amount - v201);
                            if v203 > 0 then
                                if v54:GetMinStackSize(v183, v197) <= v203 then
                                    local v204 = ("%*-stack"):format(v196);
                                    table.insert(l_l_Text_1_0, v204);
                                    l_v177_0[v196] = v204;
                                else
                                    for v205 = 1, v203 do
                                        table.insert(l_l_Text_1_0, (("%*-%*"):format(v196, v205 - 1)));
                                    end;
                                    l_v177_0[v196] = ("%*-0"):format(v196);
                                end;
                            end;
                            v188[v196] = v201 - v203;
                        end;
                    end;
                end;
                local v206 = next(l_Text_2) == nil and 6 or 8;
                if v206 == 6 then
                    l_l_UIGridLayout_0_0.CellSize = UDim2.fromOffset(135, 135);
                else
                    l_l_UIGridLayout_0_0.CellSize = UDim2.fromOffset(100, 100);
                end;
                l_v176_0 = v9(l_l_Text_1_0, l_Text_2, v206);
                l_Text_1 = l_l_Text_1_0;
                v176 = l_v176_0;
                v175 = v187;
            end;
            l_Text_2 = {};
            for _, v208 in v183.Pets do
                l_Text_2[v208.Id] = v208;
            end;
            local v209 = {};
            for _, v211 in v183.Teams[v183.TeamEquipped].Pets do
                v209[v211] = (v209[v211] or 0) + 1;
            end;
            return function(v212) --[[ Line: 672 ]]
                -- upvalues: l_v176_0 (ref), l_v173_0 (ref), l_Text_2 (copy), v15 (ref), l_v171_0 (ref), l_v135_0 (ref), v42 (ref), v209 (copy), l_v138_0 (ref)
                local v213 = l_v176_0[v212];
                if v213 == nil then
                    return nil;
                elseif v213 == "" then
                    return l_v173_0:Get();
                else
                    local v214 = string.sub(v213, 1, 36);
                    local v215 = l_Text_2[v214];
                    local v216 = string.sub(v213, -5) == "stack";
					local v217 = v15[v215.Name].Rarity == "Secret";
					local v2infinity = v15[v215.Name].Infinity == true;
					local v2void = v15[v215.Name].Void == true;
					local v2ancient = v15[v215.Name].Ancient == true;
					local v2ultimatum = v15[v215.Name].Ultimatum == true;
					local v2dev = v15[v215.Name].Dev == true;
					local v2eternal = v15[v215.Name].Eternal == true;
                    local v218 = l_v171_0:Get();
                    v218.Name = v213;
                    if v217 or v2infinity or v2void	or v2ancient or v2ultimatum or v2dev or v2eternal then
                        v218.Inner.Size = UDim2.new(2, 15, 2, 15);
                    else
                        v218.Inner.Size = UDim2.new(1, 0, 1, 0);
                    end;
                    local v219 = v213 == l_v135_0;
                    if not v216 then
                        v42.set(v218, v215, false, v219);
                    else
                        local v220 = (v215.Amount or 1) - (v209[v214] or 0);
                        local v221 = table.clone(v215);
                        v221.Amount = v220;
                        v42.set(v218, v221, v220 > 1, v219);
                    end;
                    v218.Inner.Button.Deleting.Visible = table.find(l_v138_0, v213) ~= nil;
                    return v218;
                end;
            end, function() --[[ Line: 709 ]]
                -- upvalues: l_v171_0 (ref), l_v173_0 (ref), l_v176_0 (ref)
                l_v171_0:Done();
                l_v173_0:Done();
                return #l_v176_0;
            end;
        end;
    end);
    local l_Equip_0 = l_Inner_0.Pets.Details.Buttons.Equip;
    local l_Unequip_0 = l_Inner_0.Pets.Details.Buttons.Unequip;
    local l_Shiny_0 = l_Inner_0.Pets.Details.Buttons.Shiny;
    local v226 = false;
    local function _(v227) --[[ Line: 723 ]] --[[ Name: fmtMult ]]
        -- upvalues: v31 (copy)
        if v227 >= 10 then
            return v31(v227);
        else
            return string.format("%0.1f", v227):gsub("0+$", ""):gsub("%.$", "");
        end;
    end;
    local l_l_Equip_0_0 = l_Equip_0 --[[ copy: 110 -> 144 ]];
    local l_l_Unequip_0_0 = l_Unequip_0 --[[ copy: 111 -> 145 ]];
    local l_l_Shiny_0_0 = l_Shiny_0 --[[ copy: 112 -> 146 ]];
    local l_v222_0 = v222 --[[ copy: 109 -> 147 ]];
    v113 = function() --[[ Line: 730 ]] --[[ Name: updatePets ]]
        -- upvalues: v11 (copy), l_v135_0 (ref), l_v136_0 (ref), v13 (copy), l_l_Details_0_0 (copy), v40 (copy), v47 (copy), v31 (copy), v50 (copy), v55 (copy), v42 (copy), v39 (copy), l_l_Equip_0_0 (copy), l_l_Unequip_0_0 (copy), v53 (copy), l_l_Shiny_0_0 (copy), v226 (ref), l_Tray_0 (copy), l_v137_0 (ref), l_v222_0 (copy)
        local v233 = false;
        local v234 = false;
        local v235 = v11:Get();
        if not v235 then
            return;
        else
            local v236 = nil;
            local v237 = nil;
            if l_v135_0 then
                v236 = string.sub(l_v135_0, 1, 36);
                local l_Pets_1 = v235.Pets;
                local l_v236_0 = v236;
                for _, v241 in l_Pets_1 do
                    if v241.Id == l_v236_0 then
                        v237 = v241;
                        v233 = true;
                    end;
                    if v233 then
                        break;
                    end;
                end;
                if not v233 then
                    v237 = nil;
                end;
                v233 = false;
                if not v237 then
                    l_v135_0 = nil;
                end;
            end;
            if l_v135_0 and v236 and v237 then
                local v242 = string.sub(l_v135_0, 1, 36);
                local v243;
                for _, v245 in v235.Pets do
                    if v245.Id == v242 then
                        v243 = v245;
                        v234 = true;
                    end;
                    if v234 then
                        break;
                    end;
                end;
                if not v234 then
                    v243 = nil;
                end;
                v234 = false;
                if not v243 then
                    return warn("didn't find selected pet? should not happen");
                else
                    local v246 = 0;
                    for _, v248 in v235.Teams[v235.TeamEquipped].Pets do
                        if v242 == v248 then
                            v246 = v246 + 1;
                        end;
                    end;
                    local v249 = 0;
                    for _, v251 in v235.Pets do
                        if v251.Id == v242 then
                            v249 = v251.Amount or 1;
                            break;
                        end;
                    end;
                    local v252 = l_v136_0 and v246 > 0;
                    if v243.Shiny then
                        v13.Cycle(l_l_Details_0_0.Title, "Shiny", {
                            Speed = 0.5
                        });
                    else
                        v13.None(l_l_Details_0_0.Title);
                    end;
                    l_l_Details_0_0.Title.Text = v243.Name;
                    l_l_Details_0_0.Title.Visible = true;
                    l_l_Details_0_0.Icon.Visible = true;
                    l_l_Details_0_0.Buttons.Visible = true;
                    local l_v40_Stats_0 = v40:GetStats(v243, v235);
                    local v254 = l_v40_Stats_0.Bubbles or 0;
                    local v255 = l_v40_Stats_0.Gems or 0;
                    local v256 = "Coins";
                    local v257 = nil;
                    for v258 in v47 do
                        if l_v40_Stats_0[v258] and v258 ~= "Gems" and v258 ~= "Bubbles" then
                            v256 = v258;
                            break;
                        end;
                    end;
                    v257 = l_v40_Stats_0[v256] or 0;
                    l_l_Details_0_0.Stats.Bubbles.Amount.Text = ("+%*"):format((v31(v254)));
                    l_l_Details_0_0.Stats.Gems.Amount.Text = ("x%*"):format(if v255 >= 10 then v31(v255) else string.format("%0.1f", v255):gsub("0+$", ""):gsub("%.$", ""));
                    local l_Amount_0 = l_l_Details_0_0.Stats.Currency.Amount;
                    local v260 = "x%*";
                    local l_v257_0 = v257;
                    l_Amount_0.Text = v260:format(if l_v257_0 >= 10 then v31(l_v257_0) else string.format("%0.1f", l_v257_0):gsub("0+$", ""):gsub("%.$", ""));
                    l_l_Details_0_0.Stats.Currency.Icon.Image = v47[v256].Image;
                    l_l_Details_0_0.Stats.Currency.Amount.TextColor3 = v47[v256].Color;
                    l_Amount_0 = v255 > 0 and 3 or 2;
                    local v262 = if v243.Enchants then #v243.Enchants else 0;
                    v260 = UDim2.new(0, 0, 0, 0);
                    local v263 = 0;
                    local v264 = UDim2.new(0, 0, 0, 0);
                    l_v257_0 = 0;
                    if l_Amount_0 < 3 or v262 == 0 then
                        v260 = UDim2.new(1, 0, 0, 50);
                        v263 = 38;
                        v264 = UDim2.new(1, 0, 0, 35);
                        l_v257_0 = 28;
                    elseif v262 == 1 then
                        v260 = UDim2.new(1, 0, 0, 42);
                        v263 = 33;
                        v264 = UDim2.new(1, 0, 0, 35);
                        l_v257_0 = 28;
                    else
                        v260 = UDim2.new(1, 0, 0, 34);
                        v263 = 32;
                        v264 = UDim2.new(1, 0, 0, 30);
                        l_v257_0 = 25;
                    end;
                    l_l_Details_0_0.Stats.Bubbles.Size = v260;
                    l_l_Details_0_0.Stats.Bubbles.Amount.TextSize = v263;
                    l_l_Details_0_0.Stats.Gems.Size = v260;
                    l_l_Details_0_0.Stats.Gems.Amount.TextSize = v263;
                    l_l_Details_0_0.Stats.Currency.Size = v260;
                    l_l_Details_0_0.Stats.Currency.Amount.TextSize = v263;
                    l_l_Details_0_0.Enchants.Enchant1.Size = v264;
                    l_l_Details_0_0.Enchants.Enchant1.Title.TextSize = l_v257_0;
                    l_l_Details_0_0.Enchants.Enchant2.Size = v264;
                    l_l_Details_0_0.Enchants.Enchant2.Title.TextSize = l_v257_0;
                    l_l_Details_0_0.Stats.Gems.Visible = v255 > 0;
                    l_l_Details_0_0.Stats.Visible = true;
                    local v265 = v243.Enchants or {};
                    for v266 = 1, 2 do
                        local l_FirstChild_0 = l_l_Details_0_0.Enchants:FindFirstChild((("Enchant%*"):format(v266)));
                        local v268 = v265[v266];
                        if v268 == nil then
                            l_FirstChild_0.Visible = false;
                        else
                            l_FirstChild_0.Visible = true;
                            l_FirstChild_0.Title.Text = v50:GetFullTitle(v268.Id, v268.Level);
                            l_FirstChild_0.Title.TextColor3 = v55[v268.Id].Color;
                        end;
                    end;
                    l_l_Details_0_0.Enchants.Visible = #v265 > 0;
                    v42.set(l_l_Details_0_0.Icon, v243, false, false);
                    local l_v39_LevelFromPet_0 = v39:GetLevelFromPet(v243);
                    local l_XP_0 = v243.XP;
                    local l_v39_TotalXPForLevel_0 = v39:GetTotalXPForLevel(v243.Name, l_v39_LevelFromPet_0);
                    local l_v39_TotalXPForLevel_1 = v39:GetTotalXPForLevel(v243.Name, l_v39_LevelFromPet_0 + 1);
                    local v273 = v39:IsMaxLevel(v243);
                    local v274 = ("%* / %* XP"):format(v31(l_XP_0 - l_v39_TotalXPForLevel_0, 10000), (v31(l_v39_TotalXPForLevel_1 - l_v39_TotalXPForLevel_0, 10000)));
                    local v275 = (l_XP_0 - l_v39_TotalXPForLevel_0) / (l_v39_TotalXPForLevel_1 - l_v39_TotalXPForLevel_0);
                    if v273 then
                        v275 = 1;
                    end;
                    l_l_Details_0_0.XP.Progress.Fill.Size = UDim2.new(v275, 0, 1, 6);
                    l_l_Details_0_0.XP.Progress.Fill.Visible = v275 > 0.01;
                    l_l_Details_0_0.XP.Label.Text = v273 and "Max" or v274;
                    l_l_Details_0_0.XP.Visible = true;
                    l_l_Equip_0_0.Visible = not v252;
                    l_l_Unequip_0_0.Visible = v252;
                    l_v39_LevelFromPet_0 = v243.Locked ~= true;
                    l_l_Details_0_0.Buttons.Delete.Visible = true;
                    l_l_Details_0_0.Buttons.Delete.Button.Label.Text = l_v39_LevelFromPet_0 and "Delete" or "Locked";
                    l_l_Details_0_0.Buttons.Delete.Button.Label.TextTransparency = l_v39_LevelFromPet_0 and 0 or 0.35;
                    l_l_Details_0_0.Buttons.Delete.Button.Label.UIStroke.Transparency = l_v39_LevelFromPet_0 and 0 or 0.7;
                    l_l_Details_0_0.Buttons.Delete.Button.BackgroundTransparency = l_v39_LevelFromPet_0 and 0 or 0.35;
                    l_l_Details_0_0.Buttons.Delete.Button.UIStroke.Transparency = l_v39_LevelFromPet_0 and 0 or 0.5;
                    l_l_Details_0_0.Buttons.Delete.Button.Active = l_v39_LevelFromPet_0;
                    l_l_Details_0_0.Buttons.Delete.Button.Selectable = l_v39_LevelFromPet_0;
                    l_XP_0 = 0;
                    l_v39_TotalXPForLevel_0 = 0;
                    if v53:CanUse(v243) then
                        l_XP_0 = v53:GetOwnedCount(v235, v243);
                        l_v39_TotalXPForLevel_0 = v53:GetRequiredCount(v243);
                    end;
                    l_v39_TotalXPForLevel_1 = l_l_Shiny_0_0;
                    v273 = false;
                    if v243.Shiny ~= true then
                        v273 = v226;
                    end;
                    l_v39_TotalXPForLevel_1.Visible = v273;
                    l_l_Shiny_0_0.Button.Label.Text = l_v39_LevelFromPet_0 and ("Shiny (%*/%*)"):format(v31(l_XP_0, 1000), l_v39_TotalXPForLevel_0) or "Locked";
                    l_l_Shiny_0_0.Button.Label.TextTransparency = l_v39_LevelFromPet_0 and 0 or 0.35;
                    l_l_Shiny_0_0.Button.Label.UIStroke.Transparency = l_v39_LevelFromPet_0 and 0 or 0.7;
                    l_l_Shiny_0_0.Button.BackgroundTransparency = l_v39_LevelFromPet_0 and 0 or 0.35;
                    l_l_Shiny_0_0.Button.UIStroke.Transparency = l_v39_LevelFromPet_0 and 0 or 0.5;
                    l_l_Shiny_0_0.Button.Active = l_v39_LevelFromPet_0;
                    l_l_Shiny_0_0.Button.Selectable = l_v39_LevelFromPet_0;
                    l_l_Details_0_0.Icon.Inner.Button.Inner.Lock.Button.Image = l_v39_LevelFromPet_0 and "rbxassetid://126917662710411" or "rbxassetid://87432707648426";
                end;
            else
                l_l_Details_0_0.Title.Visible = false;
                l_l_Details_0_0.Icon.Visible = false;
                l_l_Details_0_0.Stats.Visible = false;
                l_l_Details_0_0.Buttons.Visible = false;
                l_l_Details_0_0.XP.Visible = false;
                l_l_Details_0_0.Enchants.Visible = false;
            end;
            l_Tray_0.Buttons.Buttons.Sort.Button.Label.Text = ("\226\135\133 %*"):format(l_v137_0);
            l_v222_0:Update();
            return;
        end;
    end;
    local function _() --[[ Line: 964 ]] --[[ Name: updateSortButton ]]
        -- upvalues: l_v137_0 (ref), v34 (copy), l_Tray_0 (copy), v24 (copy)
        if l_v137_0 == "Rarity" then
            v34(l_Tray_0.Buttons.Buttons.Sort.Button, v24.Button.Purple);
            return;
        else
            v34(l_Tray_0.Buttons.Buttons.Sort.Button, v24.Button.Orange);
            return;
        end;
    end;
    l_ScrollingFrame_0:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 972 ]]
        -- upvalues: v17 (copy)
        v17:Hide();
    end);
    v11:ConnectDataChanged("MasteryUpgrades", function(v277) --[[ Line: 976 ]]
        -- upvalues: v226 (ref)
        if v226 then
            return;
        else
            for _, v279 in v277.MasteryUpgrades do
                if v279.Type == "GoldenEgg" then
                    v226 = true;
                    return;
                end;
            end;
            return;
        end;
    end);
    if l_v137_0 == "Rarity" then
        v34(l_Tray_0.Buttons.Buttons.Sort.Button, v24.Button.Purple);
    else
        v34(l_Tray_0.Buttons.Buttons.Sort.Button, v24.Button.Orange);
    end;
    v16(l_Tray_0.Buttons.Buttons.Sort.Button, function() --[[ Line: 989 ]]
        -- upvalues: l_v137_0 (ref), v113 (ref), v34 (copy), l_Tray_0 (copy), v24 (copy)
        if l_v137_0 == "Rarity" then
            l_v137_0 = "Power";
        else
            l_v137_0 = "Rarity";
        end;
        v113();
        if l_v137_0 == "Rarity" then
            v34(l_Tray_0.Buttons.Buttons.Sort.Button, v24.Button.Purple);
            return;
        else
            v34(l_Tray_0.Buttons.Buttons.Sort.Button, v24.Button.Orange);
            return;
        end;
    end);
    v34(l_Equip_0.Button, v24.Button.Green);
    v16(l_Equip_0.Button, function() --[[ Line: 1001 ]]
        -- upvalues: v11 (copy), l_v135_0 (ref), v21 (copy), v32 (copy), v23 (copy), v24 (copy), v34 (copy), v16 (copy), v33 (copy), v20 (copy), l_v136_0 (ref)
        local v280 = v11:Get();
        if not v280 then
            return;
        elseif not l_v135_0 then
            return;
        else
            local v281 = v280.Teams[v280.TeamEquipped];
            if #v281.Pets >= v21:GetMaxPetsEquipped(v280) then
                local v284 = v32.new("Max Pets"):Gamepass("Extra Equips"):Text((("You currently have %*!"):format((v23.autoColor("too many pets equipped", v24.Text.Cyan))))):Button(function(v282, v283) --[[ Line: 1014 ]]
                    -- upvalues: v34 (ref), v24 (ref), v16 (ref)
                    v282.Label.Text = "Okay";
                    v34(v282, v24.Button.Green);
                    v16(v282, v283);
                end);
                return v33(v284:Build());
            else
                local v285 = string.sub(l_v135_0, 1, 36);
                v20:FireServer("EquipPet", v285);
                local v286 = 0;
                for _, v288 in v281.Pets do
                    if v288 == v285 then
                        v286 = v286 + 1;
                    end;
                end;
                l_v135_0 = ("%*-team-%*"):format(v285, v286);
                l_v136_0 = true;
                return;
            end;
        end;
    end);
    v34(l_Unequip_0.Button, v24.Button.Pink);
    local l_v177_1 = v177 --[[ copy: 108 -> 148 ]];
    v16(l_Unequip_0.Button, function() --[[ Line: 1037 ]]
        -- upvalues: v11 (copy), l_v135_0 (ref), v20 (copy), l_v177_1 (copy), l_v136_0 (ref)
        if not v11:Get() then
            return;
        elseif not l_v135_0 then
            return;
        else
            local v290 = string.sub(l_v135_0, 1, 36);
            v20:FireServer("UnequipPet", v290);
            l_v135_0 = l_v177_1[v290] or ("%*-0"):format(v290);
            l_v136_0 = false;
            return;
        end;
    end);
    v16(l_Details_0.Icon.Inner.Button.Inner.Lock.Button, function() --[[ Line: 1055 ]]
        -- upvalues: v11 (copy), l_v135_0 (ref), v20 (copy), l_v136_0 (ref)
        local v291 = v11:Get();
        if not v291 then
            return;
        elseif not l_v135_0 then
            return;
        else
            local v292 = string.sub(l_v135_0, 1, 36);
            local v293 = nil;
            for _, v295 in v291.Pets do
                if v295.Id == v292 then
                    v293 = v295;
                    break;
                end;
            end;
            if not v293 then
                return;
            elseif v293.Locked then
                v20:FireServer("UnlockPet", v292, l_v136_0);
                return;
            else
                v20:FireServer("LockPet", v292, l_v136_0);
                return;
            end;
        end;
    end);
    v34(l_Shiny_0.Button, v24.Button.Gold);
    v16(l_Shiny_0.Button, function() --[[ Line: 1084 ]]
        -- upvalues: v11 (copy), l_v135_0 (ref), v52 (copy), v22 (copy)
        local v296 = v11:Get();
        if not v296 then
            return;
        elseif not l_v135_0 then
            return;
        else
            local v297 = string.sub(l_v135_0, 1, 36);
            local v298 = nil;
            for _, v300 in v296.Pets do
                if v300.Id == v297 then
                    v298 = v300;
                    break;
                end;
            end;
            if not v298 then
                return;
            else
                v52:SetSelectedPetId(v297);
                v22:Open("Shiny");
                return;
            end;
        end;
    end);
    v34(l_Inner_0.Pets.Details.Buttons.Delete.Button, v24.Button.Red);
    v16(l_Inner_0.Pets.Details.Buttons.Delete.Button, function() --[[ Line: 1111 ]]
        -- upvalues: v11 (copy), l_v135_0 (ref), v32 (copy), v34 (copy), v24 (copy), v16 (copy), v20 (copy), l_v136_0 (ref), v31 (copy), v23 (copy), v36 (copy), v33 (copy)
        local v301 = v11:Get();
        if not v301 then
            return;
        elseif not l_v135_0 then
            return;
        else
            local v302 = string.sub(l_v135_0, 1, 36);
            local v303 = nil;
            for _, v305 in v301.Pets do
                if v305.Id == v302 then
                    v303 = v305;
                    break;
                end;
            end;
            if not v303 then
                return;
            else
                local v306 = nil;
                if v303.Amount == nil then
                    v306 = v32.new("Delete Pet"):Text("Are you sure you want to delete this pet?"):Button(function(v307, v308) --[[ Line: 1138 ]]
                        -- upvalues: v34 (ref), v24 (ref), v16 (ref), v20 (ref), v302 (copy), l_v136_0 (ref), l_v135_0 (ref)
                        v307.Label.Text = "Yes";
                        v34(v307, v24.Button.Green);
                        v16(v307, function() --[[ Line: 1141 ]]
                            -- upvalues: v20 (ref), v302 (ref), l_v136_0 (ref), l_v135_0 (ref), v308 (copy)
                            v20:FireServer("DeletePet", v302, 1, l_v136_0);
                            l_v135_0 = nil;
                            l_v136_0 = false;
                            v308();
                        end);
                    end):Button(function(v309, v310) --[[ Line: 1148 ]]
                        -- upvalues: v34 (ref), v24 (ref), v16 (ref)
                        v309.Label.Text = "No";
                        v34(v309, v24.Button.Red);
                        v16(v309, v310);
                    end);
                else
                    local v311 = 1;
                    local v312 = v31(v303.Amount);
                    local v313 = v23.new():size(34)((("\n\nYou currently have %*"):format((v23.autoColor(v312, v24.Text.Pink)))));
                    do
                        local l_v311_0 = v311;
                        v306 = v32.new("Delete Pet"):Text((("Select how many %* you want to delete!%*"):format(v23.autoColor(v36(v303.Name), v24.Text.Cyan), v313))):NumberField({
                            Default = 1, 
                            Range = NumberRange.new(1, v303.Amount), 
                            OnChanged = function(v315) --[[ Line: 1162 ]] --[[ Name: OnChanged ]]
                                -- upvalues: l_v311_0 (ref)
                                l_v311_0 = v315;
                            end
                        }):Button(function(v316, v317) --[[ Line: 1166 ]]
                            -- upvalues: v34 (ref), v24 (ref), v16 (ref), v20 (ref), v302 (copy), l_v311_0 (ref), l_v136_0 (ref), l_v135_0 (ref)
                            v316.Label.Text = "Confirm";
                            v34(v316, v24.Button.Pink);
                            v16(v316, function() --[[ Line: 1169 ]]
                                -- upvalues: v20 (ref), v302 (ref), l_v311_0 (ref), l_v136_0 (ref), l_v135_0 (ref), v317 (copy)
                                v20:FireServer("DeletePet", v302, l_v311_0, l_v136_0);
                                l_v135_0 = nil;
                                l_v136_0 = false;
                                v317();
                            end);
                        end):Button(function(v318, v319) --[[ Line: 1176 ]]
                            -- upvalues: v34 (ref), v24 (ref), v16 (ref)
                            v318.Label.Text = "Cancel";
                            v34(v318, v24.Button.Red);
                            v16(v318, v319);
                        end);
                    end;
                end;
                v33(v306:Build());
                return;
            end;
        end;
    end);
    local l_Team_0 = l_Pets_0.Parent.Team;
    local l_List_0 = l_Team_0.Main.List;
    local l_Template_1 = l_List_0.Template;
    l_Template_1.Parent = nil;
    local l_TemplateBlank_0 = l_List_0.TemplateBlank;
    l_TemplateBlank_0.Parent = nil;
    local l_l_Template_1_0 = l_Template_1 --[[ copy: 119 -> 149 ]];
    local v332 = v8.new(function() --[[ Line: 1199 ]]
        -- upvalues: l_l_Template_1_0 (copy), v17 (copy), v11 (copy), v63 (copy), l_ScreenGui_0 (copy), v18 (copy), v16 (copy), l_v139_0 (ref), l_v135_0 (ref), l_v136_0 (ref), v113 (ref), v118 (ref)
        local v325 = l_l_Template_1_0:Clone();
        v17:OnEnter(v325.Inner.Button, function() --[[ Line: 1202 ]]
            -- upvalues: v11 (ref), v63 (ref), l_ScreenGui_0 (ref), v325 (copy), v18 (ref)
            local v326 = false;
            local v327 = v11:Get();
            if not v327 then
                return;
            elseif v63.Mode == "Touch" then
                return;
            elseif l_ScreenGui_0:FindFirstChild("Prompt") then
                return;
            else
                local v328 = string.sub(v325.Name, 1, 36);
                local v329;
                for _, v331 in v327.Pets do
                    if v331.Id == v328 then
                        v329 = v331;
                        v326 = true;
                    end;
                    if v326 then
                        break;
                    end;
                end;
                if not v326 then
                    v329 = nil;
                end;
                v326 = false;
                if not v329 then
                    return;
                else
                    return v18.fromPet(v329, v327);
                end;
            end;
        end);
        v16(v325.Inner.Button, function() --[[ Line: 1223 ]]
            -- upvalues: v11 (ref), l_v139_0 (ref), l_v135_0 (ref), v325 (copy), l_v136_0 (ref), v113 (ref), v118 (ref)
            if not v11:Get() then
                return;
            elseif l_v139_0 then
                return;
            else
                l_v135_0 = v325.Name;
                l_v136_0 = true;
                v113();
                v118();
                return;
            end;
        end);
        return v325;
    end);
    local l_l_List_0_0 = l_List_0 --[[ copy: 118 -> 150 ]];
    local l_l_Team_0_0 = l_Team_0 --[[ copy: 117 -> 151 ]];
    v118 = function() --[[ Line: 1247 ]] --[[ Name: updateTeams ]]
        -- upvalues: v11 (copy), v15 (copy), v332 (copy), l_l_List_0_0 (copy), l_v135_0 (ref), v42 (copy), v21 (copy), l_TemplateBlank_0 (copy), l_l_Team_0_0 (copy)
        local v335 = false;
        local v336 = v11:Get();
        if not v336 then
            return;
        else
            local l_Pets_2 = v336.Pets;
            local l_Teams_0 = v336.Teams;
            local l_TeamEquipped_0 = v336.TeamEquipped;
            local v340 = l_Teams_0[l_TeamEquipped_0];
            local v341 = {};
            for v342 in v340.Pets do
                table.insert(v341, v342);
            end;
            table.sort(v341, function(v343, v344) --[[ Line: 1263 ]]
                -- upvalues: l_Pets_2 (copy), v340 (copy), v15 (ref)
                local v345 = false;
                local v346 = false;
                local l_l_Pets_2_0 = l_Pets_2;
                local v348 = v340.Pets[v343];
                local v349;
                for _, v351 in l_l_Pets_2_0 do
                    if v351.Id == v348 then
                        v349 = v351;
                        v345 = true;
                    end;
                    if v345 then
                        break;
                    end;
                end;
                if not v345 then
                    v349 = nil;
                end;
                v345 = false;
                v348 = l_Pets_2;
                local v352 = v340.Pets[v344];
                for _, v354 in v348 do
                    if v354.Id == v352 then
                        l_l_Pets_2_0 = v354;
                        v346 = true;
                    end;
                    if v346 then
                        break;
                    end;
                end;
                if not v346 then
                    l_l_Pets_2_0 = nil;
                end;
                v346 = false;
				local v348 = false

				if v349 ~= nil then
					local petData = v15[v349.Name]

					v348 =
						petData.Rarity == "Secret"
						or petData.Infinity == true
						or petData.Void == true
						or petData.Ancient == true
						or petData.Ultimatum == true
						or petData.Dev == true
						or petData.Eternal == true
				end
				local v352 = false

				if l_l_Pets_2_0 ~= nil then
					local petData = v15[l_l_Pets_2_0.Name]

					v352 =
						petData.Rarity == "Secret"
						or petData.Infinity == true
						or petData.Void == true
						or petData.Ancient == true
						or petData.Ultimatum == true
						or petData.Dev == true
						or petData.Eternal == true
				end
				
                if v348 ~= v352 then
                    return v348;
                else
                    local v355 = false;
                    if v349 ~= nil then
                        v355 = v349.Locked == true;
                    end;
                    local v356 = false;
                    if l_l_Pets_2_0 ~= nil then
                        v356 = l_l_Pets_2_0.Locked == true;
                    end;
                    if v355 ~= v356 then
                        return v355;
                    else
                        return v340.Pets[v343] < v340.Pets[v344];
                    end;
                end;
            end);
            local v357 = {};
            for v358, v359 in v341 do
                local v360 = v340.Pets[v359];
                local v361;
                for _, v363 in l_Pets_2 do
                    if v363.Id == v360 then
                        v361 = v363;
                        v335 = true;
                    end;
                    if v335 then
                        break;
                    end;
                end;
                if not v335 then
                    v361 = nil;
                end;
                v335 = false;
                if v361 then
                    local v364 = v332:Get();
                    local v365 = v357[v360] or 0;
                    local v366 = ("%*-team-%*"):format(v360, v365);
                    v364.Name = v366;
                    v357[v360] = v365 + 1;
                    v364.LayoutOrder = v358;
					local petData = v15[v361.Name]

					if petData.Rarity == "Secret"
						or petData.Infinity == true
						or petData.Void == true
						or petData.Ancient == true 
						or petData.Ultimatum == true 
						or petData.Dev == true 
						or petData.Eternal == true then

						v364.Size = UDim2.fromOffset(130, 130)
					else
						v364.Size = UDim2.fromOffset(100, 100)
					end
                    v364.Parent = l_l_List_0_0;
                    local v367 = l_v135_0 == v366;
                    v42.set(v364, v361, false, v367, true);
                end;
            end;
            v332:Done();
            local l_v21_MaxPetsEquipped_0 = v21:GetMaxPetsEquipped(v336);
            local v369 = l_v21_MaxPetsEquipped_0 - #v340.Pets;
            l_TemplateBlank_0.LayoutOrder = 99;
            l_TemplateBlank_0.Inner.Button.Amount.Text = ("+%* slot%*"):format(v369, v369 == 1 and "" or "s");
            l_TemplateBlank_0.Parent = if v369 > 0 then l_l_List_0_0 else nil;
            local l_v21_MaxPetTeams_0 = v21:GetMaxPetTeams(v336);
            if l_v21_MaxPetTeams_0 == 1 then
                l_l_Team_0_0.Title.Main.Label.Text = ("<stroke color=\"#00295E\" joins=\"miter\" thickness=\"2\">%* / %* pets equipped</stroke>"):format(#v340.Pets, l_v21_MaxPetsEquipped_0);
            else
                local v371 = v340.Name or ("Team %*"):format(l_TeamEquipped_0);
                l_l_Team_0_0.Title.Main.Label.Text = ("<stroke color=\"#00295E\" joins=\"miter\" thickness=\"2\">%* <font size=\"22\"> (%* / %* pets)</font></stroke>"):format(v371, #v340.Pets, l_v21_MaxPetsEquipped_0);
            end;
            l_l_Team_0_0.Main.Left.Visible = l_TeamEquipped_0 > 1;
            l_l_Team_0_0.Main.Right.Visible = l_TeamEquipped_0 < l_v21_MaxPetTeams_0;
            return;
        end;
    end;
    local l_Label_0 = l_Team_0.Title.Main.Label;
    local function v374() --[[ Line: 1336 ]] --[[ Name: updateTeamNameSize ]]
        -- upvalues: l_Label_0 (copy), l_UIScale_0 (copy)
        local v373 = math.ceil(l_Label_0.TextBounds.X / l_UIScale_0.Scale) + 1;
        l_Label_0.Size = UDim2.new(0, v373, 1, 0);
    end;
    l_UIScale_0:GetPropertyChangedSignal("Scale"):Connect(v374);
    l_Label_0:GetPropertyChangedSignal("TextBounds"):Connect(v374);
    local v375 = math.ceil(l_Label_0.TextBounds.X / l_UIScale_0.Scale) + 1;
    l_Label_0.Size = UDim2.new(0, v375, 1, 0);
    v375 = l_Team_0.Main.List;
    local l_l_Pets_0_0 = l_Pets_0 --[[ copy: 90 -> 152 ]];
    local function v378() --[[ Line: 1348 ]] --[[ Name: updateInnerLayout ]]
        -- upvalues: v375 (copy), l_UIScale_0 (copy), l_l_Team_0_0 (copy), l_l_Pets_0_0 (copy)
        local v377 = math.ceil(v375.UIListLayout.AbsoluteContentSize.Y / l_UIScale_0.Scale);
        l_l_Team_0_0.Size = UDim2.new(1, 0, 0, v377 + 65);
        l_l_Pets_0_0.Position = UDim2.fromOffset(0, v377 + 85);
    end;
    v375.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(v378);
    l_UIScale_0:GetPropertyChangedSignal("Scale"):Connect(v378);
    local v379 = math.ceil(v375.UIListLayout.AbsoluteContentSize.Y / l_UIScale_0.Scale);
    l_Team_0.Size = UDim2.new(1, 0, 0, v379 + 65);
    l_Pets_0.Position = UDim2.fromOffset(0, v379 + 85);
    v379 = function(v380, v381) --[[ Line: 1359 ]] --[[ Name: trySwitchToTeam ]]
        -- upvalues: l_v135_0 (ref), l_v136_0 (ref), v20 (copy)
        local v382 = v380.Teams[v381];
        if not v382 then
            return;
        else
            if l_v135_0 ~= nil then
                local v383 = string.sub(l_v135_0, 1, 36);
                local v384 = nil;
                for _, v386 in v382.Pets do
                    if v386 == v383 then
                        v384 = ("%*-team-0"):format(v383);
                        break;
                    end;
                end;
                local v387 = ("%*-0"):format(v383);
                if v384 then
                    l_v135_0 = v384;
                    l_v136_0 = true;
                else
                    l_v135_0 = v387;
                    l_v136_0 = false;
                end;
            end;
            v20:FireServer("EquipTeam", v381);
            return;
        end;
    end;
    v34(l_Team_0.Main.Left.Button, v24.Button.Default);
    v16(l_Team_0.Main.Left.Button, function() --[[ Line: 1391 ]]
        -- upvalues: v11 (copy), v379 (copy)
        local v388 = v11:Get();
        if not v388 then
            return;
        else
            v379(v388, v388.TeamEquipped - 1);
            return;
        end;
    end);
    v34(l_Team_0.Main.Right.Button, v24.Button.Default);
    v16(l_Team_0.Main.Right.Button, function() --[[ Line: 1400 ]]
        -- upvalues: v11 (copy), v379 (copy)
        local v389 = v11:Get();
        if not v389 then
            return;
        else
            v379(v389, v389.TeamEquipped + 1);
            return;
        end;
    end);
    local v390 = {
        "Inventory", 
        "Pets", 
        "Teams", 
        "TeamEquipped", 
        "MasteryUpgrades", 
        "MasteryLevels", 
        "Passes", 
        "Settings"
    };
    v41("Inventory", v390, v118);
    v41("Inventory", v390, v113);
    l_PropertyChangedSignal_0:Connect(v113);
    v16(l_Tray_0.Buttons.Buttons.UnequipAll.Button, function() --[[ Line: 1424 ]]
        -- upvalues: v20 (copy)
        v20:FireServer("UnequipAllPets");
    end);
    local l_v148_1 = v148 --[[ copy: 101 -> 153 ]];
    v16(l_Tray_0.Buttons.Buttons.Delete.Button, function() --[[ Line: 1429 ]]
        -- upvalues: l_v139_0 (ref), v124 (ref), l_v148_1 (copy)
        if l_v139_0 then
            v124();
        else
            l_v139_0 = true;
        end;
        l_v148_1();
    end);
    local function v393() --[[ Line: 1438 ]] --[[ Name: updateCompactButton ]]
        -- upvalues: v11 (copy), l_Tray_0 (copy)
        local v392 = v11:Get();
        if not v392 then
            return;
        elseif v392.Settings["Compact Pet Inventory"] == true then
            l_Tray_0.Buttons.Buttons.Compact.Button.Image = "rbxassetid://12255287199";
            l_Tray_0.Buttons.Buttons.Compact.Button.Highlight.Image = "rbxassetid://12255286715";
            return;
        else
            l_Tray_0.Buttons.Buttons.Compact.Button.Image = "rbxassetid://11476296306";
            l_Tray_0.Buttons.Buttons.Compact.Button.Highlight.Image = "rbxassetid://11476295069";
            return;
        end;
    end;
    v16(l_Tray_0.Buttons.Buttons.Compact.Button, function() --[[ Line: 1452 ]]
        -- upvalues: v11 (copy), v20 (copy)
        local v394 = v11:Get();
        if not v394 then
            return;
        else
            v20:FireServer("SetSetting", "Compact Pet Inventory", not v394.Settings["Compact Pet Inventory"]);
            return;
        end;
    end);
    v11:ConnectDataChanged("Settings", v393);
    v393();
    v34(l_Tray_0.Parent.MultiDelete.Buttons.Confirm.Button, v24.Button.Pink);
    local l_v138_1 = v138 --[[ copy: 98 -> 154 ]];
    v16(l_Tray_0.Parent.MultiDelete.Buttons.Confirm.Button, function() --[[ Line: 1464 ]]
        -- upvalues: l_v138_1 (copy), v124 (ref), v32 (copy), v19 (copy), v34 (copy), v24 (copy), v16 (copy), v20 (copy), v33 (copy)
        local v396 = table.clone(l_v138_1);
        v124();
        local v401 = v32.new("Multi Delete"):Gamepass(v19.DigitalStoragePassName):Text("Are you sure you want to delete these pets?"):Button(function(v397, v398) --[[ Line: 1471 ]]
            -- upvalues: v34 (ref), v24 (ref), v16 (ref), v20 (ref), v396 (copy), v124 (ref)
            v397.Label.Text = "Yes";
            v34(v397, v24.Button.Green);
            v16(v397, function() --[[ Line: 1474 ]]
                -- upvalues: v20 (ref), v396 (ref), v124 (ref), v398 (copy)
                v20:FireServer("MultiDeletePets", v396);
                v124();
                v398();
            end);
        end):Button(function(v399, v400) --[[ Line: 1480 ]]
            -- upvalues: v34 (ref), v24 (ref), v16 (ref), v124 (ref)
            v399.Label.Text = "No";
            v34(v399, v24.Button.Red);
            v16(v399, function() --[[ Line: 1483 ]]
                -- upvalues: v124 (ref), v400 (copy)
                v124();
                v400();
            end);
        end);
        v33(v401:Build());
    end);
    v34(l_Tray_0.Parent.MultiDelete.Buttons.Cancel.Button, v24.Button.Red);
    v16(l_Tray_0.Parent.MultiDelete.Buttons.Cancel.Button, function() --[[ Line: 1492 ]]
        -- upvalues: v124 (ref)
        v124();
    end);
    v34(l_Tray_0.Buttons.Buttons.Best.Button, v24.Button.Green);
    v16(l_Tray_0.Buttons.Buttons.Best.Button, function() --[[ Line: 1499 ]]
        -- upvalues: v20 (copy)
        v20:FireServer("EquipBestPets");
    end);
    v20.Event("PetIdChanged"):Connect(function(v402, v403) --[[ Line: 1505 ]]
        -- upvalues: v11 (copy), l_v135_0 (ref), l_v136_0 (ref), v113 (ref), v118 (ref)
        local v404 = false;
        local v405 = v11:Get();
        if not v405 then
            return;
        elseif l_v135_0 and string.sub(l_v135_0, 1, 36) ~= v402 then
            return;
        else
            local v406;
            for _, v408 in v405.Pets do
                if v408.Id == v403 then
                    v406 = v408;
                    v404 = true;
                end;
                if v404 then
                    break;
                end;
            end;
            if not v404 then
                v406 = nil;
            end;
            v404 = false;
            if l_v136_0 then
                l_v135_0 = ("%*-team-0"):format(v403);
            elseif v406 and v406.Amount then
                l_v135_0 = ("%*-stack"):format(v403);
            else
                l_v135_0 = ("%*-0"):format(v403);
            end;
            v113();
            v118();
            return;
        end;
    end);
end;
l_ScrollingFrame_0 = nil;
l_Pets_0 = l_Inner_0.Items.Main;
l_UIGridLayout_0 = l_Inner_0.Items.Details;
l_Details_0 = l_Pets_0.ScrollingFrame;
v133 = l_Details_0.Template;
v133.Parent = nil;
l_Template_0 = v133.Items.Template;
l_Template_0.Parent = nil;
v135 = {
    "Currency", 
    "Potions", 
    "Powerups"
};
v136 = {};
for v409, v410 in v135 do
    local v411 = v133:Clone();
    v411.Name = v410;
    v411.LayoutOrder = v409;
    v411.Title.Text = v410;
    local l_UIGridLayout_1 = v411.Items.UIGridLayout;
    local function v414() --[[ Line: 1564 ]] --[[ Name: updateHeight ]]
        -- upvalues: v411 (copy), l_UIScale_0 (copy)
        local v413 = math.ceil(v411.Items.UIGridLayout.AbsoluteContentSize.Y / l_UIScale_0.Scale);
        v411.Size = UDim2.new(1, 0, 0, v413 + 85);
    end;
    l_UIGridLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(v414);
    l_UIScale_0:GetPropertyChangedSignal("Scale"):Connect(v414);
    local v415 = math.ceil(v411.Items.UIGridLayout.AbsoluteContentSize.Y / l_UIScale_0.Scale);
    v411.Size = UDim2.new(1, 0, 0, v415 + 85);
    v411.Parent = l_Details_0;
    v136[v410] = v411;
end;
v137 = nil;
v138 = nil;
v139 = nil;
l_MultiDelete_0 = nil;
local l_l_UIGridLayout_0_1 = l_UIGridLayout_0 --[[ copy: 91 -> 155 ]];
local function v418(v417) --[[ Line: 1583 ]] --[[ Name: setDetailsVisible ]]
    -- upvalues: l_l_UIGridLayout_0_1 (copy)
    if not v417 then
        l_l_UIGridLayout_0_1.Pool.Visible = false;
    end;
    l_l_UIGridLayout_0_1.Buttons.Visible = v417;
    l_l_UIGridLayout_0_1.Icon.Visible = v417;
    l_l_UIGridLayout_0_1.Stats.Visible = v417;
    l_l_UIGridLayout_0_1.Title.Visible = v417;
end;
local l_UIGridLayout_2 = Instance.new("UIGridLayout");
l_UIGridLayout_2.CellPadding = UDim2.fromOffset(5, 5);
l_UIGridLayout_2.CellSize = UDim2.fromOffset(65, 65);
local v420 = v44.new(l_UIGridLayout_0.Pool.Content, l_UIGridLayout_2);
v420.ItemsPerPage = 6;
local l_v420_0 = v420 --[[ copy: 103 -> 156 ]];
v420.PageChanged:Connect(function(_) --[[ Line: 1600 ]]
    -- upvalues: l_v420_0 (copy), l_l_UIGridLayout_0_1 (copy)
    local v423 = l_v420_0.Pages > 1;
    l_l_UIGridLayout_0_1.Pool.Page.Visible = v423;
    l_l_UIGridLayout_0_1.Pool.Page.Text = ("Page %* / %*"):format(l_v420_0.CurrentPage, l_v420_0.Pages);
end);
local l_v418_0 = v418 --[[ copy: 101 -> 157 ]];
do
    local l_v137_1, l_v138_2, l_v139_1, l_l_MultiDelete_0_1 = v137, v138, v139, l_MultiDelete_0;
    local function v443() --[[ Line: 1606 ]] --[[ Name: updateDetails ]]
        -- upvalues: l_v137_1 (ref), l_v418_0 (copy), v11 (copy), l_v138_2 (ref), l_v139_1 (ref), v28 (copy), l_l_UIGridLayout_0_1 (copy), v23 (copy), v26 (copy), l_l_MultiDelete_0_1 (ref), v13 (copy), v19 (copy), l_v420_0 (copy), l_ScreenGui_0 (copy)
        if not l_v137_1 then
            return l_v418_0(false);
        else
            local v429 = v11:Get();
            if not v429 then
                return l_v418_0(false);
            else
                local v430 = 0;
                local v431 = true;
                local v432 = nil;
                if l_v137_1 == "Potion" then
                    local l_l_v138_2_0 = l_v138_2;
                    local l_l_v139_1_0 = l_v139_1;
                    local v435 = {
                        Type = "Potion", 
                        Name = l_l_v138_2_0, 
                        Level = l_l_v139_1_0
                    };
                    v430 = v28:GetOwnedAmount(v429, v435);
                    l_l_UIGridLayout_0_1.Title.Text = v28:GetName(v435);
                    l_l_UIGridLayout_0_1.Stats.Text = v23.autoStroke(v28:GetDescription(v435), 2.5);
                    v28:UpdateIcon(l_l_UIGridLayout_0_1.Icon.Inner.Button.Inner, v435);
                elseif l_v137_1 == "Powerup" then
                    local l_l_v138_2_1 = l_v138_2;
                    local v437 = v26[l_l_v138_2_1];
                    local v438 = {
                        Type = "Powerup", 
                        Name = l_l_v138_2_1
                    };
                    local l_Pool_0 = v437.Pool;
                    if l_Pool_0 then
                        v432 = l_Pool_0;
                    end;
                    v431 = v437.Consumable ~= false;
                    l_l_UIGridLayout_0_1.Title.Text = v28:GetName(v438);
                    l_l_UIGridLayout_0_1.Stats.Text = v23.autoStroke(v28:GetDescription(v438), 2.5);
                    v430 = v28:GetOwnedAmount(v429, v438);
                    v28:UpdateIcon(l_l_UIGridLayout_0_1.Icon.Inner.Button.Inner, v438);
                end;
                if v430 <= 0 then
                    return l_v418_0(false);
                else
                    local v440 = l_l_MultiDelete_0_1 or "Common";
                    if v440 == "Legendary" then
                        l_l_UIGridLayout_0_1.Title.TextColor3 = Color3.new(1, 1, 1);
                        v13.Cycle(l_l_UIGridLayout_0_1.Title, "Rainbow", {
                            Speed = 0.5
                        });
                    else
                        v13.None(l_l_UIGridLayout_0_1.Title);
                        l_l_UIGridLayout_0_1.Title.TextColor3 = v19.RarityColors[v440];
                    end;
                    l_v420_0:Set(v432);
                    l_l_UIGridLayout_0_1.Pool.Visible = v432 ~= nil;
                    l_l_UIGridLayout_0_1.Buttons.Use.Visible = v431;
                    l_l_UIGridLayout_0_1.Buttons.Use.Button.Label.Text = "Use";
                    l_l_UIGridLayout_0_1.Buttons.Use.Button.Transparency = 0;
                    l_l_UIGridLayout_0_1.Buttons.Use.Button.UIStroke.Transparency = 0;
                    l_l_UIGridLayout_0_1.Buttons.Use.Button.Label.UIStroke.Transparency = 0;
                    l_l_UIGridLayout_0_1.Buttons.Use.Button.Label.TextTransparency = 0;
                    l_l_UIGridLayout_0_1.Buttons.Use.Button.Active = true;
                    l_l_UIGridLayout_0_1.Buttons.Use.Button.Selectable = true;
                    l_l_UIGridLayout_0_1.Icon.Inner.Button.Inner.Amount.Text = ("<stroke color=\"#00295E\" joins=\"miter\" thickness=\"2\"><font size=\"32\">x</font>%*</stroke>"):format(v430);
                    l_l_UIGridLayout_0_1.Buttons.Craft.Visible = false;
                    l_l_UIGridLayout_0_1.Buttons.Visible = true;
                    l_l_UIGridLayout_0_1.Icon.Visible = true;
                    l_l_UIGridLayout_0_1.Stats.Visible = true;
                    l_l_UIGridLayout_0_1.Title.Visible = true;
                    task.defer(function() --[[ Line: 1677 ]]
                        -- upvalues: l_l_UIGridLayout_0_1 (ref), l_ScreenGui_0 (ref)
                        l_l_UIGridLayout_0_1.Pool.Position = UDim2.new(0.5, 0, 0, 250 + l_l_UIGridLayout_0_1.Stats.TextBounds.Y / l_ScreenGui_0.UIScale.Scale);
                    end);
                    local l_AutoExclusiveEgg_0 = l_l_UIGridLayout_0_1.Buttons.AutoExclusiveEgg;
                    local v442 = false;
                    if l_v138_2 ~= nil then
                        v442 = false;
                        if l_v137_1 == "Powerup" then
                            v442 = v26[l_v138_2].Type == "Egg";
                        end;
                    end;
                    l_AutoExclusiveEgg_0.Visible = v442;
                    return;
                end;
            end;
        end;
    end;
    v34(l_UIGridLayout_0.Buttons.AutoExclusiveEgg.Button, v24.Button.Orange);
    v16(l_UIGridLayout_0.Buttons.AutoExclusiveEgg.Button, function() --[[ Line: 1691 ]]
        -- upvalues: v80 (ref), l_v138_2 (ref), l_v137_1 (ref), v26 (copy), v79 (ref)
        v80();
        if l_v138_2 ~= nil and l_v137_1 == "Powerup" and v26[l_v138_2].Type == "Egg" then
            v79(l_v138_2);
        end;
    end);
    local function v451(v444, v445) --[[ Line: 1704 ]] --[[ Name: displayRarityColor ]]
        -- upvalues: v28 (copy), v13 (copy), v92 (copy), v19 (copy)
		local l_v28_Rarity_0 = v28:GetRarity(v445);
		local l_v28_Infinity_0 = v15.Infinity == true
		local l_v28_Void_0 = v15.Void == true
		local l_v28_Ancient_0 = v15.Ancient == true
		local l_v28_Ultimatum_0 = v15.Ultimatum == true
		local l_v28_Dev_0 = v15.Dev == true
		local l_v28_Eternal_0 = v15.Eternal == true
		local v_u_439 = v28:IsInfinityRarity(v445)
        local function v450() --[[ Line: 1706 ]] --[[ Name: update ]]
            -- upvalues: v444 (copy), l_v28_Rarity_0 (copy), v13 (ref), v92 (ref), v19 (ref)
			local l_UIGradient_0 = v444.Inner.Background.UIGradient;
			local v441 = v_u_439 and "Infinity" or "Rainbow"
            if v444.Visible and (l_v28_Rarity_0 == "Legendary" or l_v28_Rarity_0 == "Secret" or l_v28_Infinity_0 or l_v28_Void_0 or l_v28_Ancient_0 or l_v28_Ultimatum_0 or l_v28_Dev_0 or l_v28_Eternal_0) then
                v13.Shift(v444.Inner.Button, v441, {
                    Speed = 0.5
                });
                v13.Cycle(v444.Inner.Button.Inner.ItemName, v441, {
                    Speed = 0.5
                });
                v92[l_UIGradient_0] = true;
            else
                v13.None(v444.Inner.Button);
                v13.None(v444.Inner.Button.Inner.ItemName);
                v92[l_UIGradient_0] = nil;
            end;
            local l_Background_0 = v444.Inner.Background;
            local v449 = true;
            if l_v28_Rarity_0 ~= "Legendary" then
                v449 = l_v28_Rarity_0 == "Secret";
			end;
			if l_v28_Rarity_0 ~= "Secret" and l_v28_Infinity_0 == true then
				v449 = l_v28_Infinity_0 == true;
			end;
			if l_v28_Rarity_0 ~= "Secret" and l_v28_Void_0 == true then
				v449 = l_v28_Void_0 == true;
			end;
			if l_v28_Rarity_0 ~= "Secret" and l_v28_Ancient_0 == true then
				v449 = l_v28_Ancient_0 == true;
			end;
			if l_v28_Rarity_0 ~= "Secret" and l_v28_Ultimatum_0 == true then
				v449 = l_v28_Ultimatum_0 == true;
			end;
			if l_v28_Rarity_0 ~= "Secret" and l_v28_Dev_0 == true then
				v449 = l_v28_Dev_0 == true;
			end;
			if l_v28_Rarity_0 ~= "Secret" and l_v28_Eternal_0 == true then
				v449 = l_v28_Eternal_0 == true;
			end;
            l_Background_0.Visible = v449;
			if l_v28_Infinity_0 == true then
				v444.Inner.Button.BackgroundColor3 = Color3.new(1, 1, 1)

				v13.Shift(v444.Inner.Button, "Infinity", {
					Speed = 0.5
				})

			elseif l_v28_Void_0 == true then
				v444.Inner.Button.BackgroundColor3 = Color3.new(1, 1, 1)

				v13.Shift(v444.Inner.Button, "Void", {
					Speed = 0.5
				})

			elseif l_v28_Ancient_0 == true then
				v444.Inner.Button.BackgroundColor3 = Color3.new(1, 1, 1)

				v13.Shift(v444.Inner.Button, "Ancient", {
					Speed = 0.5
				})
			
			elseif l_v28_Ultimatum_0 == true then
				v444.Inner.Button.BackgroundColor3 = Color3.new(1, 1, 1)

				v13.Shift(v444.Inner.Button, "Ultimatum", {
					Speed = 0.5
				})
			
			elseif l_v28_Dev_0 == true then
				v444.Inner.Button.BackgroundColor3 = Color3.new(1, 1, 1)
				
				v13.Shift(v444.Inner.Button, "Dev", {
					Speed = 0.5
				})
				
			elseif l_v28_Eternal_0 == true then
				v444.Inner.Button.BackgroundColor3 = Color3.new(1, 1, 1)
				
				v13.Shift(v444.Inner.Button, "Eternal", {
					Speed = 0.5
				})

			else
				v13.None(v444.Inner.Button)

				v444.Inner.Button.BackgroundColor3 =
					if l_v28_Rarity_0 == "Common" then
					Color3.fromRGB(41, 205, 255)
					elseif l_v28_Rarity_0 == "Secret" then
					Color3.new(1, 1, 1)
					elseif l_v28_Void_0 == true then
					Color3.new(1, 1, 1)
					elseif l_v28_Infinity_0 == true then
					Color3.new(1, 1, 1)
					elseif l_v28_Ancient_0 == true then
					Color3.new(1, 1, 1)
					elseif l_v28_Ultimatum_0 == true then
					Color3.new(1, 1, 1)
					elseif l_v28_Dev_0 == true then
					Color3.new(1, 1, 1)
					elseif l_v28_Eternal_0 == true then
					Color3.new(1, 1, 1)
					else
					v19.RarityColors[l_v28_Rarity_0]
			end
        end;
        v450();
		v444:SetAttribute("Rarity", l_v28_Rarity_0);
		v444:SetAttribute("Infinity", v_u_439)
		v444:SetAttribute("Void", v_u_439)
		v444:SetAttribute("Ancient", v_u_439)
		v444:SetAttribute("Ultimatum", v_u_439)
		v444:SetAttribute("Dev", v_u_439)
		v444:SetAttribute("Eternal", v_u_439)
        v444:GetPropertyChangedSignal("Visible"):Connect(v450);
    end;
    local v452 = nil;
    local l_Potions_0 = v136.Potions;
    local function v456(v454, v455) --[[ Line: 1738 ]] --[[ Name: getPotionId ]]
        if v455 then
            return (("%*/%*"):format(v454, v455));
        else
            return v454;
        end;
    end;
    local v457 = {};
    local l_l_Template_0_1 = l_Template_0 --[[ copy: 94 -> 158 ]];
    local l_v451_0 = v451 --[[ copy: 105 -> 159 ]];
    local l_v443_0 = v443 --[[ copy: 104 -> 160 ]];
    local l_l_Potions_0_0 = l_Potions_0 --[[ copy: 107 -> 161 ]];
    local l_v457_0 = v457 --[[ copy: 109 -> 162 ]];
    local function v470(v463, v464) --[[ Line: 1744 ]] --[[ Name: makeEntry ]]
        -- upvalues: l_l_Template_0_1 (copy), v25 (copy), v28 (copy), l_v451_0 (copy), v17 (copy), v18 (copy), v16 (copy), l_v137_1 (ref), l_v138_2 (ref), l_v139_1 (ref), l_l_MultiDelete_0_1 (ref), l_v443_0 (copy), l_l_Potions_0_0 (copy), l_v457_0 (copy)
        local v465 = if v464 then ("%*/%*"):format(v463, v464) else v463;
        local v466 = l_l_Template_0_1:Clone();
        local v467 = (v464 or 0) * -1000 + v25[v463].LayoutOrder;
        if v463 == "Infinity Elixir" then
            v467 = -9999999;
		end;
		if v463 == "OP Elixir" then
			v467 = -9999999;
		end;
		if v463 == "DEV Potion" then
			v467 = -9999999;
		end;
        v466.Name = v465;
        v466.Inner.Cooldown.Visible = false;
        v466.LayoutOrder = v467;
        local v468 = {
            Type = "Potion", 
            Name = v463, 
            Level = v464
        };
        local l_v28_Rarity_1 = v28:GetRarity(v468);
        v28:UpdateIcon(v466.Inner.Button.Inner.Icon, v468);
        l_v451_0(v466, v468);
        v466.Inner.Button.Inner.ItemName.Text = v28:GetName(v468);
        v17:OnEnter(v466.Inner.Button, function() --[[ Line: 1769 ]]
            -- upvalues: v18 (ref), v468 (copy)
            return v18.fromPotion(v468);
        end);
        v16(v466.Inner.Button, function() --[[ Line: 1773 ]]
            -- upvalues: l_v137_1 (ref), l_v138_2 (ref), v463 (copy), l_v139_1 (ref), v464 (copy), l_l_MultiDelete_0_1 (ref), l_v28_Rarity_1 (copy), l_v443_0 (ref)
            l_v137_1 = "Potion";
            l_v138_2 = v463;
            l_v139_1 = v464;
            l_l_MultiDelete_0_1 = l_v28_Rarity_1;
            l_v443_0();
        end);
        v466.Visible = false;
        v466.Parent = l_l_Potions_0_0.Items;
        l_v457_0[v465] = v466;
    end;
    for v471, v472 in v25 do
        if #v472.Buff.Expiry > 1 then
            local v473 = 1;
            local v474 = v472.OneLevel and 1 or v19.PotionMaxLevel;
            for v475 = v473, v474 do
                v470(v471, v475);
            end;
        else
            v470(v471, 1);
        end;
    end;
    local v476 = v23.new():size(20);
    local l_v457_1 = v457 --[[ copy: 109 -> 163 ]];
    local l_l_Potions_0_1 = l_Potions_0 --[[ copy: 107 -> 164 ]];
    local l_v443_1 = v443 --[[ copy: 104 -> 165 ]];
    v452 = function() --[[ Line: 1798 ]] --[[ Name: updatePotions ]]
        -- upvalues: v11 (copy), l_Search_0 (copy), l_v457_1 (copy), v93 (ref), l_l_Potions_0_1 (copy), l_v443_1 (copy)
        local v480 = v11:Get();
        if not v480 then
            return;
        else
            local l_Text_3 = l_Search_0.Search.Bar.TextBox.Text;
            local v482 = string.lower((string.gsub(l_Text_3, "%s", "")));
            l_Text_3 = false;
            local v483 = {};
            for _, v485 in v480.Potions do
                local l_Name_4 = v485.Name;
                if #v482 <= 0 or string.find(string.lower((string.gsub(l_Name_4, "%s", ""))), v482, 1, true) then
                    local l_Level_0 = v485.Level;
                    local v488 = if l_Level_0 then ("%*/%*"):format(l_Name_4, l_Level_0) else l_Name_4;
                    v483[v488] = true;
                    l_Level_0 = l_v457_1[v488];
                    if l_Level_0 then
                        l_Level_0.Inner.Button.Inner.Amount.Text = v93(v485.Amount);
                        l_Level_0.Visible = true;
                        l_Text_3 = true;
                    end;
                end;
            end;
            for v489, v490 in l_v457_1 do
                if not v483[v489] then
                    v490.Visible = false;
                end;
            end;
            l_l_Potions_0_1.Visible = l_Text_3;
            l_v443_1();
            return;
        end;
    end;
    v41("Inventory", "Potions", v452);
    l_PropertyChangedSignal_0:Connect(v452);
    l_Potions_0 = nil;
    v456 = nil;
    v457 = v136.Powerups;
    v470 = {};
    for v491 in v26 do
        local v492 = l_Template_0:Clone();
        local l_LayoutOrder_0 = v26[v491].LayoutOrder;
        v492.Name = v491;
        v492.LayoutOrder = l_LayoutOrder_0;
        local v494 = {
            Type = "Powerup", 
            Name = v491
        };
        local l_v28_Rarity_2 = v28:GetRarity(v494);
        v28:UpdateIcon(v492.Inner.Button.Inner.Icon, v494);
        v492.Inner.Button.Inner.ItemName.Text = v28:GetName(v494);
        v17:OnEnter(v492.Inner.Button, function() --[[ Line: 1861 ]]
            -- upvalues: v18 (copy), v494 (copy)
            return v18.fromItem(v494);
        end);
        v451(v492, v494);
        v16(v492.Inner.Button, function() --[[ Line: 1866 ]]
            -- upvalues: l_v137_1 (ref), l_v138_2 (ref), v491 (copy), l_l_MultiDelete_0_1 (ref), l_v28_Rarity_2 (copy), l_v139_1 (ref), v443 (copy)
            l_v137_1 = "Powerup";
            l_v138_2 = v491;
            l_l_MultiDelete_0_1 = l_v28_Rarity_2;
            l_v139_1 = nil;
            v443();
        end);
        v492.Visible = false;
        v492.Parent = v457.Items;
        v470[v491] = v492;
    end;
    local l_v470_0 = v470 --[[ copy: 110 -> 166 ]];
    local l_v443_2 = v443 --[[ copy: 104 -> 167 ]];
    v456 = function() --[[ Line: 1879 ]] --[[ Name: updatePowerupTimers ]]
        -- upvalues: v11 (copy), l_v470_0 (copy), l_v137_1 (ref), l_v138_2 (ref), l_v443_2 (copy)
        if not v11:Get() then
            return;
        else
            for _, v499 in l_v470_0 do
                v499.Inner.Cooldown.Text = "";
                v499.Inner.Cooldown.Visible = false;
            end;
            if l_v137_1 == "Powerup" and l_v138_2 == "Power Orb" then
                l_v443_2();
            end;
            return;
        end;
    end;
    local l_v457_2 = v457 --[[ copy: 109 -> 168 ]];
    l_Potions_0 = function() --[[ Line: 1896 ]] --[[ Name: updatePowerups ]]
        -- upvalues: v11 (copy), l_Search_0 (copy), l_v470_0 (copy), v93 (ref), l_v457_2 (copy), v456 (ref), l_v443_2 (copy)
        local v501 = v11:Get();
        if not v501 then
            return;
        else
            local v502 = false;
            local l_Text_4 = l_Search_0.Search.Bar.TextBox.Text;
            local v504 = string.lower((string.gsub(l_Text_4, "%s", "")));
            for v505, v506 in l_v470_0 do
                local v507 = v501.Powerups[v505] or 0;
                if v507 <= 0 then
                    v506.Visible = false;
                    v506.Inner.Background.Visible = false;
                elseif #v504 > 0 and not string.find(string.lower((string.gsub(v505, "%s", ""))), v504, 1, true) then
                    v506.Visible = false;
                    v506.Inner.Background.Visible = false;
                else
                    local _ = v506:GetAttribute("Rarity");
                    v506.Inner.Button.Inner.Amount.Text = v93(v507);
                    v506.Visible = true;
                    v502 = true;
                end;
            end;
            l_v457_2.Visible = v502;
            v456();
            l_v443_2();
            return;
        end;
    end;
    v41("Inventory", "Powerups", l_Potions_0);
    l_PropertyChangedSignal_0:Connect(l_Potions_0);
    v457 = nil;
    v470 = v57:GetDataKeys();
    v476 = v136.Currency;
    local v509 = {};
    for v510, v511 in v47 do
        if v511.InventoryDisplay then
            local v512 = v56({
                Type = "Currency", 
                Currency = v510, 
                Amount = 1
            });
            local l_Inner_1 = v512.Button.Inner;
            l_Inner_1.Label.TextColor3 = v511.Color;
            l_Inner_1.Bottom.Visible = true;
            l_Inner_1.Bottom.TextColor3 = Color3.new(1, 1, 1);
            l_Inner_1.Bottom.TextXAlignment = Enum.TextXAlignment.Right;
            v512.LayoutOrder = v511.LayoutOrder;
            v512.Parent = v476.Items;
            v17:OnEnter(v512.Button, function() --[[ Line: 1957 ]]
                -- upvalues: v11 (copy), v18 (copy), v510 (copy), v57 (copy)
                local v514 = v11:Get();
                if not v514 then
                    return;
                else
                    return v18.fromCurrency({
                        Type = "Currency", 
                        Currency = v510, 
                        Amount = v57:GetBalance(v514, v510)
                    });
                end;
            end);
            v509[v510] = v512;
        end;
    end;
    local v515 = v23.new():size(20);
    local l_v509_0 = v509 --[[ copy: 112 -> 169 ]];
    local l_v515_0 = v515 --[[ copy: 113 -> 170 ]];
    v41("Inventory", v470, function() --[[ Line: 1975 ]] --[[ Name: updateCurrency ]]
        -- upvalues: v11 (copy), l_v509_0 (copy), v47 (copy), v57 (copy), l_v515_0 (copy), v31 (copy), v23 (copy)
        local v518 = v11:Get();
        if not v518 then
            return;
        else
            for v519, v520 in l_v509_0 do
                local _ = v47[v519];
                local l_v57_Balance_0 = v57:GetBalance(v518, v519);
                local v523 = true;
                if l_v57_Balance_0 <= 0 then
                    v523 = true;
                    if v519 ~= "Coins" then
                        v523 = v519 == "Gems";
                    end;
                end;
                v520.Visible = v523;
                v523 = ("%*%*"):format(l_v515_0("x"), (v31(l_v57_Balance_0, 1000)));
                v520.Button.Inner.Bottom.Text = v23.autoStroke(v523);
            end;
            return;
        end;
    end);
    task.spawn(function() --[[ Line: 1994 ]]
        -- upvalues: v22 (copy), l_Inner_0 (copy), v456 (ref)
        while true do
            if v22:IsOpen("Inventory") and l_Inner_0.Items.Visible then
                v456();
            end;
            task.wait(0.5);
        end;
    end);
    l_ScrollingFrame_0 = function() --[[ Line: 2006 ]] --[[ Name: updateItems ]]
        -- upvalues: v452 (ref), l_Potions_0 (ref)
        v452();
        l_Potions_0();
    end;
    v470 = {};
    v476 = function(v524, v525) --[[ Line: 2012 ]] --[[ Name: playPotionNoise ]]
        -- upvalues: v470 (copy), v64 (copy)
        local v526 = "PotionUse";
        if v525 and v525 == 6 or v524 == "Infinity Elixir" then
            v526 = "PotionEvoUse";
        end;
        local v527 = os.clock();
        if v527 - (v470[v526] or 0) < 0.25 then
            return;
        else
            v470[v526] = v527;
            v64(v526);
            return;
        end;
    end;
    v34(l_UIGridLayout_0.Buttons.Use.Button, v24.Button.Green);
    v16(l_UIGridLayout_0.Buttons.Use.Button, function() --[[ Line: 2029 ]]
        -- upvalues: v11 (copy), l_v138_2 (ref), l_v137_1 (ref), v32 (copy), v23 (copy), v24 (copy), v34 (copy), v16 (copy), v33 (copy), l_v139_1 (ref), v470 (copy), v64 (copy), v20 (copy), v26 (copy), v28 (copy), v48 (copy), v50 (copy), v49 (copy), v22 (copy), v39 (copy), v62 (copy)
        local v528 = v11:Get();
        if not v528 then
            return;
        elseif not l_v138_2 then
            return;
        elseif l_v137_1 == "Potion" then
            if l_v138_2 == "Mythic" then
                local v529 = false;
                for _, v531 in v528.MasteryUpgrades do
                    if v531.Type == "DarkArts" then
                        v529 = true;
                        break;
                    end;
                end;
                if not v529 then
                    local v534 = v32.new("Uh Oh!"):Sound("PopupFailure"):Text((("You need the %* to use this potion!"):format((v23.autoColor("Dark Arts Mastery", v24.Text.Pink))))):Button(function(v532, v533) --[[ Line: 2050 ]]
                        -- upvalues: v34 (ref), v24 (ref), v16 (ref)
                        v532.Label.Text = "Close";
                        v34(v532, v24.Button.Red);
                        v16(v532, v533);
                    end);
                    return v33(v534:Build());
                end;
            end;
            local l_l_v138_2_2 = l_v138_2;
            local l_l_v139_1_1 = l_v139_1;
            local v537 = "PotionUse";
            if l_l_v139_1_1 and l_l_v139_1_1 == 6 or l_l_v138_2_2 == "Infinity Elixir" then
                v537 = "PotionEvoUse";
            end;
            local v538 = os.clock();
            if v538 - (v470[v537] or 0) >= 0.25 then
                v470[v537] = v538;
                v64(v537);
            end;
            v20:FireServer("UsePotion", l_v138_2, l_v139_1);
            return;
        else
            if l_v137_1 == "Powerup" then
                local v539 = v26[l_v138_2];
                local v540 = {
                    Type = "Powerup", 
                    Name = l_v138_2
                };
                local l_v28_OwnedAmount_0 = v28:GetOwnedAmount(v528, v540);
                if l_v28_OwnedAmount_0 <= 0 then
                    return;
                elseif v539.Type == "Gift" then
                    v33(v32.fromGift(l_v138_2, l_v28_OwnedAmount_0):Build());
                    return;
                elseif l_v138_2 == "Reroll Orb" then
                    v48:Open(function(v542) --[[ Line: 2074 ]]
                        -- upvalues: v50 (ref)
                        return v50:IsEnchantable(v542);
                    end, function(v543) --[[ Line: 2076 ]]
                        -- upvalues: v49 (ref), v22 (ref)
                        v49:SetSelectedPetId(v543.Id);
                        task.defer(function() --[[ Line: 2078 ]]
                            -- upvalues: v22 (ref)
                            v22:Open("Enchants");
                        end);
                    end, "Inventory");
                    return;
                elseif l_v138_2 == "Power Orb" then
                    v48:Open(function(v544) --[[ Line: 2086 ]]
                        -- upvalues: v39 (ref)
                        return not v39:IsMaxLevel(v544);
                    end, function(v545) --[[ Line: 2088 ]]
                        -- upvalues: v64 (ref), v20 (ref)
                        v64("PowerOrb");
                        v20:FireServer("UsePowerOrb", v545.Id);
                    end, "Inventory", "You have no pets below max level!");
                    return;
                elseif l_v138_2 == "Golden Orb" then
                    v20:FireServer("UseGoldenOrb");
                    return;
                elseif v539.Type == "Egg" then
                    if not v62(v528) then
                        return;
                    else
                        v33(v32.fromExclusiveEgg(l_v138_2, l_v28_OwnedAmount_0):Build());
                        return;
                    end;
                end;
            end;
            return;
        end;
    end);
    v34(l_UIGridLayout_0.Buttons.Craft.Button, v24.Button.Purple);
    v16(l_UIGridLayout_0.Buttons.Craft.Button, function() --[[ Line: 2112 ]]
        -- upvalues: v11 (copy), l_v138_2 (ref), l_v137_1 (ref), l_v139_1 (ref), v51 (copy), v22 (copy)
        if not v11:Get() then
            return;
        elseif not l_v138_2 or not l_v137_1 or not l_v139_1 then
            return;
        else
            v51:SetSelectedPotion({
                Name = l_v138_2, 
                Level = l_v139_1
            });
            v22:Open("Potions");
            return;
        end;
    end);
    v27(l_Details_0, l_Details_0.UIListLayout);
end;
l_Pets_0 = nil;
l_UIGridLayout_0 = nil;
l_Details_0 = l_Inner_0.Titles.Main;
v133 = l_Inner_0.Titles.Details;
l_Template_0 = l_Details_0.Tabs;
v135 = l_Details_0.Content.ScrollingFrame;
v136 = v135.Template;
v136.Parent = nil;
v137 = {};
v138 = nil;
v139 = nil;
l_MultiDelete_0 = {};
v418 = {};
for titleId, titleData in pairs(v30) do
	if titleData.Special then
		table.insert(v418, titleId)
	else
		table.insert(l_MultiDelete_0, titleId)
	end
end

l_UIGridLayout_2 = function(v548, v549) --[[ Line: 2163 ]] --[[ Name: cmp ]]
    -- upvalues: v30 (copy)
    local l_LayoutOrder_1 = v30[v548].LayoutOrder;
    local l_LayoutOrder_2 = v30[v549].LayoutOrder;
    if l_LayoutOrder_1 ~= l_LayoutOrder_2 then
        return l_LayoutOrder_1 < l_LayoutOrder_2;
    else
        return v548 < v549;
    end;
end;
table.sort(l_MultiDelete_0, l_UIGridLayout_2);
table.sort(v418, l_UIGridLayout_2);
v138 = l_MultiDelete_0[1];
v139 = v418[1];
l_MultiDelete_0 = "Progress";
v418 = v138;
local l_l_Template_0_2 = l_Template_0 --[[ copy: 94 -> 171 ]];
do
    local l_v138_3, l_v139_2, l_l_MultiDelete_0_2, l_v418_1 = v138, v139, l_MultiDelete_0, v418;
    l_UIGridLayout_2 = function(v557) --[[ Line: 2180 ]] --[[ Name: selectTab ]]
        -- upvalues: l_l_MultiDelete_0_2 (ref), v30 (copy), l_v418_1 (ref), l_v138_3 (ref), l_v139_2 (ref), v34 (copy), l_l_Template_0_2 (copy), v24 (copy), l_Pets_0 (ref)
        l_l_MultiDelete_0_2 = v557;
        local v558 = v30[l_v418_1];
        if v558.Special == true and v557 == "Progress" then
            l_v418_1 = l_v138_3;
        elseif v558.Special ~= true and v557 == "Special" then
            l_v418_1 = l_v139_2;
		end;
        v34(l_l_Template_0_2.Progress.Button, v557 == "Progress" and v24.Button.Default or v24.Button.Inactive);
		v34(l_l_Template_0_2.Special.Button, v557 == "Special" and v24.Button.Active or v24.Button.Inactive);
        l_Pets_0();
    end;
    for v559, v560 in v30 do
        local v561 = v136:Clone();
        v561.LayoutOrder = v560.LayoutOrder;
        v561.Name = v560.Display or v559;
        if typeof(v560.Color) == "ColorSequence" then
            local l_UIGradient_1 = Instance.new("UIGradient");
            l_UIGradient_1.Color = v560.Color;
            l_UIGradient_1.Parent = v561.Button.TitleName;
        else
            v561.Button.TitleName.TextColor3 = v560.Color;
        end;
        task.defer(function() --[[ Line: 2209 ]]
            -- upvalues: v561 (copy), l_ScreenGui_0 (copy)
            v561.Button.TitleName.Size = UDim2.new(0, v561.Button.TitleName.TextBounds.X / l_ScreenGui_0.UIScale.Scale, 1, 0);
        end);
        v561.Button.TitleName.Text = v560.Display or v559;
        v34(v561.Button, v24.Button.Default);
        v16(v561.Button, function() --[[ Line: 2216 ]]
            -- upvalues: l_v418_1 (ref), v559 (copy), l_Pets_0 (ref)
            l_v418_1 = v559;
            l_Pets_0();
        end);
        v561.Visible = false;
        v561.Parent = v135;
        v137[v559] = v561;
    end;
    local l_v137_2 = v137 --[[ copy: 97 -> 172 ]];
    local l_v133_0 = v133 --[[ copy: 93 -> 173 ]];
    l_Pets_0 = function() --[[ Line: 2226 ]] --[[ Name: updateTitles ]]
        -- upvalues: v11 (copy), l_v137_2 (copy), l_v418_1 (ref), v30 (copy), l_l_MultiDelete_0_2 (ref), v34 (copy), v24 (copy), l_v133_0 (copy)
        local v565 = v11:Get();
        if not v565 then
            return;
        else
            for v566, v567 in l_v137_2 do
                local v568 = v565.Titles[v566] == true;
                local v569 = v565.TitleEquipped == v566;
				local v570 = l_v418_1 == v566;
                v567.Visible = v30[v566].Special == true == (l_l_MultiDelete_0_2 == "Special");
                v567.Button.Lock.Visible = not v568;
                v567.Button.TitleName.TextTransparency = v568 and 0 or 0.35;
                v567.Button.TitleName.UIStroke.Transparency = v568 and 0 or 0.35;
                v567.Button.BackgroundTransparency = v568 and 0 or 0.35;
                v567.Button.UIStroke.Transparency = v568 and 0 or 0.35;
                v567.Button.Equipped.Visible = v569;
                v567.Button.UIStroke.Thickness = v570 and 4 or 2;
                v34(v567.Button, v568 and v24.Button.Default or v24.Button.Inactive);
                v567.Button.UIStroke.Color = v570 and v24.Color.Cyan or v24.Color.Default;
            end;
            local v571 = v565.Titles[l_v418_1] == true;
            local v572 = v565.TitleEquipped == l_v418_1;
            local v573 = v30[l_v418_1];
            if v573 then
                if typeof(v573.Color) == "ColorSequence" then
                    l_v133_0.Title.UIGradient.Color = v573.Color;
                else
                    l_v133_0.Title.UIGradient.Color = ColorSequence.new(v573.Color);
                end;
            end;
            l_v133_0.Title.Text = v573.Display or l_v418_1;
            local l_Description_0 = v573.Description;
            if v573.ChatTag == true then
                l_Description_0 = ("%*\n\n\226\156\133 Chat Tag"):format(l_Description_0);
			end;
			if v573 then
				l_v133_0.Title.Text = v573.Display or l_v418_1;
			else
				l_v133_0.Title.Text = l_v418_1 -- fallback if v573 is nil
			end

            l_v133_0.Description.Text = l_Description_0;
            l_v133_0.Buttons.Equip.Visible = v571 and not v572;
            l_v133_0.Buttons.Unequip.Visible = v571 and v572;
            local l_Requirement_0 = v573.Requirement;
            if l_Requirement_0 and not v571 then
                local v576, v577 = l_Requirement_0.GetProgress(v565);
                v576 = math.clamp(v576, 0, v577);
                l_v133_0.Progress.Visible = true;
                l_v133_0.Progress.Text = string.format("%i%%", (math.floor(100 * v576 / v577)));
                l_v133_0.Progress.Bar.Fill.Size = UDim2.new(v576 / v577, 0, 1, 6);
                return;
            else
                l_v133_0.Progress.Visible = false;
                return;
            end;
        end;
    end;
    v34(v133.Buttons.Equip.Button, v24.Button.Green);
    v16(v133.Buttons.Equip.Button, function() --[[ Line: 2287 ]]
        -- upvalues: v20 (copy), l_v418_1 (ref)
        v20:FireServer("EquipTitle", l_v418_1);
    end);
    v34(v133.Buttons.Unequip.Button, v24.Button.Pink);
    v16(v133.Buttons.Unequip.Button, function() --[[ Line: 2292 ]]
        -- upvalues: v20 (copy)
        v20:FireServer("UnequipTitle");
    end);
    v41("Inventory", {
        "Titles", 
        "TitleEquipped"
    }, l_Pets_0);
    v420 = {};
    for _, v579 in v30 do
        if v579.Requirement then
            for _, v581 in v579.Requirement.DataKeys do
                if not table.find(v420, v581) then
                    table.insert(v420, v581);
                end;
            end;
        end;
    end;
    v41("Inventory", v420, l_Pets_0);
    local l_l_UIGridLayout_2_0 = l_UIGridLayout_2 --[[ copy: 102 -> 174 ]];
    v16(l_Template_0.Progress.Button, function() --[[ Line: 2310 ]]
        -- upvalues: l_l_UIGridLayout_2_0 (copy)
        l_l_UIGridLayout_2_0("Progress");
    end);
    v16(l_Template_0.Special.Button, function() --[[ Line: 2314 ]]
        -- upvalues: l_l_UIGridLayout_2_0 (copy)
        l_l_UIGridLayout_2_0("Special");
	end);
    l_UIGridLayout_2("Progress");
    v27(v135, v135.UIListLayout);
    for v583, v584 in v30 do
        local v588 = v38.new(function(v585) --[[ Line: 2324 ]]
            -- upvalues: v584 (copy), v583 (copy)
            v585.Text = v584.Display or v583;
            local l_Color_0 = v584.Color;
            if typeof(l_Color_0) == "Color3" then
                v585.TextColor3 = l_Color_0;
                return;
            else
                v585.TextColor3 = Color3.fromRGB(255, 255, 255);
                local l_UIGradient_2 = Instance.new("UIGradient");
                l_UIGradient_2.Color = l_Color_0;
                l_UIGradient_2.Parent = v585;
                return;
            end;
        end):Description("New title earned!"):Build();
        v20.Event("TitleAcquired"):Connect(function(v589) --[[ Line: 2341 ]]
            -- upvalues: v583 (copy), v37 (copy), v588 (copy)
            if v589 == v583 then
                v37:Play(v588);
            end;
        end);
    end;
    local l_Notification_1 = l_Inner_0.Parent.Sidebar.Buttons.Titles.Button.Notification;
    local v591 = {};
    local v592 = true;
    l_UIGridLayout_0 = function() --[[ Line: 2353 ]] --[[ Name: clearTitleNotifications ]]
        -- upvalues: l_Notification_1 (copy), v11 (copy), v591 (copy)
        l_Notification_1.Visible = false;
        local v593 = v11:Get();
        if v593 then
            for v594 in v593.Titles do
                v591[v594] = true;
            end;
        end;
    end;
    v41("Inventory", "Titles", function() --[[ Line: 2364 ]]
        -- upvalues: v11 (copy), v592 (ref), l_UIGridLayout_0 (ref), v591 (copy), l_Notification_1 (copy)
        local v595 = v11:Get();
        if not v595 then
            return;
        elseif v592 then
            v592 = false;
            return l_UIGridLayout_0();
        else
            local l_Titles_0 = v595.Titles;
            local v597 = 0;
            for v598 in l_Titles_0 do
                if not v591[v598] then
                    v597 = v597 + 1;
                end;
            end;
            l_Notification_1.Visible = v597 > 0;
            l_Notification_1.Label.Text = if v597 <= 9 then tostring(v597) else "!";
            return;
        end;
    end);
    v22:BindOnOpened("Inventory", function() --[[ Line: 2387 ]]
        -- upvalues: l_Inner_0 (copy), l_UIGridLayout_0 (ref)
        if l_Inner_0.Titles.Visible then
            l_UIGridLayout_0();
        end;
    end);
    l_UIGridLayout_0();
end;
l_Details_0 = nil;
v133 = l_Inner_0.Currency.ScrollingFrame;
l_Template_0 = v57:GetDataKeys();
v135 = {};
for v599, v600 in v47 do
    v418 = v56({
        Type = "Currency", 
        Currency = v599, 
        Amount = 1
    });
    l_UIGridLayout_2 = v418.Button.Inner;
    l_UIGridLayout_2.Label.TextColor3 = v600.Color;
    l_UIGridLayout_2.Bottom.Visible = true;
    l_UIGridLayout_2.Bottom.TextColor3 = Color3.new(1, 1, 1);
    l_UIGridLayout_2.Bottom.TextXAlignment = Enum.TextXAlignment.Right;
    v418.LayoutOrder = v600.LayoutOrder;
    v418.Parent = v133;
    v17:OnEnter(v418.Button, function() --[[ Line: 2425 ]]
        -- upvalues: v11 (copy), v18 (copy), v599 (copy), v57 (copy)
        local v601 = v11:Get();
        if not v601 then
            return;
        else
            return v18.fromCurrency({
                Type = "Currency", 
                Currency = v599, 
                Amount = v57:GetBalance(v601, v599)
            });
        end;
    end);
    v135[v599] = v418;
end;
v136 = v23.new():size(20);
local l_v135_1 = v135 --[[ copy: 95 -> 175 ]];
local l_v136_1 = v136 --[[ copy: 96 -> 176 ]];
v41("Inventory", l_Template_0, function() --[[ Line: 2443 ]] --[[ Name: updateCurrency ]]
    -- upvalues: v11 (copy), l_v135_1 (copy), v47 (copy), v57 (copy), l_v136_1 (copy), v31 (copy), v23 (copy)
    local v604 = v11:Get();
    if not v604 then
        return;
    else
        for v605, v606 in l_v135_1 do
            local _ = v47[v605];
            local l_v57_Balance_1 = v57:GetBalance(v604, v605);
            local v609 = true;
            if l_v57_Balance_1 <= 0 then
                v609 = true;
                if v605 ~= "Coins" then
                    v609 = v605 == "Gems";
                end;
            end;
            v606.Visible = v609;
            v609 = ("%*%*"):format(l_v136_1("x"), (v31(l_v57_Balance_1, 1000)));
            v606.Button.Inner.Bottom.Text = v23.autoStroke(v609);
        end;
        return;
    end;
end);
v27(v133, v133.UIGridLayout);
v133 = function(v610) --[[ Line: 2467 ]] --[[ Name: setPage ]]
    -- upvalues: l_CancelAutoExclusiveEggHatch_0 (ref), l_Inner_0 (copy), v94 (ref), l_Notification_0 (ref), l_UIGridLayout_0 (ref), l_ScreenGui_0 (copy)
    l_CancelAutoExclusiveEggHatch_0();
    if v610 == "Pets" then
        l_Inner_0.Pets.Visible = true;
        l_Inner_0.Items.Visible = false;
        l_Inner_0.Titles.Visible = false;
        l_Inner_0.Currency.Visible = false;
        l_Inner_0.Parent.Top.Title.Title.Text = "My Pets";
        l_Inner_0.Parent.Tray.Visible = true;
        v94();
    elseif v610 == "Items" then
        l_Inner_0.Pets.Visible = false;
        l_Inner_0.Items.Visible = true;
        l_Inner_0.Titles.Visible = false;
        l_Inner_0.Currency.Visible = false;
        l_Inner_0.Parent.Top.Title.Title.Text = "My Items";
        l_Inner_0.Parent.Tray.Visible = false;
        l_Notification_0();
    elseif v610 == "Titles" then
        l_Inner_0.Pets.Visible = false;
        l_Inner_0.Items.Visible = false;
        l_Inner_0.Titles.Visible = true;
        l_Inner_0.Currency.Visible = false;
        l_Inner_0.Parent.Top.Title.Title.Text = "My Titles";
        l_Inner_0.Parent.Tray.Visible = false;
        l_UIGridLayout_0();
    elseif v610 == "Currency" then
        l_Inner_0.Pets.Visible = false;
        l_Inner_0.Items.Visible = false;
        l_Inner_0.Titles.Visible = false;
        l_Inner_0.Currency.Visible = true;
        l_Inner_0.Parent.Top.Title.Title.Text = "My Currency";
        l_Inner_0.Parent.Tray.Visible = false;
    else
        warn((("unknown page \"%*\""):format(v610)));
    end;
    if v610 == "Titles" then
        l_Inner_0.Parent.Size = UDim2.fromOffset(800, 550);
    elseif v610 == "Currency" then
        l_Inner_0.Parent.Size = UDim2.fromOffset(750, 550);
    else
        l_Inner_0.Parent.Size = UDim2.fromOffset(1235, 770);
    end;
    l_ScreenGui_0.Inventory.Frame.Top.StorageHolder.Visible = v610 == "Pets";
end;
for _, v612 in l_Inner_0.Parent.Sidebar.Buttons:GetChildren() do
    if v612:IsA("Frame") and v612.Visible then
        v16(v612.Button, function() --[[ Line: 2519 ]]
            -- upvalues: l_Search_0 (copy), v124 (ref), v133 (copy), v612 (copy)
            l_Search_0.Search.Bar.TextBox.Text = "";
            v124();
            v133(v612.Name);
        end);
    end;
end;
v133("Pets");
v45(l_Tray_0.Buttons.Buttons.Best.Button.Keybind, "Equip Best", function() --[[ Line: 2531 ]]
    -- upvalues: v20 (copy)
    v20:FireServer("EquipBestPets");
end);
v34(l_Inner_0.Parent.Top.Close.Button, v24.Button.Red);
v16(l_Inner_0.Parent.Top.Close.Button, function() --[[ Line: 2538 ]]
    -- upvalues: v22 (copy)
    v22:Close();
end);
v22:BindOnClosed("Inventory", function() --[[ Line: 2542 ]]
    -- upvalues: v124 (ref)
    v124();
end);
l_Template_0 = {
    IsMultiDeleting = function(_) --[[ Line: 2551 ]] --[[ Name: IsMultiDeleting ]]
        -- upvalues: v123 (ref)
        return v123();
    end, 
    StopMultiDeleting = function(_) --[[ Line: 2556 ]] --[[ Name: StopMultiDeleting ]]
        -- upvalues: v124 (ref)
        v124();
    end
};
v135 = l_ScreenGui_0.Inventory.Frame;
v136 = v135.Top.StorageHolder.Buy;
v137 = v135.Sidebar.Buttons;
v138 = function() --[[ Line: 2571 ]] --[[ Name: updateButton ]]
    -- upvalues: v63 (copy), v136 (copy), v135 (copy), l_ScreenGui_0 (copy)
    if v63.Mode == "Touch" then
        v136.Position = UDim2.new(1, -v135.Top.StorageHolder.Storage.TextBounds.X / l_ScreenGui_0.UIScale.Scale - 10, 0, 15);
        v136.Size = UDim2.fromOffset(60, 60);
        v136.AnchorPoint = Vector2.new(1, 0);
        v136.Button.Label.Text = "+";
        v136.Button.Label.TextSize = 64;
        return;
    else
        v136.Button.Label.Text = "Get More";
        v136.Position = UDim2.fromOffset(0, 55);
        v136.Size = UDim2.fromOffset(120, 35);
        v136.AnchorPoint = Vector2.new();
        v136.Button.Label.TextSize = 26;
        return;
    end;
end;
v63.Changed:Connect(function(v615) --[[ Line: 2588 ]]
    -- upvalues: v135 (copy), v137 (copy), l_ScreenGui_0 (copy), v138 (copy)
    local v616 = v615 == "Touch";
    local v617 = Vector2.new(v616 and 1 or 0);
    local v618 = v616 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left;
    v135.Top.StorageHolder.AnchorPoint = v617;
    v135.Top.StorageHolder.Digital.AnchorPoint = v617;
    v135.Top.StorageHolder.Storage.AnchorPoint = v617;
    v135.Top.StorageHolder.Digital.TextXAlignment = v618;
    v135.Top.StorageHolder.Storage.TextXAlignment = v618;
    v135.Top.StorageHolder.Digital.TextSize = v616 and 50 or 36;
    v135.Top.StorageHolder.Storage.TextSize = v616 and 50 or 36;
    v135.Top.StorageHolder.Digital.Size = UDim2.fromOffset(v616 and 200 or 100, v616 and 60 or 40);
    v135.Top.StorageHolder.Digital.Position = UDim2.new(v616 and 1 or 0, 0, 0, v616 and 20 or 10);
    v135.Top.StorageHolder.Storage.Position = UDim2.new(v616 and 1 or 0, 0, 0, v616 and 20 or 10);
    v135.Top.StorageHolder.Position = UDim2.new(v616 and 1 or 0, v616 and -95 or 1, 0, 0);
    local v619 = v616 and 90 or 65;
    for _, v621 in v137:GetChildren() do
        if v621:IsA("Frame") then
            v621.Size = UDim2.fromOffset(v619, v619);
            v621.Button.Label.TextSize = v616 and 34 or 20;
        end;
    end;
    v137.UIListLayout.Padding = UDim.new(0, v616 and 20 or 20);
    v135.Sidebar.Position = UDim2.new(0, v616 and 0 or -15, 0.5, v616 and -75 or 0);
    local v622 = v616 and 60 or 45;
    v135.Inner.Pets.Details.Icon.Inner.Button.Inner.Lock.Size = UDim2.fromOffset(v622, v622);
    task.defer(function() --[[ Line: 2627 ]]
        -- upvalues: v135 (ref), v619 (copy), v137 (ref), l_ScreenGui_0 (ref)
        v135.Sidebar.Size = UDim2.fromOffset(v619 + 20, v137.UIListLayout.AbsoluteContentSize.Y / l_ScreenGui_0.UIScale.Scale + 30);
    end);
    v138();
end);
v135.Top.StorageHolder.Storage:GetPropertyChangedSignal("TextBounds"):Connect(v138);
return l_Template_0;
