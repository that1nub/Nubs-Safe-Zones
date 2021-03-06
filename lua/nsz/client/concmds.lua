-- Convars for the HUD
if not ConVarExists("nsz_show_zones") then
    CreateClientConVar("nsz_show_zones", 0, true, false, "Allows you to debug and lets you see zones no matter where you are located.", 0, 1)
end
if not ConVarExists("nsz_show_display") then
    CreateClientConVar("nsz_show_display", 1, true, false, "Should the HUD show which zones you are in?", 0, 1)
end

concommand.Add("nsz_delete", function(ply, cmd, args, argStr)
    net.Start("nsz_delete")
        net.WriteString(argStr)
    net.SendToServer()
end)

-- This is when the server sends zones to the client
net.Receive("nsz_download", function()
    nsz.zones = net.ReadTable()
    nsz.zonetypes = net.ReadTable()
end)
