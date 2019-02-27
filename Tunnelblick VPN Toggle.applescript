tell application "Tunnelblick"
	get state of first configuration where name = "vpn_configuration_name"
	if result = "CONNECTED" then
		disconnect "vpn_configuration_name"
		get state of first configuration where name = "vpn_configuration_name"
		repeat until result = "DISCONNECTING"
			delay 1
			get state of first configuration where name = "vpn_configuration_name"
		end repeat
	else
		connect "vpn_configuration_name"
		get state of first configuration where name = "vpn_configuration_name"
		repeat until result = "CONNECTED"
			delay 1
			get state of first configuration where name = "vpn_configuration_name"
		end repeat
	end if
end tell