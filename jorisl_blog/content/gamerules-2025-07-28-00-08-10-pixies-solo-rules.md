---
title: "Pixies solo rules"
date: 2025-07-28
tags: ["rules", "solitaire"]
description: "Solo rules for the card game Pixies."
---
# Pixies Solo Rules

_These rules are based on the [Breeze solo mode by Michiel de Wit](https://boardgamegeek.com/thread/3282756/2024-solomode-breeze)._

## Overview

In this solo mode, you play a 2-player game against a bot.
As normal, 3 rounds are played, each with different scoring for connected zones.
The bot doesn't make a 3x3 area, but gathers cards in a single pile, with its own scoring rules.

From the players perspective, the round sequence is the same as for a normal 2 player game,
except for the 4 cards being drafted must be put from left-to-right when revealed.

A round ends when the player has no open slots left over.

## Bot turn

During the bot's turn:

1. Take the card with the highest number from the drafting pool, with the leftmost card winning ties.
2. If there are still 2 or 3 cards left in the drafting pool, put the taken card face up on the bot's pile.
   Otherwise discard the card face-down in a discard pile.

## Bot scoring

Go through the bot's (face up) pile, and calculate the score as follows:

- Add up all card values, as if all cards where validated.
- Add up all positive and negative points printed on the cards as normal.
- See what color the bot has most (taking multi-colored cards into account),
  and calculate the largest color zone (2, 3, or 4 points per card, depending on round) as if these cards where all connected.