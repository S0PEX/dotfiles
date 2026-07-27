-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local helpers = require("hyprland.helpers")

--- Define monitor layouts for each environment
--- List monitors from left to right, matching their order in the workspace layout
---@type table<string, string[]>
local monitors = {
	home = {
		"AOC 24G2W1G4 0x000002D4",
		"HP Inc. HP X27i CNK0270K6T"
	},

	office = {
		"BNQ BenQ XL2411Z H6E00533SL0",
		"LG Electronics BK550Y 812NTUW0Y142"
	},

	office2 = {
		"Hewlett Packard HP Z24i CN47310797",
		"Dell Inc. DELL U2312HM KF87Y3B2B5VS"
	},
}

--- Finds the best matching monitor setup based on the currently connected monitors.
---@return string[]
local function get_active_monitors()
	---@type string[]
	local connected = {}
	for _, m in ipairs(hl.get_monitors()) do
		table.insert(connected, m.description)
	end

	---@type string[]
	local best_setup = monitors.home
	---@type number
	local best_score = -1

	-- Use Levenshtein similarity so small description changes still match.
	for _, setup in pairs(monitors) do
		---@type number
		local score = 0
		for _, desc in ipairs(setup) do
			---@type number
			local best_similarity = 0

			for _, conn in ipairs(connected) do
				local similarity = helpers.levenshtein_similarity(desc, conn)

				if similarity > best_similarity then
					best_similarity = similarity
				end
			end

			score = score + best_similarity
		end

		if score > best_score then
			best_score = score
			best_setup = setup
		end
	end

	return best_setup
end

--- Applies workspace-to-monitor rules for the currently active monitor layout.
local function apply_workspace_rules()
	---@type string[]
	local active = get_active_monitors()

	-- Workspace rules
	for ws = 1, 10 do
		---@type boolean
		local is_first = (ws == 1 or ws == 6)
		---@type string
		local monitor = (ws <= 5) and active[1] or active[2]

		hl.workspace_rule({
			workspace = tostring(ws),
			monitor = "desc:" .. monitor,
			default = is_first or false,
		})
	end
end

-- Re-apply workspace rules when a monitor becomes available.
hl.on("monitor.added", apply_workspace_rules)
