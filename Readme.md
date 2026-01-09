# Gyro: Get Your Raid On!

Gyro lets you set up macros to be run whenever you join or leave a raid, for convenience or laziness.  You can, for example, enable raid UI mods only when you're actually in a raid, disabling them when you're done.

## Installing

Gyro is installed like any other World of Warcraft addon. If you're not using a tool to manage your addons, extract the Gyro folder from the zip file to your addons folder, which will be in a location like one of these:

```
C:\Users\Public\Games\World of Warcraft\_retail_\Interface\AddOns
C:\Program Files\World of Warcraft\_retail_\Interface\AddOns
C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns
```

## Getting started

*If you're quite familiar with macros already, you might want to skip this section and go straight to "Gyro setup guide for l33t macro masters."*

When you first log in after installing and enabling Gyro, you won't notice anything different.  Gyro doesn't know what you want yet, so it won't do anything.  Gyro is controlled through slash commands, which work very much like the emotes, such as /dance.  To see what options Gyro has, type the following command in your chat window:

`/gyro`

This will list all of the different commands you can use with Gyro.  The first thing you want to do is set up the Gyro macros, so type this command:

`/gyro macros`

This will open up the Macros UI.  If you haven't see this window before, macros are batches of commands that can be run all at once.  Normally you do this so that you can assign things you commonly say and do to a single button on your action bar, but Gyro also uses macros to control its behavior.  The Macros window has two tabs at the top: the one on the left contains macros shared by all of your characters, and the one on the right contains macros that are specific to the character you're currently playing.  Click that tab.

You should see two macros here: one with a red minus sign called GyroEndRaid, and one with a blue plus sign called GyroStartRaid.  All of the commands in GyroStartRaid will be run each time that you enter a raid, and all of the commands in GyroEndRaid will be run when you leave a raid, and when you first log in.  Right now, all that's in each macro is a helpful instruction.

Now you need to decide what you want each macro to do.  Click on GyroStartRaid (the blue plus sign).  Replace the macro that Gyro created for you with the following text:

`/s Hey everyone, I just entered a raid!`

Note that this looks exactly like something that you'd normally type into the chat window.  If this is what your GyroStartRaid macro contains and you're invited to a raid group, you'll say "Hey everyone, I just entered a raid!" to everyone around you.  Annoying and not very useful, but it's a start.

Now, to test this out, you can ask a friend to invite you to a raid.  If you don't have any friends, there's another way to test your new macro out.  Type the following command into the chat window (close the Macros window if you still have it open):

`/gyro on`

This command makes Gyro act as if you're in a raid, even if you're not.  When you type that command, notice that you just told everyone around you that you entered a raid.  How embarrassing.  Gyro isn't very useful if you force it on all the time, so let's put it back into the normal "automatic" mode by typing this command:

`/gyro auto`

So, neat, perhaps, but still not very useful.  Now it's time to decide what you really want to happen when you join or leave a raid.  Personally, I use Gyro to disable and hide some of my mods when I'm not in a raid and I don't need them.  For example, I can use Gyro to turn off Hear Kitty when I'm not in a raid, and turn it back on when I join one.

**GyroStartRaid:**  
`/hearkitty on`

**GyroEndRaid:**  
`/hearkitty off`

You probably had something else in mind when you downloaded this mod.  Go ahead and set up your two macros to do whatever you like now.  It's okay to leave one of them blank, if, for example, you only want to do something when joining a raid, but not when leaving a raid.

**Important: Gyro macros can't be used to cast spells or use items.**  This is a restriction that Blizzard puts on mods to prevent botting and automated play.  If you put a restricted action in one of your Gyro macros, Gyro will skip that action and warn you about this in the chat window.

Once you've gotten more familiar with Gyro, you'll want to check out the section titled "More Gyro options."

Enjoy!

## Gyro setup guide for l33t macro masters

Already know a lot about macros, and you already skipped the previous section?  Great.  I'll keep this short.  Type this command at a chat window:

`/gyro macros`

This will automatically create two character-specific macros for you, **GyroStartRaid** and **GyroEndRaid**.  The former will be executed whenever you join a raid, and the latter will be executed whenever you leave one.  Write these like you would any other macros.  Easy as that.  Type "/gyro" at the chat window for more options.

**Important: Gyro macros can't be used to cast spells or use items.**  This is a restriction that Blizzard puts on mods to prevent botting and automated play.  If you put a restricted action in one of your Gyro macros, Gyro will skip that action and warn you about this in the chat window.

## More Gyro options

Gyro is pretty simple, but it does have a few options that you can set.

### Forcing Gyro in or out of raid mode

Normally, Gyro automatically detects whether or not you're in a raid, and runs the appropriate macro for your situation.  However, when testing out your macros, or in certain other circumstances, you might want to override this.  Gyro has handy options for doing just that.

`/gyro auto`  
`/gyro on`  
`/gyro off`

The default is **auto**, which detects whether or not you're in a raid for you.  You can use **/gyro on** to be in raid mode even when you're not in a raid, or **/gyro off** to be in non-raid mode even when you're in a raid.

### Do battleground raids count as raids?

Some people consider PVP battlegrounds as raids, and some people don't.  You can decide whether Gyro counts a battleground raid as a raid ("on") or not ("off") with these commands:

`/gyro bg on`  
`/gyro bg off`

## Suggestions

### Reminding yourself to repair and buy reagents before raids

You can use Gyro to remind yourself to get reagents and repair before raids.

**GyroStartRaid:**  
`/w Vger Don't forget to repair and buy reagents!`

Replacing "Vger" with your own character's name, of course.

## Using Gyro with your favorite mods

Here are some tips for using Gyro with other mods.

### Hear Kitty

**GyroStartRaid:**  
`/hearkitty on`

**GyroEndRaid:**  
`/hearkitty off`

### KLHThreatMeter (KTM)

**GyroStartRaid:**  
`/ktm g s`

**GyroEndRaid:**  
`/ktm g h`

### Omen

As of writing, Omen has a slash command to toggle the display, but not to explicitly turn it on or off.  But, there's a workaround.

**GyroStartRaid:**  
`/script Omen:Toggle(true)`

**GyroEndRaid:**  
`/script Omen:Toggle(false)`

### Grid

**GyroStartRaid:**  
`/script GridLayoutFrame:Show()`

**GyroEndRaid:**  
`/script GridLayoutFrame:Hide()`

### Spirit Versus Intellect UI

**GyroStartRaid:**  
`/sviui show`

**GyroEndRaid:**  
`/sviui hide`

## Contacting the author

* [See all of my addons](https://www.vgermods.com)
* You can reach me on [Facebook](https://www.facebook.com/vgermods)
* Leave a comment on [CurseForge](https://www.curseforge.com/wow/addons/pawn)
* Email vger at vgermods.com

## Updates

Please note that this addon is not in active development.

### Version 1.2.1

* Additional changes for Mists of Pandaria and patch 5.0.

### Version 1.2

* Updated for Mists of Pandaria and patch 5.0.

### Version 1.1

* Updated for patch 4.3.

### Version 1.0.10

* Incredibly minor update for patch 4.1.

### Version 1.0.9

* Update for Cataclysm.
* Some unnecessarily spammy messages ("Entering raid") were removed.

### Version 1.0.8

* Update for patch 3.3.5.

### Version 1.0.7

* Incredibly minor update for patch 3.2.

### Version 1.0.6

* Updated the default macro icons for patch 3.1.

### Version 1.0.5

* Removed the "Gyro is loaded" message that appears when logging in.
* Updated the default macro icons for patch 3.0.2.

### Version 1.0.4

* Updated the default macro icons for patch 2.4.2.

### Version 1.0.3

* Added some hints to the readme to help you get started using Gyro with a few popular mods, such as Omen.
* Updated the default macro icons for patch 2.4.

### Version 1.0.2

* Updated the macro icons for patch 2.3.

### Version 1.0.1

* Now displays a more readable error message when the embedded mod VgerCore is missing or failed to load.

### Version 1.0

* Gyro is now at version 1.0!  It includes VgerCore embedded within the mod, so you no longer need a VgerCore folder inside of your AddOns folder.
* Gyro's English text has been separated into a different file, Localization.lua, to ease translation into other languages.

### Version 0.2.2

* Gyro now checks for a valid version of VgerCore when it starts up.

### Version 0.2.1

* Updated for World of Warcraft: The Burning Crusade (patch 2.0.3).
* VgerCore 0.3.1: The latest version of VgerCore allows Gyro to block forbidden commands such as /cast from macros, which prevents the game from warning you about VgerCore and asking if you want to disable it.

### Version 0.2

* Updated for patch 2.0.
* Removed the unnecessary "entering raid" and "leaving raid" text that appeared in the top center of the screen. It will now show up only in the combat log.

### Version 0.1

* First version publicly released.

---
by Vger-Azjol-Nerub—[www.vgermods.com](https://www.vgermods.com)

© 2006-2026 Travis Spomer. This mod is released under the Creative Commons [Attribution-NonCommercial-NoDerivs 3.0](http://creativecommons.org/licenses/by-nc-nd/3.0) license. By using the mod you agree to the terms of the license.
