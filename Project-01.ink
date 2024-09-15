/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR health=100
VAR pet_name= ""
VAR flashlight= 1
VAR people_helped= 0
VAR bandages= 3
VAR dog=-1

-> beginning

== function advance_dog==

    ~ dog = dog + 1
    
    {
        - dog > 2:
            ~ dog = 0
    }    
    
    {    
        - dog == 0:
            ~ return "The dog is silent."
        
        - dog == 1:
            ~ return "The dog is wagging it's tail."
        
        - dog == 2:
            ~ return "The dog cleans itself."
    
    }

==beginning==
Up.. and ... Oomph!
You hurdle over a sizeable piece of broken street asphalt. The dog that accompanies you does a big jump as well. You want to tell him "Good boy!", but... suddenly, you forgot his name!! It starts with a B....

*[It's Bee!] 
    ~ pet_name = "Bee" 
    -> broken_highway
*[It's Bandit!] 
    ~ pet_name = "Bandit" 
    -> broken_highway
*[It's Bear!] 
    ~ pet_name = "Bear" 
    -> broken_highway

==broken_highway==
"Good boy, {pet_name}!!", you say.
You and your fuzzy golden retiever companion have now entered an area that seems to be where a large highway once existed. The highway is in complete ruin, dotted with sinkholes and black burn marks where flame-engulfed cars once sat.
This is what most of your world looks like now. Once a bright shade of cerulean, the sky is dark and cloudy. The city you stand in used to have skyscrapers and streets full of bustling pedestrians, but the buildings have been reduced to ruin and rubble. It's become apocalyptic.
Where to next?

Your health is at {health}, and in your backpack you have {flashlight} flashlight and {bandages} bandage(s). You have rescued {people_helped} person(s).
{ advance_dog()}

*[Let's go left]-> highway_bridge
* [I'm feeling like right] -> rubble

==highway_bridge==
You take a left for a bit and reach the bridge portion of the highway, spanning over a small canal.
{ advance_dog()}

*[Go underneath the bridge] -> dark_bridge
*[Keep going left] -> broken_building

==rubble==
Going right takes you to a ruined parking garage. It's completelty covered in rubble, though, so it's a bit hard to tell what it is and hard to move around inside. 
Suddenly, {pet_name} perks up and starts aggresively sniffing the area around you. You're confused, but you start to hear the rubble shifting around and a faint, hoarse voice.
{ advance_dog()}

+[Approach {pet_name} and the faint noise carefully] -> person_1

==person_1==
With {pet_name} in the lead, you approach the source of the noise. The closer you get, the more you can make out what the noise is, "...Help... Too heavy... Can't move...Is someone there?...". 
It's a human speaking! You speed up. You're met with a middle-aged woman, coated in dust and with several bruises and scrapes on her face. {pet_name} paws at the rubble covering her.
{ advance_dog()}

+ [Help her out of the rubble]-> person_1_save

==person_1_save==
~ people_helped = people_helped + 1
Luckily, you're quite strong, so you move the rubble off of her with ease. You help her up and notice that the rest of her body is coated in bruises, too. {pet_name} gives her a few loving licks.
{ advance_dog()}
+ [Give her a bandage]-> person_1_help

==person_1_help==
~bandages = bandages - 1
"Thank you so much!! I thought I was doomed...", she says. She pets {pet_name} a few times before heading off to care to her injuries. 
Your health is at {health}, and in your backpack you have {flashlight} flashlight and {bandages} bandage(s). You have rescued {people_helped} person(s).
{ advance_dog()}
+ [Return to the highway] ->broken_highway

==dark_bridge==
After sliding down the steep hill next to the bridge, you're faced with the huge opening underneath. It's insanely dark, you even hear {pet_name} whimper a little bit.
{ advance_dog()}
*[Take flashlight out of bag] -> flash
+[Go back] ->highway_bridge

==flash==
~flashlight = flashlight - 1
You take the flashlight out of the bag and switch it on.
{ advance_dog()}
+ [Light the bridge's underside] ->lit_bridge

==lit_bridge==
You can now see your way through the underside of the bridge. Now that there's some light, {pet_name} isn't so scared. You also notice a couple of other things in the bridge: a person sitting fetal position against the wall, and a semi-soggy newspaper.
Your health is at {health}, and in your backpack you have {flashlight} flashlight and {bandages} bandage(s). You have rescued {people_helped} person(s).
{ advance_dog()}
+ [Approach the person] -> person_2_fight
+ [Read the newspaper] -> newspaper
-> END

==person_2_fight==
~health = health -10
You approach the person semi-cautiously. Letting a little light hit them, the person looks sweaty, malnourished and pale. They aren't doing anything but curling up and shaking. {pet_name} does a subtle growl.
"Hey the-", you start, but you're very quickly cut off, as the strange person jumps up and attacks you! Ouch!!
{pet_name} starts barking.
Do you want to fight back, or try your best to avoid hurting the person?
Your health is at {health}, and in your backpack you have {flashlight} flashlight and {bandages} bandage(s). You have rescued {people_helped} person(s).
{ advance_dog()}
* [Hell no, I'm fighting back!] -> person_2_defeat
* [I want to help them, so I can't hurt them!] -> person_2_help

==newspaper==
You pick the newspaper up and shine your flashlight on it to read. It's published by The Daily Capsule. The headline says "WORLD AT REST!".
"After a period of battling, the two terrors of the world have finally been extinguished!! Local boy fights and wins against the notorious twin creations."
Ah... you recall reading this several years ago. Your world has always been fighting something...
{ advance_dog()}
+ [Help the person against the wall] -> person_2_fight

==person_2_defeat==
You can't help but fight back against the person!
The person is mostly delirious, so even though you're stronger, they would be easy work anyways. A few swift jabs, and the crazed person is down. You leave them alone afterwards. Maybe you can try again later.
{ advance_dog()}
+ [Go back to the entrance] -> lit_bridge

==person_2_help==
~bandages = bandages - 1
~people_helped = people_helped + 1
Even though they're quite violent, you recognize that it's probably their method of defense. You pull a bandage out of your bag. "Don't worry, I can help!", you say.
The person, still a bit crazed, mumbles and grabs the bandages. 
Your health is at {health}, and in your backpack you have {flashlight} flashlight and {bandages} bandage(s). You have rescued {people_helped} person(s).
{ advance_dog()}
+ [Go back up to the bridge's surface] ->highway_bridge

==broken_building==
You keep going, and your walking eventually leads to an abandoned skyscraper. You're about to keep walking past, when...
BOOM!
A huge explosion erupts from one of the lower floors of the building! You hear the top of the building begin to come crashing down, and a loud scream!
You need to act, fast!!
{ advance_dog()}
+ [Run in] -> person_3_save

==person_3_save==
You deem the situation too dangerous for {pet_name}, so you have him stay until you get back.
Going as fast as you can, you climb to the third floor and immediately, you smell gas, most likely the culprit of the explosion. You see a small figure in the corner.
It's a little boy, and he's covered in burns. You swiftly pick him up, and just as you're about to go back down the stairs, the corner's roof collapses, blocking the stairwell.
+ [Jump out of the window!] ->person_3_help

==person_3_help==
~bandages = bandages - 1
~people_helped = people_helped + 1
Your only option is to jump through the window! You hurt your ankle a little on the landing, but you made it out! {pet_name} greets you with a chirp.
The kid is crying from both fear and the burn injuries. While {pet_name} distracts him, you tend to his injuries. 
Your health is at {health}, and in your backpack you have {flashlight} flashlight and {bandages} bandage(s). You have rescued {people_helped} person(s).
{ advance_dog()}
+ [Talk to him to help calm him] -> prereq_hq

==prereq_hq==
You talk to the kid for a bit, and learn that he's from the mountains nearby, but came to the city in search of food. After a bit more talking and petting {pet_name}, he's calmed down. 
You have food back at your headquarters, why not help the kid out?
{ advance_dog()}
+ [Head over to HQ] -> hq

==hq==
It's a bit of a walk, but you make it to your headquarters. It's a large, round building in the center of the city. You reside there along with some friends, as you all plan way to take back the world. 
You briefly introduce the boy to everyone, before fixing him with some food and sending him on his way.
{ advance_dog()}
...
You spot your long-time friend in the opposite side of the planning room, hunched over a blueprint.

"Hey."

->END