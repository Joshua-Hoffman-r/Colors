#!/bin/bash

#    _________________________________________________________________________________________________
#   |* ___________________________________________GPL-3_Licence_____________________________________ *|
#   | /                                                                                             \ |
#   | |         This program is free software: you can redistribute it and/or modify                | |
#   | |         it under the terms of the GNU General Public License as published by                | |
#   | |         the Free Software Foundation, either version 3 of the License, or                   | |
#   | |         (at your option) any later version.                                                 | |
#   | |                                                                                             | |
#   | |         This program is distributed in the hope that it will be useful,                     | |
#   | |         but WITHOUT ANY WARRANTY; without even the implied warranty of                      | |
#   | |         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                       | |
#   | |         GNU General Public License for more details.                                        | |
#   | |                                                                                             | |
#   | |         You should have received a copy of the GNU General Public License                   | |
#   | |         along with this program.  If not, see <http://www.gnu.org/licenses/>.               | |
#   | |                                                                                             | |
#   | \_____________________________________________________________________________________________/ |
#   |* _________________________________________Colors_5/2/2020_____________________________________ *|
#   | /                                                                                             \ |
#   | |                                    Written by: Joshua Hoffman                               | |
#   | |                                 joshua.hoffman.ray@protonmail.com                           | |
#   | |                                                                                             | |
#   | \________________________________________Modulation_Project___________________________________/ |
#   |_________________________________________________________________________________________________|
#


Colors () {

declare -Ag Canvis Color
Portfolio=( "$(echo "$(dirname "$(realpath $0)")/$0")" $@ )

	for Item in ${Portfolio[@]}; do

	Colors=(
	[1]="$(echo ${Item%/*})"
	[2]="$(cat $Item)"
	[3]="$(wc -c $Item)"
	[4]="$(wc -w $Item)"
	[5]="$(wc -l $Item)" )

	declare -Ag Color[{1..5}]=$(echo ${Color[$((A++))]} | sha256sum | awk '{print substr($1, 1, 32)}' )

		for Rain in ${Color[@]}; do
		export Shade=${Rain}${Shade}
		export Purple=$((Purple+${#Rain}))
		done

	Blend=( $( seq 1 $Purple | sort -R ) )

		for Stroke in ${Blend[@]} 0; do
		Canvis[${Stroke}]=${Shade:${Stroke}:1}
		unset Hue
		done

	done

}

Colors $@
