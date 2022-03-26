
webhook = ''


RegisterCommand('callstaff', function(source, args)
    if (webhook == nil or webhook == '') then
        print("There is no webhook assinged to this resource.")
    end

    if #args > 0 then 
        local name = GetPlayerName(source)
        local message = table.concat(args, " ")
        TriggerClientEvent('chatMessage', source, "^7[^5vCallStaff^7]: ^2Thanks for calling staff! we will be with you shortly")
        sendToDiscord(16711680, "vCallStaff", "**Player Calling Staff:**\n\n **["..source.."]** "..name.."\n\n**Message:**\n".."`"..message.."`", footer) 
    else
      TriggerClientEvent('chatMessage', source, "^7[^5vCallStaff^7]: ^1Invalid format please use /callstaff <message>")
    end
end, false)



function sendToDiscord(color, name, message, footer)
    local staffrole = "" -- Example "<@&924422219852034068>"
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = "Made By: Viper",
              },
          }
      }

      PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed, content = ""..staffrole..""}), { ['Content-Type'] = 'application/json' })
end