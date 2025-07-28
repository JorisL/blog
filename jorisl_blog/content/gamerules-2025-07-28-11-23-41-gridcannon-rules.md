---
title: "Gridcannon rules"
date: 2025-07-28
tags: ["rules", "solitaire", "standard 52-card deck"]
description: "Rules for the card game Gridcannon."
---
# Gridcannon rules

_Rules taken from [here](https://www.pentadact.com/2019-08-20-gridcannon-a-single-player-game-with-regular-playing-cards/#Update)_

## Setup

1. Start with a shuffled deck, including jokers.
2. With the deck face-down, draw cards from the top and lay them out face-up in a 3×3 grid. If you draw any royals, aces or jokers during this, put them on a separate pile and keep drawing til you have made the grid of just number cards.
3. If you did draw some royals, you now place them the same way we will when playing: put it outside the grid, adjacent to the grid card it is most similar to. ‘Most similar’ means:
    1. Highest value card of the same suit
    2. If none, highest value card of the same color
    3. If none, highest value card
    4. If there is a tie, or most similar card is on a corner, you can choose between the equally valid positions
4. Any aces and jokers you drew during set up, keep them face-up to one side. These are Ploys you can play whenever you like, rules below.
5. Once you have a 3×3 grid of number cards, you may choose one to replace if you like: put it on the bottom of the draw pile and draw a new card to replace it.

## The goal

Find and kill all the royals.

## Play

Draw the top card from the deck.

- **If it is a royal:** use placement rule above.
- **If it has value 2-10:** you must place it on the grid. It can go on any card with the same or lower value, regardless of suit.
- **If it is an ace or joker:** keep it to one side, see **Ploys**.

**Killing royals:** if you are able to place a card on the grid opposite a royal – so there are two cards between – those two cards **Attack** the royal.
The sum of their values must be at least as much as health of the royal to kill them:
if it is not, you can still place the card, but the royal is unaffected.
The value of the card you just placed is not part of the Attack, only the two between.

- **Jacks:** 11 health. The cards Attacking can be any suit.
- **Queens:** 12 health. The cards Attacking must match the color of the queen to count.
- **Kings:** 13 health. The cards Attacking must match the suit of the king to count.

If you killed the royal, turn it face down but don't remove it – new royals you draw still cannot be placed in that spot.
Once every spot around the grid has a dead royal in it (12 total) you have won.

**Ploys:**

- **Aces are Extractions:** at any time you can use up one of the aces you have drawn to pick up one stack of cards from the grid and put them face-down at the bottom of your draw pile. You can do this even after drawing a card and before placing it. Turn the ace face-down to remember you have used it.
- **Jokers are Reassignments:** at any time you can use up one you have drawn to move the top card of one stack on the grid to another position. The place you move it to must be a valid spot to play the card, and placing it can trigger an Attack the same way a normal play can. Turn the joker face-down to remember you have used it.

**If you cannot place a card:** and you have no Ploys to use, you must add the card as **Armour** to the royal it is most similar to (lowest value royal of same suit, failing that lowest of same color, etc). It increases their health by the value of the card. So a King with a 3 as armor now has 13 + 3 = 16 health. You can add armor to a royal that already has armor – it stacks. If a royal ends up with 20+ health (or 19+ for a King), that is a natural loss as there is no longer any way to kill them.

**If there are no living royals on the table:** if every spot around the grid has a dead royal on it – all 12 – you have won! If not, just keep drawing cards until you find a royal, placing the cards in a face-up pile as you go. Once you find a royal, place it, then add the cards you cycled through to the bottom of your deck.

**If the draw pile runs out:** and you have not killed all the royals, use any ploys you have left to fix the situation if you can. If you are out of both cards and ploys and not all royals are dead, you have lost.

## Scoring

If you have killed all the royals without running out of cards, your score is how many Ploys you have left unspent.
So the maximum score is 6.
