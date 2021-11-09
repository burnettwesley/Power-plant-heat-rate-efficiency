log using final_regression_analysis_2011_2016, replace

set linesize 200

use final_data_2011_2016.dta

/* ------------- */
/* CO2 Emissions */
/* ------------- */

* Panel data regression of the level of co2 on the heat rate and other control variables; absorbing on state-level effects

eststo: areg ln_co2 ln_heat_rate coal nat_gas petrol nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9, absorb(state) vce(robust)
eststo: areg ln_co2 ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9, absorb(state) vce(robust)
eststo: areg ln_co2 ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5, absorb(nerc) vce(robust)
eststo: areg co2_rate ln_heat_rate coal nat_gas petrol nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9 if co2_rate < 232, absorb(state) vce(robust)
eststo: areg co2_rate ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9 if co2_rate < 232, absorb(state) vce(robust)
eststo: areg co2_rate ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5 if co2_rate < 232, absorb(nerc) vce(robust)

esttab using co2.tex, title(Carbon dioxide emissions) se replace

eststo clear

* Scatter plot diagram in which errors are averaged across 20 separate bins

binscatter ln_co2 ln_heat_rate if ln_heat_rate < 10.5, controls(summer_cap coal) name(ln_co2_plot)


* Scatter plot diagram in which errors are averaged across 20 separate bins

binscatter co2_rate ln_heat_rate if ln_heat_rate < 11, controls(summer_cap coal) name(co2_rate_plot)


/* ----------------- */
/* Methane Emissions */
/* ----------------- */

* Panel data regression of the level of co2 on the heat rate and other control variables; absorbing on state-level effects

eststo: areg ln_methane ln_heat_rate coal nat_gas petrol nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9, absorb(state) vce(robust)
eststo: areg ln_methane ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9, absorb(state) vce(robust)
eststo: areg ln_methane ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5, absorb(nerc) vce(robust)
eststo: areg methane_rate ln_heat_rate coal nat_gas petrol nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9 if methane_rate < 1, absorb(state) vce(robust)
eststo: areg methane_rate ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9 if methane_rate < 1, absorb(state) vce(robust)
eststo: areg methane_rate ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5 if methane_rate < 1, absorb(nerc) vce(robust)

esttab using ch4.tex, title(Methane emissions) se replace

eststo clear

* Scatter plot diagram in which errors are averaged across 20 separate bins

binscatter ln_methane ln_heat_rate if ln_heat_rate < 10.5, controls(summer_cap) name(ln_methane_plot)

* Scatter plot diagram in which errors are averaged across 20 separate bins

binscatter methane_rate ln_heat_rate if ln_heat_rate < 11, controls(summer_cap) name(methane_rate_plot)


/* ------------- */
/* NOx Emissions */
/* ------------- */


* Panel data regression of the level of co2 on the heat rate and other control variables; absorbing on state-level effects

eststo: areg ln_nox ln_heat_rate coal nat_gas petrol nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9, absorb(state) vce(robust)
eststo: areg ln_nox ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9, absorb(state) vce(robust)
eststo: areg ln_nox ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5, absorb(nerc) vce(robust)
eststo: areg nox_rate ln_heat_rate coal nat_gas petrol nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9 if nox_rate < 1, absorb(state) vce(robust)
eststo: areg nox_rate ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5 nerc2-nerc9 if nox_rate < 1, absorb(state) vce(robust)
eststo: areg nox_rate ln_heat_rate coal nat_gas petrol chp own nameplate summer_cap winter_cap yr1-yr5 if nox_rate < 1, absorb(nerc) vce(robust)

esttab using nox.tex, title(Nitrogen oxide emissions) se replace

eststo clear

* Scatter plot diagram in which errors are averaged across 20 separate bins

binscatter ln_nox ln_heat_rate if ln_heat_rate < 10.5, controls(summer_cap coal) name(ln_nox_plot)

* Scatter plot diagram in which errors are averaged across 20 separate bins

binscatter nox_rate ln_heat_rate if ln_heat_rate, controls(summer_cap coal) name(nox_rate_plot)

log close
