# Sisyphus Nui Denial
---
**This script is designed to ban players that access FiveM's NuiDevTools while they are in your server.**
=> This will help to prevent people from exploiting triggers through nuidevtools

# To Do:
---
=> Add HWID Ban ability

# Installation
---
1. Add the file to your server `resources`.
2. Ensure Sisyphus_Nui_Denial in your CFG
3. Add the following to your qb-core>qb-smallresources>server>logs in the `local Webhooks` table:
```
  ['snd'] = 'Your discord webhook goes here'
```
4. Restart your server.

# Permissions
---
Within the permissions.lua you can add permissions either with the license or the discord id.

**You can add more permission types in server>main.lua**

# License
---
Feel free to edit this to your liking but please be sure to leave credit to the author.

# Credit
---
This script was inspired by QamarQ's nui_blocker
