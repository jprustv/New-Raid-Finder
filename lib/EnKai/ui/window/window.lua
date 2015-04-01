local addonInfo, privateVars = ...

function EnKai.ui.nkWindow(name, parent) 

	local window = UI.CreateFrame('RiftWindow', name, parent)
	local dragFrame = UI.CreateFrame ('Frame', name .. 'dragFrame', window:GetBorder())	
	local btClose = UI.CreateFrame("RiftButton", name .. ".btClose", window)
	
	local properties = {}

	function window:SetValue(property, value)
		properties[property] = value
	end
	
	function window:GetValue(property)
		return properties[property]
	end
	
	local allowSecureClose = true

	window:SetValue("name", name)
	window:SetValue("parent", parent)
	
	dragFrame:SetPoint ("TOPLEFT", window, "TOPLEFT", 0, 0)
	dragFrame:SetHeight(60)
	dragFrame:SetWidth(100)	
	dragFrame:SetVisible(false)
	
	dragFrame:EventAttach(Event.UI.Input.Mouse.Left.Down, function (self)		
		
		self.leftDown = true
		local mouse = Inspect.Mouse()
		
		self.originalXDiff = mouse.x - self:GetLeft()
		self.originalYDiff = mouse.y - self:GetTop()
		
		local left, top, right, bottom = window:GetBounds()
		
		window:ClearAll()
		window:SetPoint("TOPLEFT", UIParent, "TOPLEFT", left, top)
		window:SetWidth(right-left)
		window:SetHeight(bottom-top)
	
	end, name .. "dragFrame.Left.Down")
	
	dragFrame:EventAttach( Event.UI.Input.Mouse.Cursor.Move, function (self, _, x, y)	
		if self.leftDown ~= true then return end
		window:SetPoint("TOPLEFT", UIParent, "TOPLEFT", x - self.originalXDiff, y - self.originalYDiff)
	end, name .. "dragFrame.Cursor.Move")
	
	dragFrame:EventAttach( Event.UI.Input.Mouse.Left.Up, function (self)	
	    self.leftDown = false
	    EnKai.eventHandlers[name]["Moved"](window:GetLeft(), window:GetTop())
	end, name .. "dragFrame.Left.Up")
	
	dragFrame:EventAttach( Event.UI.Input.Mouse.Left.Upoutside, function (self)	
	    self.leftDown = false
	    EnKai.eventHandlers[name]["Moved"](window:GetLeft(), window:GetTop())
	end, name .. "dragFrame.Left.Upoutside")
	
	btClose:SetSkin("close")
	btClose:SetPoint("TOPRIGHT", window, "TOPRIGHT", -8, 15)
	
	btClose:EventAttach(Event.UI.Input.Mouse.Left.Click, function ()
		if Inspect.System.Secure() == false or allowSecureClose == true then window:SetVisible(false) end
	end, name .. "btClose.Left.Click")

	function window:SetDragable (flag)
		dragFrame:SetVisible(flag)
	end
	
	function window:SetCloseable (flag)
		btClose:SetVisible(flag)
	end
	
	function window:PreventSecureClose(flag)
		if flag == true then allowSecureClose = false else allowSecureClose = true end
	end
		
	local oSetWidth, oSetHeight, oSetPoint = window.SetWidth, window.SetHeight, window.SetPoint
	
	function window:SetWidth(width)
		oSetWidth(self, width)
		dragFrame:SetWidth(width)
	end
	
	function window:SetPoint(from, object, to, x, y)
	
		if x ~= nil then
			if x < 0 then x = 0 end
			if x + window:GetWidth() > UIParent:GetWidth() then x = UIParent:GetWidth() - window:GetWidth() end
		end
		
		if y ~= nil then
			if y < 0 then y = 0 end
			if y + window:GetHeight() > UIParent:GetHeight() then y = UIParent:GetHeight() - window:GetHeight() end
		end
		
		if x ~= nil and y ~= nil then			
			oSetPoint(self, from, object, to, x, y)
		else
			oSetPoint(self, from, object, to)
		end
		
	end 
	
	EnKai.eventHandlers[name] = {}
	EnKai.events[name] = {}
	EnKai.eventHandlers[name]["Moved"], EnKai.events[name]["Moved"] = Utility.Event.Create(addonInfo.identifier, name .. "Moved")
	
	return window
	
end