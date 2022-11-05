---
title: "Debunking the Kubie \"energy saving device\""
subtitle: ""
author: "JorisL"
author-url: 'https://blog.jorisl.nl'
date: "2021-08-22"
---

Last week someone asked me to take a look if this
[\"energy saving device\"](https://www.pq-eu.com/kubie-producten/series-home/)
from Power Quality Europe could be an option for their house. This device, the
Kubie, is a device which in the words of its manufacturer saves a minimum of 8%
and up to 20% on your electricity bill.

When I got the brochure in my hands I quickly noticed
[a familiar scent](https://youtu.be/jNIyfWEsB20), and with a quick glance trough
the brochure the manufacturer couldn\'t convince me otherwise.

So let\'s find out why...

# What is the Kubie

![Kubie](../img/debunk-kubie/kubie.png)

Within Europe the mains voltage is specified as being 230VAC+10%/-6%, which
means the voltage is allowed to be anywhere between 216V and 253V. Most devices
however can handle slightly lower voltages, for example between 207V and 253V.
Or in the case of devices with a switch mode power supply anywhere between 90V
and 250V (which means that they, for example, also can be used in the US without
any modifications).

The Kubie is, in practice, a glorified transformer which is placed directly
behind the main circuit breaker of your house. This device outputs a 218-220V
voltage for all appliances in your home, independent of the tolerances of the
mains voltage supplied to your house, and the idea behind this device is that,
by Ohm\'s law, devices will use less current with this device installed since
the voltage to that device is limited, and therefore also will use less power.

The following example calculation is given on their
[website](https://www.pq-eu.com/bespaar-met-lagere-spanning/):

A 230V, 2000W device has a resistance of $\frac{230[V]^2}{2000[W]} =
26.45[\Omega]$.

When the voltage is reduced to 218V it will consume
$\frac{218[V]^2}{26.45[\Omega]} = 1797[W]$

The power saving is therefore $1 - \frac{1797[W]}{2000[W]} \cdot 100 \% \approx
10.2\%$

A second calculation, but now with a 240V mains reference voltage results in an
apparent saving of $1 - \frac{1797[W]}{(\frac{240[V]^2}{26.45[\Omega]})} \cdot
100 \% \approx 17.5\%$.

remark: the percentages on the site are slightly different since they further
calculate the savings into Euro\'s, which after rounding down to cents adds some
rounding errors.

In the example they do correctly mention that multiple factors will influence
the actual amount saved, but in their words

> \"...but this calculation example gives a good view of the possible
> savings...\"

which people will likely interpret as it being a realistic example (which it
isn\'t).

# Their claims

Translated from their brochure:

> \"Depending on the new voltage level and the used equipment, a total power
> saving between 10 and 20% will be realized!\"

Later on in their brochure they made return of interest calculations for several
types of houses, where they assume this device saves 13.8% of the total power
consumption in that house.

# Validating their claims

In order to check their claims I want to look at 2 things:

1. On which devices it actually can have an energy-saving effect.
2. Power consumption of the Kubie.

## Effected devices

First of all, lets take a look on which devices this technique could and will
not work. Roughly speaking a device can fall in one of two categories:

- constant-impedance
- constant-power

With constant-impedance devices the current draw decreases when the voltage
decreases, according to Ohms law. These are mostly devices where a
power-consumer, such as a motor or heater, are directly connected to the mains
power. Examples include:

- heater
- electric stove
- fridge
- incandescent lights

These devices can often be recognized by only working on a small range of input
voltages (e.g. 230V`\plusmn10`{=latex}%) or having a voltage selection switch.

Constant-power devices often have a switch-mode power supply, or similar, and
these devices practically consume as much current as the electronics behind the
power supply requires, independent on the voltage. These devices can therefore
often be recognized by being able to work on a wide range of input voltages
(e.g. 90V-250V). Examples include:

- TV
- Computer
- Phone charger
- LED lights
- Electric car charger

Lowering the supply voltage to a constant-power device practically doesn\'t have
any effect on it\'s power usage, since it automatically draws more current to
compensate for the power loss.

Lowering the supply voltage to a constant-impedance device does influence the
_instantaneous_ power draw, but more often than not it doesn\'t have any effect
on your electricity bill. The reason is that most of these devices are have a
control-loop.

Take, for example, an electric heater. Let\'s assume it tries to keep a room at
a set temperature, and the room looses heat to the outside at a rate of 100W.
E.g. the heater needs to provide an average power of 100W to keep the room at
the set temperature. When the heater is able to supply 1000W, then it will be on
for $\frac{100[W]}{1000[W]} = 10\%$ of the time. When the heater is only able to
supply 800W, for example by lowering its supply voltage, then it will be on for
$\frac{100[W]}{800[W]} = 12.5\%$ of the time. In practice it just doesn\'t
matter how much the heaters instantaneous power is, what counts is the average
power it needs to keep the room at temperature.

Another example is an electric kettle. The kettle needs a certain amount of
energy to boil a certain amount of water, and in practice it doesn\'t matter if
it is heated by a 1500W or 2000W kettle. The larger-power kettle does its job in
a shorter amount of time, and they practically both use the same amount of
energy (power × time) to bring the same amount of water to a boil.

Practically all devices that heat or cool something work this way, so the Kubie
also doesn\'t have any practical effect on:

- Fridges
- Electric heaters
- Coffee machines
- Air-conditioners
- Electric irons
- etc.

It also doesn\'t have effect on _part of_ the power draw from devices which both
heat and have motors/pumps, such as:

- Dishwashers
- Washing machines
- Clothes dryers

And finally there are also devices which don\'t have a build-in
[controller](https://simple.wikipedia.org/wiki/Control_system), but where, in
practice, the user acts as the controller. One example of this is a vacuum
cleaner. In principle the power it draws depends on the input voltage, but also
on the suction power dial on the vacuum itself. So:

- When the input power of the vacuum is lowered, the user can turn the dial up
  to increase the suction power back again (up to a limit), and
- The user can dial down the vacuum for less power use for the cost of less
  suction power.

Another example is a hair dryer, where the user chooses its power and duration,
until its task is performed. And lowering the maximum power to the device
doesn\'t change that much on the overall energy usage; it is just used until it
has provided enough energy to dry hair, which takes longer with lower power.

So, what percentage of electricity use is actually positively influenced by the
Kubie? Let\'s use [this](https://www.eia.gov/tools/faqs/faq.php?id=96&t=3) table
from the U.S. Energy Information Administration as baseline[^1]:

End use Share of total Energy saved by lowering supply voltage?

| End use                                   | Share of total | Energy Saved By Lowering Supply Voltage? |
| ----------------------------------------- | -------------: | ---------------------------------------: |
| Space cooling                             |            16% |                                       No |
| Space heating                             |            15% |                                       No |
| Water heating                             |            12% |                                       No |
| Refrigeration                             |             6% |                                       No |
| Clothes dryers                            |             5% |                                   Partly |
| Lighting                                  |             4% |                 No (assuming LED lights) |
| Televisions and related equipment         |             4% |                                       No |
| Computers and related equipment           |             2% |                                       No |
| Furnace fans and boiler circulation pumps |             2% |                                      Yes |
| Freezers                                  |             1% |                                       No |
| Cooking                                   |             1% |                                   No[^2] |
| Clothes washers                           |             1% |                                   Partly |
| Dishwashers                               |             1% |                                   Partly |
| Other uses                                |            31% |                                  Depends |

So we can see that, by far, most of the electric energy used in a household will
not be influenced at all by lowering the mains voltage. All by all I would be
very surprised if more than 10% of the energy used in a household can actually
be influenced by this device. So, if we assume the nominal mains voltage is
230V, and the device saves 10.2% _on the 10% of devices it actually has effect
on_, then this device will only save 1% of total energy usage.

Its effect will even get less significant in the future, as more power will be
drawn by unaffected devices:

- Electric cars get more and more common.
- Use of natural gas will decline, and therefore more people will use electric
  heating and cooking.
- The number of air-conditioners in Europe rising due to climate change.

## Power consumption of the Kubie itself

Like mentioned before: the Kubie is practically just a transformer, and like
with each transformer it doesn\'t have a 100% efficiency.

The data-sheet in the brochure states that the power loss in the device at
zero-load is 23W. Note that, in comparison to a lot of other devices in your
home, this device is on 24/7. Given that the average yearly power consumption of
a household is $3500[kWh]$ [^3], these losses already account for an _added_
$\frac{23[W] \cdot 1[yr]}{3500[kWh]} \approx 5.6 \%$ on the total household
power consumption.

This is even without taking into account other additional power losses caused by
the device, such as:

- The load-dependent power losses of the device itself.
- Wiring power losses due to higher current consumption of constant-power
  devices.

# Bottom line

The story given by the company on their website and in their brochure pains a
nice picture, where:

- All calculations seem to assume that all devices benefit from a lower supply
  voltage.
- The device only saves power, but doesn\'t consume power itself.

Both assumptions are plain false, and the manufacturer **should** know this.

They do mention that, certain types of devices, will not benefit from this
device, but they fail to mention that it is by far the majority of devices which
will not benefit. They also do give the efficiency values of their device
(although difficult to find), but other than those 2 rows (out of 33 in the
data-sheet) they keep these efficiency losses out of all their calculations.

The calculations the company provides in their return-of-interest calculations
assume 13.8% power saving. In their claims this is the average power savings by
100 customers. This is already more than the saving of \'an ideal\' (for them)
device being powered from the Kubie instead of 230V (which results in a 10.2%
lower power draw). My gut feeling, however, is that they just asked 100
customers what their mains voltage was (which would in this case be in the 235V
range), used that voltage, and calculated as if each single device is positively
effected by this device, and didn\'t take into account the efficiency losses in
the device itself.

If we actually take a look at our calculations, where we do take into account
that most devices do not benefit and that the Kubie itself isn\'t 100%
efficient, we see that:

- The energy saved in other appliances by this device is somewhere in the 1%
  range of total household energy consumption, if not lower.
- The efficiency power losses from the device itself are, at least, 5.6% of
  total household energy consumption[^4].

This rough estimation therefore shows that this device doesn\'t save power, but
_adds_ an additional $5.6\% - 1\% = 4.6\%$ to your total energy bill. Quite the
change from their _\"Depending on the new voltage level and the used equipment,
a total power saving between 10 and 20% will be realized!\"_ claim.

If we then calculate further, based on the same $0.26\frac{€}{kWh}$ energy price
and $0.572\frac{kg}{kWh}$ CO2 emission factor they use in their return of
investment calculations, we see that, by having this device installed, your
annual bill goes up by an average of:

$3500[\frac{kWh}{yr}] \cdot 4.6[\%] \cdot 0.26[\frac{€}{kWh}] \approx
42[\frac{€}{yr}]$

and you will cause an average of:

$3500[\frac{kWh}{yr}] \cdot 4.6[\%] \cdot 0.572[\frac{kg}{kWh}] \approx
90[\frac{kg}{yr}]$

of CO2 to be generated in the atmosphere.

And that all for a bit more more than €600 to actually have that device
installed in your home[^5].

# Closing words

Personally I\'m getting sick and tired of these kinds of snake-oil companies
who, either by malice or just gross incompetence, try to sell stuff under the
flag of \"green energy\", \"power saving\", etc.. More often than not these
devices do more harm than good, and this device also seems to be one of the
latter ones.

In effect you could say that these kinds of companies are actively working
against the environment, since all they seem to do is:

- selling junk that doesn\'t benefit the environment at all, and more often than
  not does the opposite.
- taking away money people have budgeted for energy saving improvement, causing
  them to not have that money available to make change that actually _are_
  beneficial for the environment.

So what did this company already caused? Apparently they already sold 1300 of
these devices[^6]. Assuming each of these units now has been running for 3 years
on average, then by just having these units installed they already caused in the
range of

$90[\frac{kg}{yr}] \cdot 3[yr] \cdot 1300 \approx 0.35\cdot10^6[kg]$

of CO2 to be emitted in the air. Let that sink in; roughly 350 metric tonnes of
CO2. And let\'s not even talk about what they will eventually have caused over
the manufacturers claimed 40 year lifetime...

And for all people who still want to have some kind of \"whizzbang magical black
magic woo-woo device\" in their home to save power: During a tear-down of a
device strikingly similar in function our great friend BigClive proposed to just
install his
[Energy Saver 300+](https://www.youtube.com/watch?v=zKasA4HxaGY&t=1265s). It\'s
way cheaper, and likely a lot better for the environment, than this pile of
garbage.

[^1]: Some percentages will differ between the US and the Netherlands.
Air-conditioning is, for example, a lot less present in Dutch households. But
this was the best data I could find about the share of power between different
household appliances.

[^2]: Assuming the user can actually cook, and doesn\'t just continuously put
the furnace on full power.

[^3]: <https://www.engie.nl/product-advies/gemiddeld-energieverbruik/gemiddeld-stroomverbruik>

[^4]: Yes, in principle the heating of this device can cause the heaters in your
house to work less, but A: part of the time you don\'t want to have your house
heated but cooled, and B: in practice it requires more energy to extract heat
from somewhere than it is to heat it. Let\'s just assume therefore that the heat
energy added by this device doesn\'t change the overall average energy use.

[^5]: €479 unit cost + €135 installation cost.

[^6]: <https://www.deondernemer.nl/innovatie/henk-dinkelaar-kubie-tuv-stroom-laag-energieverbruik~3212970>
