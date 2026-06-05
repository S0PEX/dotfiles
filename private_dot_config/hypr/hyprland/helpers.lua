local M = {}

---@param value string?
---@return string
function M.normalize_monitor_description(value)
    local normalized = tostring(value or ""):lower()
    normalized = (normalized:gsub("%s+", " "))
    normalized = (normalized:gsub("^%s+", ""))
    normalized = (normalized:gsub("%s+$", ""))

    return normalized
end

---@param left string?
---@param right string?
---@return number
function M.levenshtein_similarity(left, right)
    left = M.normalize_monitor_description(left)
    right = M.normalize_monitor_description(right)

    if left == right then
        return 1
    end

    local left_length = #left
    local right_length = #right

    if left_length == 0 or right_length == 0 then
        return 0
    end

    ---@type integer[]
    local previous_row = {}
    ---@type integer[]
    local current_row = {}

    for column = 0, right_length do
        previous_row[column] = column
    end

    for row = 1, left_length do
        current_row[0] = row
        local left_char = left:sub(row, row)

        for column = 1, right_length do
            local substitution_cost = (left_char == right:sub(column, column)) and 0 or 1
            local deletion_cost = previous_row[column] + 1
            local insertion_cost = current_row[column - 1] + 1
            local substitution_total = previous_row[column - 1] + substitution_cost

            current_row[column] = math.min(deletion_cost, insertion_cost, substitution_total)
        end

        previous_row, current_row = current_row, previous_row
    end

    local distance = previous_row[right_length]
    local longest_length = math.max(left_length, right_length)

    return 1 - (distance / longest_length)
end

return M
