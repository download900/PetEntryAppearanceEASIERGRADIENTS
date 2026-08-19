(in v37.UpdateIcon)

--------------------------------------------------
		-- XL / XXL / XS BADGE
		--------------------------------------------------

		local XLLabel = v55:FindFirstChild("XL")

		local isXL = v56.Type == "Pet" and v56.XL == true
		local isXXL = v56.Type == "Pet" and v56.XXL == true
		local isXS = v56.Type == "Pet" and v56.XS == true

		if isXL or isXXL or isXS then

			-- Create the badge if it doesn't already exist
			if not XLLabel then
				local XLTemplate = game.ReplicatedStorage.Shared.Utils.Stats.ItemUtil.XL

				if XLTemplate then
					XLLabel = XLTemplate:Clone()
					XLLabel.Name = "XL"
					XLLabel.Parent = v55
				end
			end

			if XLLabel then
				XLLabel.Visible = true

				-- Change the text depending on the pet size
				if isXXL then
					XLLabel.Text = "XXL"
				elseif isXS then
					XLLabel.Text = "XS"
				else
					XLLabel.Text = "XL"
				end

				-- Make sure it renders above the pet image
				XLLabel.ZIndex = v61.ZIndex + 1
			end

		elseif XLLabel then

			-- Hide XL badge when this isn't a size variant
			XLLabel.Visible = false

		end
