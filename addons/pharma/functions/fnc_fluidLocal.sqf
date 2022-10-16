#include "script_component.hpp"
/*
 * Author: 2LT.Mazinski
 * Locally changes a patient's PH value
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: PH Value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 10] call aceP_circulation_fnc_coagulationLocal;
 *
 * Public: No
 */

params ["_patient", "_ph", "_coagulation"];

private _current = _patient getVariable [QGVAR(pH), 1500];
private _final = (_current + _ph) max 0;
_final min 1500;
_patient setVariable [QGVAR(pH), (_final), true];

private _factor = _patient getVariable [QGVAR(coagulationFactor), 10];
private _final2 = (_factor + _coagulation) min 30;
_patient setVariable [QGVAR(coagulationFactor), (_final2), true];
