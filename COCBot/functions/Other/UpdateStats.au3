; #FUNCTION# ====================================================================================================================
; Name ..........: UpdateStats
; Description ...: This function will update the statistics in the GUI.
; Syntax ........: UpdateStats()
; Parameters ....: None
; Return values .: None
; Author ........: kaganus (2015-jun-20)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......:
; ===============================================================================================================================

Func UpdateStats()
	Local Static $iAttackedCountStatic = 0, $iOldAttackedCount = 0
	Local Static $iOLDGoldCurrentStatic[9] , $iOLDElixirCurrentStatic[9] , $iOLDDarkCurrentStatic[9] , $iOLDTrophyCurrentStatic[9]  ; current stats
	Local Static $iOldFreeBuilderCount[9], $iOldTotalBuilderCount[9], $iOldGemAmount[9] ; builder and gem amounts
	Local Static $iOldGoldTotal[9], $iOldElixirTotal[9], $iOldDarkTotal[9], $iOldTrophyTotal[9] ; total stats
	Local Static $iOldGoldLast[9], $iOldElixirLast[9], $iOldDarkLast[9], $iOldTrophyLast[9] ; loot and trophy gain from last raid
	Local Static $iOldGoldLastBonus[9], $iOldElixirLastBonus[9], $iOldDarkLastBonus[9] ; bonus loot from last raid
	Local Static $iOldSkippedVillageCount[9], $iOldDroppedTrophyCount[9] ; skipped village and dropped trophy counts
	Local Static $iOldCostGoldWall[9], $iOldCostElixirWall[9], $iOldCostGoldBuilding[9], $iOldCostElixirBuilding[9], $iOldCostDElixirHero[9] ; wall, building and hero upgrade costs
	Local Static $iOldNbrOfWallsUppedGold[9], $iOldNbrOfWallsUppedElixir[9], $iOldNbrOfBuildingsUppedGold[9], $iOldNbrOfBuildingsUppedElixir[9], $iOldNbrOfHeroesUpped[9] ; number of wall, building, hero upgrades with gold, elixir, delixir
	Local Static $iOldSearchCost[9], $iOldTrainCostElixir[9], $iOldTrainCostDElixir[9] ; search and train troops cost
	Local Static $iOldNbrOfTHSnipeFails[9], $iOldNbrOfTHSnipeSuccess[9] ; number of fails and success while TH Sniping
	Local Static $iOldGoldFromMines[9], $iOldElixirFromCollectors[9], $iOldDElixirFromDrills[9] ; number of resources gain by collecting mines, collectors, drills
	Local Static $iOldAttackedVillageCount[9][$iModeCount + 1] ; number of attack villages for DB, LB, TB, TS
	Local Static $iOldTotalGoldGain[9][$iModeCount + 1], $iOldTotalElixirGain[9][$iModeCount + 1], $iOldTotalDarkGain[9][$iModeCount + 1], $iOldTotalTrophyGain[9][$iModeCount + 1] ; total resource gains for DB, LB, TB, TS
	Local Static $iOldNbrOfDetectedMines[9][$iModeCount + 1], $iOldNbrOfDetectedCollectors[9][$iModeCount + 1], $iOldNbrOfDetectedDrills[9][$iModeCount + 1] ; number of mines, collectors, drills detected for DB, LB, TB

; Update Show Hide on First Run
	If $FirstRun = 1  Then
		;GUICtrlSetState($lblResultStatsTemp, $GUI_HIDE)
		GUICtrlSetState($lblVillageReportTemp, $GUI_HIDE)
		GUICtrlSetState($picResultGoldTemp, $GUI_HIDE)
		GUICtrlSetState($picResultElixirTemp, $GUI_HIDE)
		GUICtrlSetState($picResultDETemp, $GUI_HIDE)

		GUICtrlSetState($lblResultGoldNow, $GUI_SHOW + $GUI_DISABLE) ; $GUI_DISABLE to trigger default view in btnVillageStat
		GUICtrlSetState($picResultGoldNow, $GUI_SHOW)
		GUICtrlSetState($lblResultElixirNow, $GUI_SHOW)
		GUICtrlSetState($picResultElixirNow, $GUI_SHOW)
		If $g_iDarkCurrent[$CurrentAccount] <> "" Then
			GUICtrlSetState($lblResultDeNow, $GUI_SHOW)
			GUICtrlSetState($picResultDeNow, $GUI_SHOW)
		Else
			GUICtrlSetState($picResultDEStart, $GUI_HIDE)
			GUICtrlSetState($picDarkLoot, $GUI_HIDE)
			GUICtrlSetState($picDarkLastAttack, $GUI_HIDE)
			GUICtrlSetState($picHourlyStatsDark, $GUI_HIDE)
		EndIf
		GUICtrlSetState($lblResultTrophyNow, $GUI_SHOW)
		GUICtrlSetState($lblResultBuilderNow, $GUI_SHOW)
		GUICtrlSetState($lblResultGemNow, $GUI_SHOW)
		btnVillageStat("UpdateStats")

		; First Start Values

		$g_iGoldStart[$CurrentAccount] = $g_iGoldCurrent[$CurrentAccount]
		$g_iElixirStart[$CurrentAccount] = $g_iElixirCurrent[$CurrentAccount]
		$g_iDarkStart[$CurrentAccount] = $g_iDarkCurrent[$CurrentAccount]
		$g_iTrophyStart[$CurrentAccount] = $g_iTrophyCurrent[$CurrentAccount]

		GUICtrlSetData($lblResultGoldStart, _NumberFormat($g_iGoldStart[$CurrentAccount], True))
		GUICtrlSetData($lblResultElixirStart, _NumberFormat($g_iElixirStart[$CurrentAccount], True))
		GUICtrlSetData($lblResultTrophyStart, _NumberFormat($g_iTrophyStart[$CurrentAccount], True))

		If $g_iDarkStart[$CurrentAccount] <> "" Then
			GUICtrlSetData($lblResultDEStart, _NumberFormat($g_iDarkStart[$CurrentAccount], True))
		EndIf
		$FirstRun = 0
		GUICtrlSetState($btnResetStats, $GUI_ENABLE)
	EndIf

; Update Values of all Stats

	If $FirstAttack = 1 Then
		$FirstAttack = 2
	EndIf

;Update Stats Gain Tab
	;Update TH Lvl
	GUICtrlSetData($lblTHLevels, "")
	_GUI_Value_STATE("HIDE", $groupListTHLevels)
	If $debugSetlog = 1 Then Setlog("Select TH Level:" & Number($iTownHallLevel), $COLOR_DEBUG)
	GUICtrlSetState(Eval("THLevels" & Number($iTownHallLevel)), $GUI_SHOW)
	GUICtrlSetData($lblTHLevels, Number($iTownHallLevel))

	;Update League Lvl
		;Updated in AttackReport

	;StartWith
		;Updated Above Start Values only need one TimerDiff

	;Gain Per Hour
	If $FirstAttack = 2 Then
		GUICtrlSetData($lblHourlyStatsGold, _NumberFormat(Round($g_iGoldTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) & "K / h")
		GUICtrlSetData($lblHourlyStatsElixir, _NumberFormat(Round($g_iElixirTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) & "K / h")
		If $g_iDarkStart[$CurrentAccount] <> "" Then
			GUICtrlSetData($lblHourlyStatsDark, _NumberFormat(Round($g_iDarkTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600 * 1000)) & " / h")
		EndIf
		GUICtrlSetData($lblHourlyStatsTrophy, _NumberFormat(Round($g_iTrophyTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600 * 1000)) & " / h")
		;UPDATE PER HOUR STATS IN BOTTOM BAR
		GUICtrlSetData($lblResultGoldHourNow, _NumberFormat(Round($g_iGoldTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) & "K / h") ;GUI BOTTOM
		GUICtrlSetData($lblResultElixirHourNow, _NumberFormat(Round($g_iElixirTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) & "K / h") ;GUI BOTTOM
		If $g_iDarkStart[$CurrentAccount] <> "" Then
			GUICtrlSetData($lblResultDEHourNow, _NumberFormat(Round($g_iDarkTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600 * 1000)) & " / h") ;GUI BOTTOM
		EndIf
	EndIf

	; Total Gain
	If $iOldGoldTotal[$CurrentAccount] <> $g_iGoldTotal[$CurrentAccount] And ($FirstAttack = 2 Or $ResetStats = 1) Then
		GUICtrlSetData($lblGoldLoot, _NumberFormat($g_iGoldTotal[$CurrentAccount]))
		$iOldGoldTotal[$CurrentAccount] = $g_iGoldTotal[$CurrentAccount]
	EndIf

	If $iOldElixirTotal[$CurrentAccount] <> $g_iElixirTotal[$CurrentAccount] And ($FirstAttack = 2 Or $ResetStats = 1) Then
		GUICtrlSetData($lblElixirLoot, _NumberFormat($g_iElixirTotal[$CurrentAccount]))
		$iOldElixirTotal[$CurrentAccount] = $g_iElixirTotal[$CurrentAccount]
	EndIf

	If $iOldDarkTotal[$CurrentAccount] <> $g_iDarkTotal[$CurrentAccount] And (($FirstAttack = 2 And $g_iDarkStart[$CurrentAccount] <> "") Or $ResetStats = 1) Then
		GUICtrlSetData($lblDarkLoot, _NumberFormat($g_iDarkTotal[$CurrentAccount]))
		$iOldDarkTotal[$CurrentAccount] = $g_iDarkTotal[$CurrentAccount]
	EndIf

	If $iOldTrophyTotal[$CurrentAccount] <> $g_iTrophyTotal[$CurrentAccount] And ($FirstAttack = 2 Or $ResetStats = 1) Then
		GUICtrlSetData($lblTrophyLoot, _NumberFormat($g_iTrophyTotal[$CurrentAccount]))
		$iOldTrophyTotal[$CurrentAccount] = $g_iTrophyTotal[$CurrentAccount]
	EndIf

	;Last Attack
	If $iOldGoldLast[$CurrentAccount] <> $g_iGoldLast[$CurrentAccount] Then
		GUICtrlSetData($lblGoldLastAttack, _NumberFormat($g_iGoldLast[$CurrentAccount]))
		$iOldGoldLast[$CurrentAccount] = $g_iGoldLast[$CurrentAccount]
	EndIf

	If $iOldElixirLast[$CurrentAccount] <> $g_iElixirLast[$CurrentAccount] Then
		GUICtrlSetData($lblElixirLastAttack, _NumberFormat($g_iElixirLast[$CurrentAccount]))
		$iOldElixirLast[$CurrentAccount] = $g_iElixirLast[$CurrentAccount]
	EndIf

	If $iOldDarkLast[$CurrentAccount] <> $g_iDarkLast[$CurrentAccount] Then
		GUICtrlSetData($lblDarkLastAttack, _NumberFormat($g_iDarkLast[$CurrentAccount]))
		$iOldDarkLast[$CurrentAccount] = $g_iDarkLast[$CurrentAccount]
	EndIf

	If $iOldTrophyLast[$CurrentAccount] <> $g_iTrophyLast[$CurrentAccount] Then
		GUICtrlSetData($lblTrophyLastAttack, _NumberFormat($g_iTrophyLast[$CurrentAccount]))
		$iOldTrophyLast[$CurrentAccount] = $g_iTrophyLast[$CurrentAccount]
	EndIf

	;League Bonus
	If $iOldGoldLastBonus[$CurrentAccount] <> $g_iGoldLastBonus[$CurrentAccount] Then
		GUICtrlSetData($lblGoldBonusLastAttack, _NumberFormat($g_iGoldLastBonus[$CurrentAccount]))
		$iOldGoldLastBonus[$CurrentAccount] = $g_iGoldLastBonus[$CurrentAccount]
	EndIf

	If $iOldElixirLastBonus[$CurrentAccount] <> $g_iElixirLastBonus[$CurrentAccount] Then
		GUICtrlSetData($lblElixirBonusLastAttack, _NumberFormat($g_iElixirLastBonus[$CurrentAccount]))
		$iOldElixirLastBonus[$CurrentAccount] = $g_iElixirLastBonus[$CurrentAccount]
	EndIf

	If $iOldDarkLastBonus[$CurrentAccount] <> $g_iDarkLastBonus[$CurrentAccount] Then
		GUICtrlSetData($lblDarkBonusLastAttack, _NumberFormat($g_iDarkLastBonus[$CurrentAccount]))
		$iOldDarkLastBonus[$CurrentAccount] = $g_iDarkLastBonus[$CurrentAccount]
	EndIf

	;Top Loot
	If Number($g_iGoldLast[$CurrentAccount]) > Number($topgoldloot) Then
		$topgoldloot = $g_iGoldLast[$CurrentAccount]
		GUICtrlSetData($lbltopgoldloot, _NumberFormat($topgoldloot))
	EndIf

	If Number($g_iElixirLast[$CurrentAccount]) > Number($topelixirloot) Then
		$topelixirloot = $g_iElixirLast[$CurrentAccount]
		GUICtrlSetData($lbltopelixirloot, _NumberFormat($topelixirloot))
	EndIf

	If Number($g_iDarkLast[$CurrentAccount]) > Number($topdarkloot) Then
		$topdarkloot = $g_iDarkLast[$CurrentAccount]
		GUICtrlSetData($lbltopdarkloot, _NumberFormat($topdarkloot))
	EndIf

	If Number($g_iTrophyLast[$CurrentAccount]) > Number($topTrophyloot) Then
		$topTrophyloot = $g_iTrophyLast[$CurrentAccount]
		GUICtrlSetData($lbltopTrophyloot, _NumberFormat($topTrophyloot))
	EndIf

; Stats Tab Misc
	;Section Run
		;runtime - updated in func settime
		;Nbr Of Oos Left as a total/ Not per Account
		If $iOldNbrOfOoS <> $iNbrOfOoS Then
			GUICtrlSetData($lblNbrOfOoS, $iNbrOfOoS)
			$iOldNbrOfOoS = $iNbrOfOoS
		EndIf

		;Attacked Per Account
			;Updated In updateStats in the section attack

		;Skipped Per Account
		If $iOldSkippedVillageCount[$CurrentAccount] <> $g_iSkippedVillageCount[$CurrentAccount] Then
			GUICtrlSetData($lblresultvillagesskipped, _NumberFormat($g_iSkippedVillageCount[$CurrentAccount], True))
			GUICtrlSetData($lblResultSkippedHourNow, _NumberFormat($g_iSkippedVillageCount[$CurrentAccount], True))
			$iOldSkippedVillageCount[$CurrentAccount] = $g_iSkippedVillageCount[$CurrentAccount]
		EndIf

		;Dropped Trophies Per Account
		If $iOldDroppedTrophyCount[$CurrentAccount] <> $g_iDroppedTrophyCount[$CurrentAccount] Then
			GUICtrlSetData($lblresulttrophiesdropped, _NumberFormat($g_iDroppedTrophyCount[$CurrentAccount], True))
			$iOldDroppedTrophyCount[$CurrentAccount] = $g_iDroppedTrophyCount[$CurrentAccount]
		EndIf

	;Section Cost & Collect
		;Search Cost
		If $iOldSearchCost[$CurrentAccount] <> $g_iSearchCost[$CurrentAccount] Then
			GUICtrlSetData($lblSearchCost, _NumberFormat($g_iSearchCost[$CurrentAccount], True))
			$iOldSearchCost[$CurrentAccount] = $g_iSearchCost[$CurrentAccount]
		EndIf
		;Train Cost Elixir
		If $iOldTrainCostElixir[$CurrentAccount] <> $g_iTrainCostElixir[$CurrentAccount] Then
			GUICtrlSetData($lblTrainCostElixir, _NumberFormat($g_iTrainCostElixir[$CurrentAccount], True))
			$iOldTrainCostElixir[$CurrentAccount] = $g_iTrainCostElixir[$CurrentAccount]
		EndIf
		;Train Cost DElixir
		If $iOldTrainCostDElixir[$CurrentAccount] <> $g_iTrainCostDElixir[$CurrentAccount] Then
			GUICtrlSetData($lblTrainCostDElixir, _NumberFormat($g_iTrainCostDElixir[$CurrentAccount], True))
			$iOldTrainCostDElixir[$CurrentAccount] = $g_iTrainCostDElixir[$CurrentAccount]
		EndIf
		;Gold Collected
		If $iOldGoldFromMines[$CurrentAccount] <> $g_iGoldFromMines[$CurrentAccount] Then
			GUICtrlSetData($lblGoldFromMines, _NumberFormat($g_iGoldFromMines[$CurrentAccount], True))
			$iOldGoldFromMines[$CurrentAccount] = $g_iGoldFromMines[$CurrentAccount]
		EndIf
		;Elixir Collected
		If $iOldElixirFromCollectors[$CurrentAccount] <> $g_iElixirFromCollectors[$CurrentAccount] Then
			GUICtrlSetData($lblElixirFromCollectors, _NumberFormat($g_iElixirFromCollectors[$CurrentAccount], True))
			$iOldElixirFromCollectors[$CurrentAccount] = $g_iElixirFromCollectors[$CurrentAccount]
		EndIf
		;Dark Collected
		If $iOldDElixirFromDrills[$CurrentAccount] <> $g_iDElixirFromDrills[$CurrentAccount] Then
			GUICtrlSetData($lblDElixirFromDrills, _NumberFormat($g_iDElixirFromDrills[$CurrentAccount], True))
			$iOldDElixirFromDrills[$CurrentAccount] = $g_iDElixirFromDrills[$CurrentAccount]
		EndIf
	;Section Upgrades Made
		;walls by Gold
		If $iOldNbrOfWallsUppedGold[$CurrentAccount] <> $g_iNbrOfWallsUppedGold[$CurrentAccount] Then
			GUICtrlSetData($lblWallgoldmake, $g_iNbrOfWallsUppedGold[$CurrentAccount])
			$iOldNbrOfWallsUppedGold[$CurrentAccount] = $g_iNbrOfWallsUppedGold[$CurrentAccount]
			WallsStatsMAJ()
		EndIf
		;walls by elixir
		If $iOldNbrOfWallsUppedElixir[$CurrentAccount] <> $g_iNbrOfWallsUppedElixir[$CurrentAccount] Then
			GUICtrlSetData($lblWallelixirmake, $g_iNbrOfWallsUppedElixir[$CurrentAccount])
			$iOldNbrOfWallsUppedElixir[$CurrentAccount] = $g_iNbrOfWallsUppedElixir[$CurrentAccount]
			WallsStatsMAJ()
		EndIf
		;building by gold
		If $iOldNbrOfBuildingsUppedGold[$CurrentAccount] <> $g_iNbrOfBuildingsUppedGold[$CurrentAccount] Then
			GUICtrlSetData($lblNbrOfBuildingUpgGold, $g_iNbrOfBuildingsUppedGold[$CurrentAccount])
			$iOldNbrOfBuildingsUppedGold[$CurrentAccount] = $g_iNbrOfBuildingsUppedGold[$CurrentAccount]
		EndIf
		;building by elixir
		If $iOldNbrOfBuildingsUppedElixir[$CurrentAccount] <> $g_iNbrOfBuildingsUppedElixir[$CurrentAccount] Then
			GUICtrlSetData($lblNbrOfBuildingUpgElixir, $g_iNbrOfBuildingsUppedElixir[$CurrentAccount])
			$iOldNbrOfBuildingsUppedElixir[$CurrentAccount] = $g_iNbrOfBuildingsUppedElixir[$CurrentAccount]
		EndIf
		;Hero upgrade
		If $iOldNbrOfHeroesUpped[$CurrentAccount] <> $g_iNbrOfHeroesUpped[$CurrentAccount] Then
			GUICtrlSetData($lblNbrOfHeroUpg, $g_iNbrOfHeroesUpped[$CurrentAccount])
			$iOldNbrOfHeroesUpped[$CurrentAccount] = $g_iNbrOfHeroesUpped[$CurrentAccount]
		EndIf
	;Section Upgrade Costs
		;wall cost gold
		If $iOldCostGoldWall[$CurrentAccount] <> $g_iCostGoldWall[$CurrentAccount] Then
			GUICtrlSetData($lblWallUpgCostGold, _NumberFormat($g_iCostGoldWall[$CurrentAccount], True))
			$iOldCostGoldWall[$CurrentAccount] = $g_iCostGoldWall[$CurrentAccount]
		EndIf
		;wall cost elixir
		If $iOldCostElixirWall[$CurrentAccount] <> $g_iCostElixirWall[$CurrentAccount] Then
			GUICtrlSetData($lblWallUpgCostElixir, _NumberFormat($g_iCostElixirWall[$CurrentAccount], True))
			$iOldCostElixirWall[$CurrentAccount] = $g_iCostElixirWall[$CurrentAccount]
		EndIf
		;building cost gold
		If $iOldCostGoldBuilding[$CurrentAccount] <> $g_iCostGoldBuilding[$CurrentAccount] Then
			GUICtrlSetData($lblBuildingUpgCostGold, _NumberFormat($g_iCostGoldBuilding[$CurrentAccount], True))
			$iOldCostGoldBuilding[$CurrentAccount] = $g_iCostGoldBuilding[$CurrentAccount]
		EndIf
		;building cost elixir
		If $iOldCostElixirBuilding[$CurrentAccount] <> $g_iCostElixirBuilding[$CurrentAccount] Then
			GUICtrlSetData($lblBuildingUpgCostElixir, _NumberFormat($g_iCostElixirBuilding[$CurrentAccount], True))
			$iOldCostElixirBuilding[$CurrentAccount] = $g_iCostElixirBuilding[$CurrentAccount]
		EndIf
		;upgrade cost dark elixir
		If $iOldCostDElixirHero[$CurrentAccount] <> $g_iCostDElixirHero[$CurrentAccount] Then
			GUICtrlSetData($lblHeroUpgCost, _NumberFormat($g_iCostDElixirHero[$CurrentAccount], True))
			$iOldCostDElixirHero[$CurrentAccount] = $g_iCostDElixirHero[$CurrentAccount]
		EndIf

;Stats TAB ATTACKS

		$iAttackedCountStatic = 0
	For $i = 0 To $iModeCount
		If $iOldAttackedVillageCount[$CurrentAccount][$i] <> $g_iAttackedVillageCount[$CurrentAccount][$i] Then
			GUICtrlSetData($lblAttacked[$i], _NumberFormat($g_iAttackedVillageCount[$CurrentAccount][$i], True))
			$iOldAttackedVillageCount[$CurrentAccount][$i] = $g_iAttackedVillageCount[$CurrentAccount][$i]
		EndIf
		$iAttackedCountStatic += $g_iAttackedVillageCount[$CurrentAccount][$i]
		If $iOldTotalGoldGain[$CurrentAccount][$i] <> $g_iTotalGoldGain[$CurrentAccount][$i] Then
			GUICtrlSetData($lblTotalGoldGain[$i], _NumberFormat($g_iTotalGoldGain[$CurrentAccount][$i], True))
			$iOldTotalGoldGain[$CurrentAccount][$i] = $g_iTotalGoldGain[$CurrentAccount][$i]
		EndIf
		If $iOldTotalElixirGain[$CurrentAccount][$i] <> $g_iTotalElixirGain[$CurrentAccount][$i] Then
			GUICtrlSetData($lblTotalElixirGain[$i], _NumberFormat($g_iTotalElixirGain[$CurrentAccount][$i], True))
			$iOldTotalElixirGain[$CurrentAccount][$i] = $g_iTotalElixirGain[$CurrentAccount][$i]
		EndIf
		If $iOldTotalDarkGain[$CurrentAccount][$i] <> $g_iTotalDarkGain[$CurrentAccount][$i] Then
			GUICtrlSetData($lblTotalDElixirGain[$i], _NumberFormat($g_iTotalDarkGain[$CurrentAccount][$i], True))
			$iOldTotalDarkGain[$CurrentAccount][$i] = $g_iTotalDarkGain[$CurrentAccount][$i]
		EndIf
		If $iOldTotalTrophyGain[$CurrentAccount][$i] <> $g_iTotalTrophyGain[$CurrentAccount][$i] Then
			GUICtrlSetData($lblTotalTrophyGain[$i], _NumberFormat($g_iTotalTrophyGain[$CurrentAccount][$i], True))
			$iOldTotalTrophyGain[$CurrentAccount][$i] = $g_iTotalTrophyGain[$CurrentAccount][$i]
		EndIf
	Next

	;UPDATED TO MISC STAT TAB
	If $iOldAttackedCount <> $iAttackedCountStatic Then
		GUICtrlSetData($lblresultvillagesattacked, _NumberFormat($iAttackedCountStatic, True))
		GUICtrlSetData($lblResultAttackedHourNow, _NumberFormat($iAttackedCountStatic, True))
		$iOldAttackedCount = $iAttackedCountStatic
	EndIf
	;END UPDATED TO MISC STAT TAB

	For $i = 0 To $iModeCount
		If $i = $TS Then ContinueLoop
		If $iOldNbrOfDetectedMines[$CurrentAccount][$i] <> $g_iNbrOfDetectedMines[$CurrentAccount][$i] Then
			GUICtrlSetData($lblNbrOfDetectedMines[$i], $g_iNbrOfDetectedMines[$CurrentAccount][$i])
			$iOldNbrOfDetectedMines[$CurrentAccount][$i] = $g_iNbrOfDetectedMines[$CurrentAccount][$i]
		EndIf

		If $iOldNbrOfDetectedCollectors[$CurrentAccount][$i] <> $g_iNbrOfDetectedCollectors[$CurrentAccount][$i] Then
			GUICtrlSetData($lblNbrOfDetectedCollectors[$i], $g_iNbrOfDetectedCollectors[$CurrentAccount][$i])
			$iOldNbrOfDetectedCollectors[$CurrentAccount][$i] = $g_iNbrOfDetectedCollectors[$CurrentAccount][$i]
		EndIf

		If $iOldNbrOfDetectedDrills[$CurrentAccount][$i] <> $g_iNbrOfDetectedDrills[$CurrentAccount][$i] Then
			GUICtrlSetData($lblNbrOfDetectedDrills[$i], $g_iNbrOfDetectedDrills[$CurrentAccount][$i])
			$iOldNbrOfDetectedDrills[$CurrentAccount][$i] = $g_iNbrOfDetectedDrills[$CurrentAccount][$i]
		EndIf
	Next

		If $iOldNbrOfTHSnipeFails[$CurrentAccount] <> $g_iNbrOfTHSnipeFails[$CurrentAccount] Then
			GUICtrlSetData($lblNbrOfTSFailed, $g_iNbrOfTHSnipeFails[$CurrentAccount])
			$iOldNbrOfTHSnipeFails[$CurrentAccount] = $g_iNbrOfTHSnipeFails[$CurrentAccount]
		EndIf

		If $iOldNbrOfTHSnipeSuccess[$CurrentAccount] <> $g_iNbrOfTHSnipeSuccess[$CurrentAccount] Then
			GUICtrlSetData($lblNbrOfTSSuccess, $g_iNbrOfTHSnipeSuccess[$CurrentAccount])
			$iOldNbrOfTHSnipeSuccess[$CurrentAccount] = $g_iNbrOfTHSnipeSuccess[$CurrentAccount]
		EndIf

	;SECTION SMART ZAP
		;smartzap Gain
		If $iOldSmartZapGain <> $iSmartZapGain Then
			GUICtrlSetData($lblSmartZapGain, _NumberFormat($iSmartZapGain, True))
			$iOldSmartZapGain = $iSmartZapGain
		EndIf

		; SmartZap Spells Used
		If $iOldNumLSpellsUsed <> $iNumLSpellsUsed Then
			GUICtrlSetData($lblLightningUsed, _NumberFormat($iNumLSpellsUsed, True))
			$iOldNumLSpellsUsed = $iNumLSpellsUsed
		EndIf

		; EarthQuake Spells Used
		If $iOldNumEQSpellsUsed <> $iNumEQSpellsUsed Then
			GUICtrlSetData($lblEarthQuakeUsed, _NumberFormat($iNumEQSpellsUsed, True))
			$iOldNumEQSpellsUsed = $iNumEQSpellsUsed
		EndIf

;STATS TAB DONATIONS


;STATS UPDATE BOTTOM BAR

	If $iOldFreeBuilderCount[$CurrentAccount] <> $g_iFreeBuilderCount[$CurrentAccount] Or $iOldTotalBuilderCount[$CurrentAccount] <> $g_iTotalBuilderCount[$CurrentAccount] Then
		GUICtrlSetData($lblResultBuilderNow, $g_iFreeBuilderCount[$CurrentAccount] & "/" & $g_iTotalBuilderCount[$CurrentAccount])
		$iOldFreeBuilderCount[$CurrentAccount] = $g_iFreeBuilderCount[$CurrentAccount]
		$iOldTotalBuilderCount[$CurrentAccount] = $g_iTotalBuilderCount[$CurrentAccount]
	EndIf

	If $iOldGemAmount[$CurrentAccount] <> $g_iGemAmount[$CurrentAccount] Then
		GUICtrlSetData($lblResultGemNow, _NumberFormat($g_iGemAmount[$CurrentAccount], True))
		$iOldGemAmount[$CurrentAccount] = $g_iGemAmount[$CurrentAccount]
	EndIf

	If $iOLDGoldCurrentStatic[$CurrentAccount] <> $g_iGoldCurrent[$CurrentAccount] Then
		GUICtrlSetData($lblResultGoldNow, _NumberFormat($g_iGoldCurrent[$CurrentAccount], True))
		$iOLDGoldCurrentStatic[$CurrentAccount] = $g_iGoldCurrent[$CurrentAccount]
	EndIf

	If $iOLDElixirCurrentStatic[$CurrentAccount] <> $g_iElixirCurrent[$CurrentAccount] Then
		GUICtrlSetData($lblResultElixirNow, _NumberFormat($g_iElixirCurrent[$CurrentAccount], True))
		$iOLDElixirCurrentStatic[$CurrentAccount] = $g_iElixirCurrent[$CurrentAccount]
	EndIf

	If $iOLDDarkCurrentStatic[$CurrentAccount] <> $g_iDarkCurrent[$CurrentAccount] And $g_iDarkStart[$CurrentAccount] <> "" Then
		GUICtrlSetData($lblResultDeNow, _NumberFormat($g_iDarkCurrent[$CurrentAccount], True))
		$iOLDDarkCurrentStatic[$CurrentAccount] = $g_iDarkCurrent[$CurrentAccount]
	EndIf

	If $iOLDTrophyCurrentStatic[$CurrentAccount] <> $g_iTrophyCurrent[$CurrentAccount] Then
		GUICtrlSetData($lblResultTrophyNow, _NumberFormat($g_iTrophyCurrent[$CurrentAccount], True))
		$iOLDTrophyCurrentStatic[$CurrentAccount] = $g_iTrophyCurrent[$CurrentAccount]
	EndIf
;MISC CODE
	If $ResetStats = 1 Then
		GUICtrlSetData($lblResultGoldStart, _NumberFormat($g_iGoldCurrent[$CurrentAccount], True))
		GUICtrlSetData($lblResultElixirStart, _NumberFormat($g_iElixirCurrent[$CurrentAccount], True))
		If $g_iDarkStart[$CurrentAccount] <> "" Then
			GUICtrlSetData($lblResultDEStart, _NumberFormat($g_iDarkCurrent[$CurrentAccount], True))
		EndIf
		GUICtrlSetData($lblResultTrophyStart, _NumberFormat($g_iTrophyCurrent[$CurrentAccount], True))
		GUICtrlSetData($lblHourlyStatsGold, "")
		GUICtrlSetData($lblHourlyStatsElixir, "")
		GUICtrlSetData($lblHourlyStatsDark, "")
		GUICtrlSetData($lblHourlyStatsTrophy, "")
		GUICtrlSetData($lblResultGoldHourNow, "") ;GUI BOTTOM
		GUICtrlSetData($lblResultElixirHourNow, "") ;GUI BOTTOM
		GUICtrlSetData($lblResultDEHourNow, "") ;GUI BOTTOM
		$ResetStats = 0
	EndIf

UpdateStatsSwitchMode()
EndFunc   ;==>UpdateStats

Func ResetStats()
	$ResetStats = 1
	$FirstAttack = 0
	$iTimePassed = 0
	$sTimer = TimerInit()
	GUICtrlSetData($lblresultruntime, "00:00:00")
	GUICtrlSetData($lblResultRuntimeNow, "00:00:00")

	If $ichkSwitchAccount = 1 Then
		$g_iGoldStart[$CurrentAccount] = $g_iGoldCurrent[$CurrentAccount]
		$g_iElixirStart[$CurrentAccount] = $g_iElixirCurrent[$CurrentAccount]
		$g_iDarkStart[$CurrentAccount] = $g_iDarkCurrent[$CurrentAccount]
		$g_iTrophyStart[$CurrentAccount] = $g_iTrophyCurrent[$CurrentAccount]
		;reset first run conditions SW
		$Init = False
		$FirstInit = True
	Else
		$g_iGoldStart[$CurrentAccount] = $g_iGoldCurrent[$CurrentAccount]
		$g_iElixirStart[$CurrentAccount] = $g_iElixirCurrent[$CurrentAccount]
		$g_iDarkStart[$CurrentAccount] = $g_iDarkCurrent[$CurrentAccount]
		$g_iTrophyStart[$CurrentAccount] = $g_iTrophyCurrent[$CurrentAccount]
	EndIf

	Dim $g_iGoldTotal[9]
	Dim $g_iElixirTotal[9]
	Dim $g_iDarkTotal[9]
	Dim $g_iTrophyTotal[9]
	Dim $g_iGoldLast[9]
	Dim $g_iElixirLast[9]
	Dim $g_iDarkLast[9]
	Dim $g_iTrophyLast[9]
	Dim $g_iGoldLastBonus[9]
	Dim $g_iElixirLastBonus[9]
	Dim $g_iDarkLastBonus[9]
	Dim $g_iSkippedVillageCount[9]
	Dim $g_iDroppedTrophyCount[9]
	Dim $g_iCostGoldWall[9]
	Dim $g_iCostElixirWall[9]
	Dim $g_iCostGoldBuilding[9]
	Dim $g_iCostElixirBuilding[9]
	Dim $g_iCostDElixirHero[9]
	Dim $g_iNbrOfWallsUppedGold[9]
	Dim $g_iNbrOfWallsUppedElixir[9]
	Dim $g_iNbrOfBuildingsUppedGold[9]
	Dim $g_iNbrOfBuildingsUppedElixir[9]
	Dim $g_iNbrOfHeroesUpped[9]
	Dim $g_iSearchCost[9]
	Dim $g_iTrainCostElixir[9]
	Dim $g_iTrainCostDElixir[9]
	Dim $g_iNbrOfTHSnipeFails[9]
	Dim $g_iNbrOfTHSnipeSuccess[9]
	Dim $g_iGoldFromMines[9]
	Dim $g_iElixirFromCollectors[9]
	Dim $g_iDElixirFromDrills[9]
	$iNbrOfOoS = 0
	; ======================= SmartZap =======================
	$iSmartZapGain = 0
	$iNumLSpellsUsed = 0
	$iNumEQSpellsUsed = 0
	; ======================= SmartZap =======================

	Dim	$g_iAttackedVillageCount[9][$iModeCount + 3]
	Dim	$g_iTotalGoldGain[9][$iModeCount + 3]
	Dim	$g_iTotalElixirGain[9][$iModeCount + 3]
	Dim	$g_iTotalDarkGain[9][$iModeCount + 3]
	Dim	$g_iTotalTrophyGain[9][$iModeCount + 3]
	Dim	$g_iNbrOfDetectedMines[9][$iModeCount + 3]
	Dim	$g_iNbrOfDetectedCollectors[9][$iModeCount + 3]
	Dim	$g_iNbrOfDetectedDrills[9][$iModeCount + 3]

	Dim $TroopsDonQ[29]
	Dim	$TroopsDonXP[29]
	For $i = 0 To 28
		GUICtrlSetData($lblDonQ[$i], $TroopsDonQ[$i])
	Next

	GUICtrlSetData($lblTotalTroopsQ, "Total Donated : 0")
	GUICtrlSetData($lblTotalSpellsQ, "Total Donated : 0")
	GUICtrlSetData($lblTotalTroopsXP, "XP Won : 0")
	GUICtrlSetData($lblTotalSpellsXP, "XP Won : 0")

	UpdateStats()
EndFunc   ;==>ResetStats
