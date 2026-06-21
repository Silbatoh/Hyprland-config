-- Script which adapts the output of nwg-display (monitors.conf) to be readable by the confiurationn file (hyprland.lua)

local function apply_nwg_displays()
    -- Filepaths
    local filepath = os.getenv("HOME") .. "/.config/hypr/monitors.conf"
    local file = io.open(filepath, "r")

    -- Read file
    for line in file:lines() do
        -- Ignore comment lines
        if line:sub(1, 1) ~= "#" and line:sub(1, 8) == "monitor=" then
            
            -- Extract monitor config
            local data = line:sub(9)
            local params = {}
            
            -- Separate data
            for param in string.gmatch(data, "([^,]+)") do
                table.insert(params, param)
            end
            
            -- Check if data is correct and apply
            if #params >= 4 then
                hl.monitor({
                    output   = params[1],
                    mode     = params[2],
                    position = params[3],
                    scale    = params[4]
                })
            end
        end
    end
    file:close()
end


return apply_nwg_displays
