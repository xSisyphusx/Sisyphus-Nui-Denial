--_________.__                      .__                  
--/   _____/|__| _________.__.______ |  |__  __ __  ______
--\_____  \ |  |/  ___<   |  |\____ \|  |  \|  |  \/  ___/
--/        \|  |\___ \ \___  ||  |_> >   Y  \  |  /\___ \ 
--/_______  /|__/____  >/ ____||   __/|___|  /____//____  >
--       \/         \/ \/     |__|        \/           \/ 

RegisterNUICallback(GetCurrentResourceName(), function()
    TriggerServerEvent(GetCurrentResourceName())
  end)