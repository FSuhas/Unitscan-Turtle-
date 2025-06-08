# unitscan_turtle

[Unitscan](https://github.com/FSuhas/Unitscan-Turtle-) modifié pour [Turtle WoW](https://turtle-wow.org/).

## Description

Cette version étend [unitscan-vanilla](https://github.com/FSuhas/Unitscan-Turtle-) en gérant automatiquement les cibles de scan actives ([zone targets](https://github.com/GryllsAddons/unitscan-turtle/blob/master/zonetargets.lua)) lors de l'entrée dans une zone.

La liste des [zone targets](https://github.com/GryllsAddons/unitscan-turtle/blob/master/zonetargets.lua) inclut tous les mobs rares de Vanilla par défaut.

L’addon est orienté leveling et mode [hardcore](https://turtle-wow.org/#/hardcore-mode), ce qui se reflète dans la sélection des cibles par zone.

Vous pouvez ajouter des cibles personnalisées (joueurs ou mobs non listés dans les zone targets) via la commande `/unitscan *nom*`.

Unitscan scanne uniquement les cibles spécifiques à votre zone actuelle. La liste des cibles est rechargée à chaque changement de zone.

Les zone targets sont rechargées 90 secondes après la détection d’une cible (pour permettre de re-détecter les cibles errantes).

L’addon vous alerte pour les PNJ attaquables et vivants, ainsi que toujours pour les cibles joueurs.

**Unitscan suspend le scan quand vous êtes en combat ou quand les attaques automatiques, tir automatique, ou wanding sont activés.**

Le cadre unitscan peut être déplacé en maintenant la touche Ctrl et en le glissant.

**Note : unitscan-turtle ne cible pas automatiquement la cible détectée.**  
Cliquez sur la cible dans la fenêtre unitscan ou utilisez la macro `/unitscantarget` pour cibler le mob.

## Compatibilité Addon

Unitscan utilise la fonction [TargetByName](https://wowpedia.fandom.com/wiki/API_TargetByName) qui peut changer la cible actuelle si la cible scannée est proche. Unitscan restaure immédiatement votre cible originale, mais certains addons qui réagissent au changement de cible (alertes PvP, etc.) peuvent être déclenchés.

## Commandes

- `/unitscan` : Affiche la liste des mobs de la zone.  
- `/unitscan on` : Active l’addon.  
- `/unitscan off` : Désactive l’addon.  
- `/unitscan help` : Affiche l’aide et la liste des commandes disponibles.   
- `/unitsound 1, 2 ou 3` : Choisit le son d’alerte ou affiche le son actuel.

## Mise à jour des Zone Targets

La liste des cibles provient de Classic.  
Merci de [créer une issue](https://github.com/FSuhas/Unitscan-Turtle-/issues) pour proposer l’ajout de cibles Turtle WoW manquantes, ou d’autres cibles dangereuses ou importantes.

## Note sur l’icône Skull (marque de raid)

Si l’addon [SuperWoW](https://github.com/balakethelock/SuperWoW) est installé et actif, **unitscan-turtle** utilise une fonction spécifique pour poser automatiquement l’icône de raid « Skull » (marque raid numéro 8) sur la cible détectée, même si vous n’êtes pas en groupe ou raid.

Cela améliore la visibilité de la cible rare sans nécessiter d’appartenir à un groupe, grâce à une intégration avec SuperWoW qui étend la gestion des icônes de raid.

Si SuperWoW n’est pas installé, l’icône sera posée uniquement lorsque vous êtes dans un groupe ou raid, selon le comportement standard de World of Warcraft Vanilla.
