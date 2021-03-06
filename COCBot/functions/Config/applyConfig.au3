;MODded by DocOc++ Team AIO

; #FUNCTION# ====================================================================================================================
; Name ..........: applyConfig.au3
; Description ...: Applies all of the  variable to the GUI
; Syntax ........: applyConfig()
; Parameters ....: $bRedrawAtExit = True, redraws bot window after config was applied
; Return values .: NA
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================


Func applyConfig($bRedrawAtExit = True) ;Applies the data from config to the controls in GUI

	SetDebugLog("Apply Config")

	;General Settings--------------------------------------------------------------------------
	If $AndroidEmbedded = False Then
		If $frmBotPosX > -30000 And $frmBotPosY > -30000 And $FrmBotMinimized = False Then WinMove2($frmBot, "", $frmBotPosX, $frmBotPosY)
		If $AndroidPosX > -30000 And $AndroidPosY > -30000 And $Hide = False Then WinMove2($HWnD, "", $AndroidPosX, $AndroidPosY)
	Else
		If $frmBotDockedPosX > -30000 And $frmBotDockedPosY > -30000 And $FrmBotMinimized = False Then WinMove2($frmBot, "", $frmBotDockedPosX, $frmBotDockedPosY)
	EndIf
	;return ;TEMP -------------------------------------------------------------------------------------------------------TEMP!!
	; Move with redraw disabled causes ghost window in VMWare, so move first then disable redraw
	SetRedrawBotWindow(False)

	GUICtrlSetState($chkUpdatingWhenMinimized, ($iUpdatingWhenMinimized = 1 ? $GUI_CHECKED : $GUI_UNCHECKED))
	GUICtrlSetState($chkHideWhenMinimized, ($iHideWhenMinimized = 1 ? $GUI_CHECKED : $GUI_UNCHECKED))
	TrayItemSetState($tiHide, ($iHideWhenMinimized = 1 ? $TRAY_CHECKED : $TRAY_UNCHECKED))

	_GUICtrlComboBox_SetCurSel($cmbLog, $iCmbLog)
	cmbLog()

	If $ichkBackground = 1 Then
		GUICtrlSetState($chkBackground, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkBackground, $GUI_UNCHECKED)
	EndIf
	chkBackground() ;Applies it to hidden button


	;Search Settings------------------------------------------------------------------------

	_GUICtrlComboBox_SetCurSel($cmbDBMeetGE, $iCmbMeetGE[$DB])
	cmbDBGoldElixir()

	If $iChkMeetDE[$DB] = 1 Then
		GUICtrlSetState($chkDBMeetDE, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBMeetDE, $GUI_UNCHECKED)
	EndIf
	chkDBMeetDE()

	If $iChkMeetTrophy[$DB] = 1 Then
		GUICtrlSetState($chkDBMeetTrophy, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBMeetTrophy, $GUI_UNCHECKED)
	EndIf
	chkDBMeetTrophy()

	If $iChkMeetTH[$DB] = 1 Then
		GUICtrlSetState($chkDBMeetTH, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBMeetTH, $GUI_UNCHECKED)
	EndIf
	chkDBMeetTH()

	If $iChkMeetTHO[$DB] = 1 Then
		GUICtrlSetState($chkDBMeetTHO, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBMeetTHO, $GUI_UNCHECKED)
	EndIf
	; Set dead base weak base GUI
	If $iChkMaxMortar[$DB] = 1 Then
		GUICtrlSetState($chkMaxMortar[$DB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxMortar[$DB], $GUI_UNCHECKED)
	EndIf
	If $iChkMaxWizTower[$DB] = 1 Then
		GUICtrlSetState($chkMaxWizTower[$DB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxWizTower[$DB], $GUI_UNCHECKED)
	EndIf
	If $iChkMaxAirDefense[$DB] = 1 Then
		GUICtrlSetState($chkMaxAirDefense[$DB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxAirDefense[$DB], $GUI_UNCHECKED)
	EndIf
	If $iChkMaxXBow[$DB] = 1 Then
		GUICtrlSetState($chkMaxXBow[$DB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxXBow[$DB], $GUI_UNCHECKED)
	EndIf
	If $iChkMaxInferno[$DB] = 1 Then
		GUICtrlSetState($chkMaxInferno[$DB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxInferno[$DB], $GUI_UNCHECKED)
	EndIf
	If $iChkMaxEagle[$DB] = 1 Then
		GUICtrlSetState($chkMaxEagle[$DB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxEagle[$DB], $GUI_UNCHECKED)
	EndIf
	chkDBWeakBase()

	If $iChkMeetOne[$DB] = 1 Then
		GUICtrlSetState($chkDBMeetOne, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBMeetOne, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txtDBSearchesMin, $iEnableAfterCount[$DB])
	GUICtrlSetData($txtDBSearchesMax, $iEnableBeforeCount[$DB])
	GUICtrlSetData($txtDBTropiesMin, $iEnableAfterTropies[$DB])
	GUICtrlSetData($txtDBTropiesMax, $iEnableBeforeTropies[$DB])
	GUICtrlSetData($txtDBArmyCamps, $iEnableAfterArmyCamps[$DB])
	GUICtrlSetData($txtDBMinGold, $iMinGold[$DB])
	GUICtrlSetData($txtDBMinElixir, $iMinElixir[$DB])
	GUICtrlSetData($txtDBMinGoldPlusElixir, $iMinGoldPlusElixir[$DB])
	GUICtrlSetData($txtDBMinDarkElixir, $iMinDark[$DB])
	GUICtrlSetData($txtDBMinTrophy, $iMinTrophy[$DB])

	_GUICtrlComboBox_SetCurSel($cmbDBTH, $iCmbTH[$DB])
	$iMaxTH[$DB] = $THText[$iCmbTH[$DB]]

	If $iEnableSearchSearches[$DB] = 1 Then
		GUICtrlSetState($chkDBActivateSearches, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBActivateSearches, $GUI_UNCHECKED)
	EndIf

	If $iEnableSearchSearches[$LB] = 1 Then
		GUICtrlSetState($chkABActivateSearches, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABActivateSearches, $GUI_UNCHECKED)
	EndIf

	If $iEnableSearchSearches[$TS] = 1 Then
		GUICtrlSetState($chkTSActivateSearches, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSActivateSearches, $GUI_UNCHECKED)
	EndIf



	If $iEnableSearchTropies[$DB] = 1 Then
		GUICtrlSetState($chkDBActivateTropies, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBActivateTropies, $GUI_UNCHECKED)
	EndIf
	chkDBActivateTropies()
	If $iEnableSearchTropies[$LB] = 1 Then
		GUICtrlSetState($chkABActivateTropies, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABActivateTropies, $GUI_UNCHECKED)
	EndIf
	chkABActivateTropies()
	If $iEnableSearchTropies[$TS] = 1 Then
		GUICtrlSetState($chkTSActivateTropies, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSActivateTropies, $GUI_UNCHECKED)
	EndIf
	chkTSActivateTropies()

	If $iEnableSearchCamps[$DB] = 1 Then
		GUICtrlSetState($chkDBActivateCamps, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBActivateCamps, $GUI_UNCHECKED)
	EndIf
	chkDBActivateCamps()
	If $iEnableSearchCamps[$LB] = 1 Then
		GUICtrlSetState($chkABActivateCamps, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABActivateCamps, $GUI_UNCHECKED)
	EndIf
	chkABActivateCamps()
	If $iEnableSearchCamps[$TS] = 1 Then
		GUICtrlSetState($chkTSActivateCamps, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSActivateCamps, $GUI_UNCHECKED)
	EndIf
	chkTSActivateCamps()



;~ 	If $iChkEnableAfter[$LB] = 1 Then
;~ 		GUICtrlSetState($chkABEnableAfter, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkABEnableAfter, $GUI_UNCHECKED)
;~ 	EndIf
;~ 	chkABEnableAfter()

	_GUICtrlComboBox_SetCurSel($cmbABMeetGE, $iCmbMeetGE[$LB])
	cmbABGoldElixir()

	If $iChkMeetDE[$LB] = 1 Then
		GUICtrlSetState($chkABMeetDE, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetDE, $GUI_UNCHECKED)
	EndIf
	chkABMeetDE()

	If $iChkMeetTrophy[$LB] = 1 Then
		GUICtrlSetState($chkABMeetTrophy, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetTrophy, $GUI_UNCHECKED)
	EndIf
	chkABMeetTrophy()

	If $iChkMeetTH[$LB] = 1 Then
		GUICtrlSetState($chkABMeetTH, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetTH, $GUI_UNCHECKED)
	EndIf
	chkABMeetTH()

	If $iChkMeetTHO[$LB] = 1 Then
		GUICtrlSetState($chkABMeetTHO, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetTHO, $GUI_UNCHECKED)
	EndIf

	; Set live base weak base GUI
	If $iChkMaxMortar[$LB] = 1 Then
		GUICtrlSetState($chkMaxMortar[$LB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxMortar[$LB], $GUI_UNCHECKED)
	EndIf
	If $iChkMaxWizTower[$LB] = 1 Then
		GUICtrlSetState($chkMaxWizTower[$LB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxWizTower[$LB], $GUI_UNCHECKED)
	EndIf
	If $iChkMaxAirDefense[$LB] = 1 Then
		GUICtrlSetState($chkMaxAirDefense[$LB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxAirDefense[$LB], $GUI_UNCHECKED)
	EndIf
	If $iChkMaxXBow[$LB] = 1 Then
		GUICtrlSetState($chkMaxXBow[$LB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxXBow[$LB], $GUI_UNCHECKED)
	EndIf
	If $iChkMaxInferno[$LB] = 1 Then
		GUICtrlSetState($chkMaxInferno[$LB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxInferno[$LB], $GUI_UNCHECKED)
	EndIf
	If $iChkMaxEagle[$LB] = 1 Then
		GUICtrlSetState($chkMaxEagle[$LB], $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMaxEagle[$LB], $GUI_UNCHECKED)
	EndIf
	chkABWeakBase()

	If $iChkMeetOne[$LB] = 1 Then
		GUICtrlSetState($chkABMeetOne, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABMeetOne, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txtABMinGold, $iMinGold[$LB])
	GUICtrlSetData($txtABMinElixir, $iMinElixir[$LB])
	GUICtrlSetData($txtABMinGoldPlusElixir, $iMinGoldPlusElixir[$LB])
	GUICtrlSetData($txtABMinDarkElixir, $iMinDark[$LB])
	GUICtrlSetData($txtABMinTrophy, $iMinTrophy[$LB])
	GUICtrlSetData($txtABSearchesMin, $iEnableAfterCount[$LB])
	GUICtrlSetData($txtABSearchesMax, $iEnableBeforeCount[$LB])
	GUICtrlSetData($txtABTropiesMin, $iEnableAfterTropies[$LB])
	GUICtrlSetData($txtABTropiesMax, $iEnableBeforeTropies[$LB])
	GUICtrlSetData($txtABArmyCamps, $iEnableAfterArmyCamps[$LB])

	_GUICtrlComboBox_SetCurSel($cmbABTH, $iCmbTH[$LB])
	$iMaxTH[$LB] = $THText[$iCmbTH[$LB]]

	If $iChkSearchReduction = 1 Then
		GUICtrlSetState($chkSearchReduction, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSearchReduction, $GUI_UNCHECKED)
	EndIf
	chkSearchReduction()


	If $iChkRestartSearchLimit = 1 Then
		GUICtrlSetState($ChkRestartSearchLimit, $GUI_CHECKED)
	Else
		GUICtrlSetState($ChkRestartSearchLimit, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtRestartSearchlimit, $iRestartSearchlimit)
	ChkRestartSearchLimit()



	;Attack Settings-------------------------------------------------------------------------
	_GUICtrlComboBox_SetCurSel($cmbDBAlgorithm, $iAtkAlgorithm[$DB])
	_GUICtrlComboBox_SetCurSel($cmbABAlgorithm, $iAtkAlgorithm[$LB])

;~ 	_GUICtrlComboBox_SetCurSel($cmbABDeploy, $iChkDeploySettings[$LB])
;~ 	_GUICtrlComboBox_SetCurSel($cmbABUnitDelay, $iCmbUnitDelay[$LB])
;~ 	_GUICtrlComboBox_SetCurSel($cmbABWaveDelay, $iCmbWaveDelay[$LB])
;~ 	If $iChkRandomspeedatk[$LB] = 1 Then
;~ 		GUICtrlSetState($chkABRandomSpeedAtk, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkABRandomSpeedAtk, $GUI_UNCHECKED)
;~ 	EndIf
;~ 	chkABRandomSpeedAtk()

	_GUICtrlComboBox_SetCurSel($cmbDBSelectTroop, $iCmbSelectTroop[$DB])
	_GUICtrlComboBox_SetCurSel($cmbABSelectTroop, $iCmbSelectTroop[$LB])
	_GUICtrlComboBox_SetCurSel($cmbTSSelectTroop, $iCmbSelectTroop[$TS])

	#cs
		If $iTrainArchersToFitCamps = 1 Then
		GUICtrlSetState($ChkTrainArchersToFitCamps, $GUI_CHECKED)
		Else
		GUICtrlSetState($ChkTrainArchersToFitCamps, $GUI_UNCHECKED)
		EndIf

		IniReadS($iTrainArchersToFitCamps, $config, "troop", "TrainArchersToFitCamps", "1")

		If $iChkUseQuickTrain = 1 Then
		GUICtrlSetState($ChkUseQuickTrain, $GUI_CHECKED)
		Else
		GUICtrlSetState($ChkUseQuickTrain, $GUI_UNCHECKED)
		EndIf

		_GUICtrlComboBox_SetCurSel($cmbCurrentArmy, $iCmbCurrentArmy)
	#ce

;~ 	If $iChkRedArea[$DB] = 1 Then
;~ 		GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkDBSmartAttackRedArea, $GUI_UNCHECKED)
;~ 	EndIf
;~ 	chkDBSmartAttackRedArea()



;~ 	If $iChkRedArea[$LB] = 1 Then
;~ 		GUICtrlSetState($chkABSmartAttackRedArea, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkABSmartAttackRedArea, $GUI_UNCHECKED)
;~ 	EndIf
;~ 	chkABSmartAttackRedArea()

;~ 	_GUICtrlComboBox_SetCurSel($cmbABSmartDeploy, $iCmbSmartDeploy[$LB])

;~ 	If $iChkSmartAttack[$LB][0] = 1 Then
;~ 		GUICtrlSetState($chkABAttackNearGoldMine, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkABAttackNearGoldMine, $GUI_UNCHECKED)
;~ 	EndIf

;~ 	If $iChkSmartAttack[$LB][1] = 1 Then
;~ 		GUICtrlSetState($chkABAttackNearElixirCollector, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkABAttackNearElixirCollector, $GUI_UNCHECKED)
;~ 	EndIf

;~ 	If $iChkSmartAttack[$LB][2] = 1 Then
;~ 		GUICtrlSetState($chkABAttackNearDarkElixirDrill, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkABAttackNearDarkElixirDrill, $GUI_UNCHECKED)
;~ 	EndIf

	If BitAND($iHeroAttack[$DB], $HERO_KING) = $HERO_KING Then
		GUICtrlSetState($chkDBKingAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBKingAttack, $GUI_UNCHECKED)
	EndIf
	If BitAND($iHeroAttack[$LB], $HERO_KING) = $HERO_KING Then
		GUICtrlSetState($chkABKingAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABKingAttack, $GUI_UNCHECKED)
	EndIf
	If $KingAttack[$TS] = 1 Then
		GUICtrlSetState($chkTSKingAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSKingAttack, $GUI_UNCHECKED)
	EndIf

	If BitAND($iHeroWait[$DB], $HERO_KING) = $HERO_KING Then
		GUICtrlSetState($chkDBKingWait, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBKingWait, $GUI_UNCHECKED)
	EndIf
	If BitAND($iHeroWait[$LB], $HERO_KING) = $HERO_KING Then
		GUICtrlSetState($chkABKingWait, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABKingWait, $GUI_UNCHECKED)
	EndIf
	;chkDBKingWait()    ; Moved - Need to run function after upgrade status is applied
	;chkABKingWait()    ; Moved - Need to run function after upgrade status is applied

	If BitAND($iHeroAttack[$DB], $HERO_QUEEN) = $HERO_QUEEN Then
		GUICtrlSetState($chkDBQueenAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBQueenAttack, $GUI_UNCHECKED)
	EndIf
	If BitAND($iHeroAttack[$LB], $HERO_QUEEN) = $HERO_QUEEN Then
		GUICtrlSetState($chkABQueenAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABQueenAttack, $GUI_UNCHECKED)
	EndIf
	If $QueenAttack[$TS] = 1 Then
		GUICtrlSetState($chkTSQueenAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSQueenAttack, $GUI_UNCHECKED)
	EndIf

	If BitAND($iHeroWait[$DB], $HERO_QUEEN) = $HERO_QUEEN Then
		GUICtrlSetState($chkDBQueenWait, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBQueenWait, $GUI_UNCHECKED)
	EndIf
	If BitAND($iHeroWait[$LB], $HERO_QUEEN) = $HERO_QUEEN Then
		GUICtrlSetState($chkABQueenWait, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABQueenWait, $GUI_UNCHECKED)
	EndIf
	;chkDBQueenWait()  ; Moved - Need to run function after upgrade status is applied
	;chkABQueenWait()  ; Moved - Need to run function after upgrade status is applied

	If $iDropCC[$DB] = 1 Then
		GUICtrlSetState($chkDBDropCC, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBDropCC, $GUI_UNCHECKED)
	EndIf
	If $iDropCC[$LB] = 1 Then
		GUICtrlSetState($chkABDropCC, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABDropCC, $GUI_UNCHECKED)
	EndIf
	If $iDropCC[$TS] = 1 Then
		GUICtrlSetState($chkTSDropCC, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSDropCC, $GUI_UNCHECKED)
	EndIf

	If BitAND($iHeroAttack[$DB], $HERO_WARDEN) = $HERO_WARDEN Then
		GUICtrlSetState($chkDBWardenAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBWardenAttack, $GUI_UNCHECKED)
	EndIf
	If BitAND($iHeroAttack[$LB], $HERO_WARDEN) = $HERO_WARDEN Then
		GUICtrlSetState($chkABWardenAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABWardenAttack, $GUI_UNCHECKED)
	EndIf
	If $WardenAttack[$TS] = 1 Then
		GUICtrlSetState($chkTSWardenAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSWardenAttack, $GUI_UNCHECKED)
	EndIf

	If BitAND($iHeroWait[$DB], $HERO_WARDEN) = $HERO_WARDEN Then
		GUICtrlSetState($chkDBWardenWait, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBWardenWait, $GUI_UNCHECKED)
	EndIf
	If BitAND($iHeroWait[$LB], $HERO_WARDEN) = $HERO_WARDEN Then
		GUICtrlSetState($chkABWardenWait, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABWardenWait, $GUI_UNCHECKED)
	EndIf
	;chkDBWardenWait()  ; Moved - Need to run function after upgrade status is applied
	;chkABWardenWait()  ; Moved - Need to run function after upgrade status is applied

	If $iChkUseCCBalanced = 1 Then
		GUICtrlSetState($chkUseCCBalanced, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUseCCBalanced, $GUI_UNCHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbCCDonated, $iCmbCCDonated - 1)
	_GUICtrlComboBox_SetCurSel($cmbCCReceived, $iCmbCCReceived - 1)

	;chkDropInBattle()
	chkBalanceDR()
	Switch $iActivateKQCondition
		Case "Manual"
			GUICtrlSetState($radManAbilities, $GUI_CHECKED)
		Case "Auto"
			GUICtrlSetState($radAutoAbilities, $GUI_CHECKED)
	EndSwitch

	If $iActivateWardenCondition = 1 Then
		GUICtrlSetState($chkUseWardenAbility, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUseWardenAbility, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txtManAbilities, ($delayActivateKQ / 1000))
	GUICtrlSetData($txtWardenAbility, ($delayActivateW / 1000))
	CheckWardenTimer()

	If $TakeLootSnapShot = 1 Then
		GUICtrlSetState($chkTakeLootSS, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTakeLootSS, $GUI_UNCHECKED)
	EndIf

	If $ScreenshotLootInfo = 1 Then
		GUICtrlSetState($chkScreenshotLootInfo, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkScreenshotLootInfo, $GUI_UNCHECKED)
	EndIf
	chkTakeLootSS()

	;Attack Adv. Settings--------------------------------------------------------------------------
	If $ichkAttackNow = 1 Then
		GUICtrlSetState($chkAttackNow, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackNow, $GUI_UNCHECKED)
	EndIf
	chkAttackNow()

	_GUICtrlComboBox_SetCurSel($cmbAttackNowDelay, $iAttackNowDelay)

;~ 	If $ichkbtnScheduler = 1 Then
;~ 		GUICtrlSetState($chkbtnScheduler, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkbtnScheduler, $GUI_UNCHECKED)
;~ 	EndIf
;~ 	chkbtnScheduler()


	If $OptBullyMode = 1 Then
		GUICtrlSetState($BullyCheck, $GUI_CHECKED)
	ElseIf $OptBullyMode = 0 Then
		GUICtrlSetState($BullyCheck, $GUI_UNCHECKED)
	EndIf


	;chkBullyMode()

	GUICtrlSetData($txtTHaddTiles, $THaddTiles)
;~ 	_GUICtrlComboBox_SetCurSel($cmbAttackTHType, $icmbAttackTHType)

;~ 	If $iChkEnableAfter[$TS] = 1 Then
;~ 		GUICtrlSetState($chkTSEnableAfter, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkTSEnableAfter, $GUI_UNCHECKED)
;~ 	EndIf
	;chkTSEnableAfter()
	GUICtrlSetData($txtTSSearchesMin, $iEnableAfterCount[$TS])
	GUICtrlSetData($txtTSSearchesMax, $iEnableBeforeCount[$TS])
	GUICtrlSetData($txtTSTropiesMin, $iEnableAfterTropies[$TS])
	GUICtrlSetData($txtTSTropiesMax, $iEnableBeforeTropies[$TS])
	GUICtrlSetData($txtTSArmyCamps, $iEnableAfterArmyCamps[$TS])

	GUICtrlSetData($txtTSMinGold, $iMinGold[$TS])
	GUICtrlSetData($txtTSMinElixir, $iMinElixir[$TS])
	GUICtrlSetData($txtTSMinGoldPlusElixir, $iMinGoldPlusElixir[$TS])
	GUICtrlSetData($txtTSMinDarkElixir, $iMinDark[$TS])
	_GUICtrlComboBox_SetCurSel($cmbTSMeetGE, $iCmbMeetGE[$TS])
	cmbTSGoldElixir()








	;attk their king
	;attk their queen
	chkDBActivateSearches()
	chkABActivateSearches()
	chkTSActivateSearches()

	If $iDBcheck = 1 Then
		GUICtrlSetState($DBcheck, $GUI_CHECKED)
	Else
		GUICtrlSetState($DBcheck, $GUI_UNCHECKED)
	EndIf

	If $iABcheck = 1 Then
		GUICtrlSetState($ABcheck, $GUI_CHECKED)
	Else
		GUICtrlSetState($ABcheck, $GUI_UNCHECKED)
	EndIf

	If $iTScheck = 1 Then
		GUICtrlSetState($TScheck, $GUI_CHECKED)
	Else
		GUICtrlSetState($TScheck, $GUI_UNCHECKED)
	EndIf

	If GUICtrlRead($hGUI_DEADBASE_TAB) = 1 Then cmbDBAlgorithm()
	If GUICtrlRead($hGUI_ACTIVEBASE_TAB) = 1 Then cmbABAlgorithm()
	;End Battle Settings------------------------------------------------------------------------
	GUICtrlSetData($txtDBTimeStopAtk, $sTimeStopAtk[$DB])
	If $iChkTimeStopAtk[$DB] = 1 Then
		GUICtrlSetState($chkDBTimeStopAtk, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBTimeStopAtk, $GUI_UNCHECKED)
	EndIf
	chkDBTimeStopAtk()

	GUICtrlSetData($txtDBTimeStopAtk2, $sTimeStopAtk2[$DB])
	If $iChkTimeStopAtk2[$DB] = 1 Then
		GUICtrlSetState($chkDBTimeStopAtk2, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBTimeStopAtk2, $GUI_UNCHECKED)
	EndIf
	chkDBTimeStopAtk2()
	GUICtrlSetData($txtDBMinGoldStopAtk2, $stxtMinGoldStopAtk2[$DB])
	GUICtrlSetData($txtDBMinElixirStopAtk2, $stxtMinElixirStopAtk2[$DB])
	GUICtrlSetData($txtDBMinDarkElixirStopAtk2, $stxtMinDarkElixirStopAtk2[$DB])

	If $ichkEndOneStar[$DB] = 1 Then
		GUICtrlSetState($chkDBEndOneStar, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBEndOneStar, $GUI_UNCHECKED)
	EndIf

	If $ichkEndTwoStars[$DB] = 1 Then
		GUICtrlSetState($chkDBEndTwoStars, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBEndTwoStars, $GUI_UNCHECKED)
	EndIf

	If $ichkEndNoResources[$DB] = 1 Then
		GUICtrlSetState($chkDBEndNoResources, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBEndNoResources, $GUI_UNCHECKED)
	EndIf

	;;
	GUICtrlSetData($txtABTimeStopAtk, $sTimeStopAtk[$LB])
	If $iChkTimeStopAtk[$LB] = 1 Then
		GUICtrlSetState($chkABTimeStopAtk, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABTimeStopAtk, $GUI_UNCHECKED)
	EndIf
	chkABTimeStopAtk()

	GUICtrlSetData($txtABTimeStopAtk2, $sTimeStopAtk2[$LB])
	If $iChkTimeStopAtk2[$LB] = 1 Then
		GUICtrlSetState($chkABTimeStopAtk2, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABTimeStopAtk2, $GUI_UNCHECKED)
	EndIf
	chkABTimeStopAtk2()
	GUICtrlSetData($txtABMinGoldStopAtk2, $stxtMinGoldStopAtk2[$LB])
	GUICtrlSetData($txtABMinElixirStopAtk2, $stxtMinElixirStopAtk2[$LB])
	GUICtrlSetData($txtABMinDarkElixirStopAtk2, $stxtMinDarkElixirStopAtk2[$LB])

	If $ichkEndOneStar[$LB] = 1 Then
		GUICtrlSetState($chkABEndOneStar, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABEndOneStar, $GUI_UNCHECKED)
	EndIf

	If $ichkEndTwoStars[$LB] = 1 Then
		GUICtrlSetState($chkABEndTwoStars, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABEndTwoStars, $GUI_UNCHECKED)
	EndIf

	If $ichkEndNoResources[$LB] = 1 Then
		GUICtrlSetState($chkABEndNoResources, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABEndNoResources, $GUI_UNCHECKED)
	EndIf

	#CS

		GUICtrlSetData($txtTSTimeStopAtk, $sTimeStopAtk[$TS])
		If $iChkTimeStopAtk[$TS] = 1 Then
		GUICtrlSetState($chkTSTimeStopAtk, $GUI_CHECKED)
		Else
		GUICtrlSetState($chkTSTimeStopAtk, $GUI_UNCHECKED)
		EndIf
		chkTSTimeStopAtk()

		GUICtrlSetData($txtTSTimeStopAtk2, $sTimeStopAtk2[$TS])
		If $iChkTimeStopAtk2[$TS] = 1 Then
		GUICtrlSetState($chkTSTimeStopAtk2, $GUI_CHECKED)
		Else
		GUICtrlSetState($chkTSTimeStopAtk2, $GUI_UNCHECKED)
		EndIf
		chkTSTimeStopAtk2()
		GUICtrlSetData($txtTSMinGoldStopAtk2, $stxtMinGoldStopAtk2[$TS])
		GUICtrlSetData($txtTSMinElixirStopAtk2, $stxtMinElixirStopAtk2[$TS])
		GUICtrlSetData($txtTSMinDarkElixirStopAtk2, $stxtMinDarkElixirStopAtk2[$TS])

		If $ichkEndOneStar[$TS] = 1 Then
		GUICtrlSetState($chkTSEndOneStar, $GUI_CHECKED)
		Else
		GUICtrlSetState($chkTSEndOneStar, $GUI_UNCHECKED)
		EndIf

		If $ichkEndTwoStars[$TS] = 1 Then
		GUICtrlSetState($chkTSEndTwoStars, $GUI_CHECKED)
		Else
		GUICtrlSetState($chkTSEndTwoStars, $GUI_UNCHECKED)
		EndIf

		If $ichkEndNoResources[$TS] = 1 Then
		GUICtrlSetState($chkTSEndNoResources, $GUI_CHECKED)
		Else
		GUICtrlSetState($chkTSEndNoResources, $GUI_UNCHECKED)
		EndIf
	#CE

	;forced Total Camp values
	If $ichkTotalCampForced = 1 Then
		GUICtrlSetState($chkTotalCampForced, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTotalCampForced, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtTotalCampForced, $iValueTotalCampForced)
	chkTotalCampForced()

	If $ichkSinglePBTForced = 1 Then
		GUICtrlSetState($chkSinglePBTForced, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSinglePBTForced, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtSinglePBTimeForced, $iValueSinglePBTimeForced)
	GUICtrlSetData($txtPBTimeForcedExit, $iValuePBTimeForcedExit)
	chkSinglePBTForced()

	;Troop Settings--------------------------------------------------------------------------
	For $T = 0 To UBound($TroopName) - 1
		If BitAND(Eval($TroopName[$T] & "Comp") <> 0, Eval("itxtLev" & $TroopName[$T]) <> 0) Then
			GUICtrlSetData(Eval("txtNum" & $TroopName[$T]), Eval($TroopName[$T] & "Comp"))
		Else
			GUICtrlSetData(Eval("txtNum" & $TroopName[$T]), 0)
		EndIf
		GUICtrlSetData(Eval("txtLev" & $TroopName[$T]), Eval("itxtLev" & $TroopName[$T]))
		LevUpDown($TroopName[$T], False)
	Next
	For $S = 0 To UBound($SpellName) - 1
		If BitAND(Eval($SpellName[$S] & "Comp") <> 0, Eval("itxtLev" & $SpellName[$S]) <> 0) Then
			GUICtrlSetData(Eval("txtNum" & $SpellName[$S]), Eval($SpellName[$S] & "Comp"))
		Else
			GUICtrlSetData(Eval("txtNum" & $SpellName[$S]), 0)
		EndIf
		GUICtrlSetData(Eval("txtLev" & $SpellName[$S]), Eval("itxtLev" & $SpellName[$S]))
		LevUpDown($SpellName[$S], False)
	Next

	GUICtrlSetData($txtFullTroop, $fulltroop)

	If $ichkCloseWaitEnable = 1 Then
		GUICtrlSetState($chkCloseWaitEnable, $GUI_CHECKED)
		_GUI_Value_STATE("ENABLE", $groupCloseWaitTrain)
		GUICtrlSetState($lblCloseWaitingTroops, $GUI_ENABLE)
		GUICtrlSetState($cmbMinimumTimeClose, $GUI_ENABLE)
		GUICtrlSetState($lblSymbolWaiting, $GUI_ENABLE)
		GUICtrlSetState($lblWaitingInMinutes, $GUI_ENABLE)
	ElseIf $ichkCloseWaitEnable = 0 Then
		GUICtrlSetState($chkCloseWaitEnable, $GUI_UNCHECKED)
		_GUI_Value_STATE("DISABLE", $groupCloseWaitTrain)
		GUICtrlSetState($lblCloseWaitingTroops, $GUI_DISABLE)
		GUICtrlSetState($cmbMinimumTimeClose, $GUI_DISABLE)
		GUICtrlSetState($lblSymbolWaiting, $GUI_DISABLE)
		GUICtrlSetState($lblWaitingInMinutes, $GUI_DISABLE)
	EndIf
	GUICtrlSetData($cmbMinimumTimeClose, $icmbMinimumTimeClose)
	If $ichkCloseWaitTrain = 1 Then
		GUICtrlSetState($chkCloseWaitTrain, $GUI_CHECKED)
	ElseIf $ichkCloseWaitTrain = 0 Then
		GUICtrlSetState($chkCloseWaitTrain, $GUI_UNCHECKED)
	EndIf
	If $ibtnCloseWaitStop = 1 Then
		GUICtrlSetState($btnCloseWaitStop, $GUI_CHECKED)
	Else
		GUICtrlSetState($btnCloseWaitStop, $GUI_UNCHECKED)
	EndIf
	If $ibtnCloseWaitStopRandom = 1 Then
		GUICtrlSetState($btnCloseWaitStopRandom, $GUI_CHECKED)
	Else
		GUICtrlSetState($btnCloseWaitStopRandom, $GUI_UNCHECKED)
	EndIf
	btnCloseWaitStopRandom()

	If $ibtnCloseWaitExact = 1 Then
		GUICtrlSetState($btnCloseWaitExact, $GUI_CHECKED)
		GUICtrlSetState($btnCloseWaitRandom, $GUI_UNCHECKED)
	EndIf
	If $ibtnCloseWaitRandom = 1 Then
		GUICtrlSetState($btnCloseWaitRandom, $GUI_CHECKED)
		GUICtrlSetState($btnCloseWaitExact, $GUI_UNCHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbCloseWaitRdmPercent, $icmbCloseWaitRdmPercent)
	btnCloseWaitRandom()

	If $ichkTroopOrder = 1 Then
		GUICtrlSetState($chkTroopOrder, $GUI_CHECKED)
	ElseIf $ichkTroopOrder = 0 Then
		GUICtrlSetState($chkTroopOrder, $GUI_UNCHECKED)
	EndIf
	;chkTroopOrder(False)

	For $z = 0 To UBound($DefaultTroopGroup) - 1
		_GUICtrlComboBox_SetCurSel($cmbTroopOrder[$z], $icmbTroopOrder[$z])
		GUICtrlSetImage($ImgTroopOrder[$z], $pIconLib, $aTroopOrderIcon[$icmbTroopOrder[$z] + 1])
	Next
	If $ichkTroopOrder = 1 Then ; only update troop train order if enabled
		If ChangeTroopTrainOrder() = False Then ; process error
			SetDefaultTroopGroup()
			GUICtrlSetState($chkTroopOrder, $GUI_UNCHECKED)
			$ichkTroopOrder = 0
			GUICtrlSetState($btnTroopOrderSet, $GUI_DISABLE) ; disable button
			For $i = 0 To UBound($aTroopOrderList) - 2
				GUICtrlSetState($cmbTroopOrder[$i], $GUI_DISABLE) ; disable combo boxes
			Next
		EndIf
	EndIf

	If $ichkDarkTroopOrder = 1 Then
		GUICtrlSetState($chkDarkTroopOrder, $GUI_CHECKED)
	ElseIf $ichkDarkTroopOrder = 0 Then
		GUICtrlSetState($chkDarkTroopOrder, $GUI_UNCHECKED)
	EndIf
	;chkDarkTroopOrder(False)

	; For $z = 0 To UBound($DefaultTroopGroupDark) -1
	; _GUICtrlComboBox_SetCurSel($cmbDarkTroopOrder[$z], $icmbDarkTroopOrder[$z])
	; GUICtrlSetImage($ImgDarkTroopOrder[$z], $pIconLib, $aDarkTroopOrderIcon[$icmbDarkTroopOrder[$z]+1])
	; Next
;~ 	If $ichkDarkTroopOrder = 1 Then  ; only update troop train order if enabled
;~ 		If ChangeDarkTroopTrainOrder() = False Then ; process error
;~ 			SetDefaultTroopGroupDark()
;~ 			GUICtrlSetState($chkDarkTroopOrder, $GUI_UNCHECKED)
;~ 			$ichkDarkTroopOrder = 0
;~ 			GUICtrlSetState($btnDarkTroopOrderSet, $GUI_DISABLE) ; disable button
;~ 			For $i = 0 To UBound($aDarkTroopOrderList) - 2
;~ 				GUICtrlSetState($cmbDarkTroopOrder[$i], $GUI_DISABLE) ; disable combo boxes
;~ 			Next
;~ 		EndIf
;~ 	EndIf

	;Add idle phase during training apply variables in GUI
	If $ichkAddIdleTime = 1 Then
		GUICtrlSetState($chkAddDelayIdlePhaseEnable, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAddDelayIdlePhaseEnable, $GUI_UNCHECKED)
	EndIf
	chkAddDelayIdlePhaseEnable()
	GUICtrlSetData($txtAddDelayIdlePhaseTimeMin, $iAddIdleTimeMin)
	GUICtrlSetData($txtAddDelayIdlePhaseTimeMax, $iAddIdleTimeMax)

	;barracks boost not saved (no use)

	; Spells Creation  ---------------------------------------------------------------------
	; GUICtrlSetData($txtNumLSpell, $LSpellComp)
	; GUICtrlSetData($txtNumRSpell, $RSpellComp)
	; GUICtrlSetData($txtNumHSpell, $HSpellComp)
	; GUICtrlSetData($txtNumJSpell, $JSpellComp)
	; GUICtrlSetData($txtNumFSpell, $FSpellComp)
	; GUICtrlSetData($txtNumCSpell, $CSpellComp)
	; GUICtrlSetData($txtNumPSpell, $PSpellComp)
	; GUICtrlSetData($txtNumESpell, $ESpellComp)
	; GUICtrlSetData($txtNumHaSpell, $HaSpellComp)
	; GUICtrlSetData($txtNumSkSpell, $SkSpellComp)
	GUICtrlSetData($txtTotalCountSpell, $iTotalCountSpell)
	lblTotalCountSpell()
	lblTotalCountSpell2()
	;btnHideElixir()

	SetComboTroopComp()

	;Other Settings--------------------------------------------------------------------------

	GUICtrlSetData($txtWall04ST, $itxtWall04ST)
	GUICtrlSetData($txtWall05ST, $itxtWall05ST)
	GUICtrlSetData($txtWall06ST, $itxtWall06ST)
	GUICtrlSetData($txtWall07ST, $itxtWall07ST)
	GUICtrlSetData($txtWall08ST, $itxtWall08ST)
	GUICtrlSetData($txtWall09ST, $itxtWall09ST)
	GUICtrlSetData($txtWall10ST, $itxtWall10ST)
	GUICtrlSetData($txtWall11ST, $itxtWall11ST)
	GUICtrlSetData($txtWall12ST, $itxtWall12ST)

	_GUICtrlComboBox_SetCurSel($cmbWalls, $icmbWalls)
	Switch $iUseStorage
		Case 0
			GUICtrlSetState($UseGold, $GUI_CHECKED)
		Case 1
			GUICtrlSetState($UseElixir, $GUI_CHECKED)
		Case 2
			GUICtrlSetState($UseElixirGold, $GUI_CHECKED)
	EndSwitch


	If $ichkTrap = 1 Then
		GUICtrlSetState($chkTrap, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrap, $GUI_UNCHECKED)
	EndIf
	chkTrap()

	If $iChkCollect = 1 Then
		GUICtrlSetState($chkCollect, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkCollect, $GUI_UNCHECKED)
	EndIf

	If $ichkTombstones = 1 Then
		GUICtrlSetState($chkTombstones, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTombstones, $GUI_UNCHECKED)
	EndIf

	If $ichkCleanYard = 1 Then
		GUICtrlSetState($chkCleanYard, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkCleanYard, $GUI_UNCHECKED)
	EndIf

	If $ichkGemsBox = 1 Then
		GUICtrlSetState($chkGemsBox, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkGemsBox, $GUI_UNCHECKED)
	EndIf

	;location of TH, CC, Army Camp, Barrack and Spell Fact. not Applied, only read

	;planned
	If $iPlannedRequestCCHoursEnable = 1 Then
		GUICtrlSetState($chkRequestCCHours, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkRequestCCHours, $GUI_UNCHECKED)
	EndIf
	chkRequestCCHours()
	If $iPlannedDonateHoursEnable = 1 Then
		GUICtrlSetState($chkDonateHours, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateHours, $GUI_UNCHECKED)
	EndIf
	chkDonateHours()

	If $iPlannedDropCCHoursEnable = 1 Then
		GUICtrlSetState($chkDropCCHoursEnable, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDropCCHoursEnable, $GUI_UNCHECKED)
	EndIf
	chkDropCCHoursEnable()

	For $i = 0 To 23
		If $iPlannedDonateHours[$i] = 1 Then
			GUICtrlSetState(Eval("chkDonateHours" & $i), $GUI_CHECKED)
		Else
			GUICtrlSetState(Eval("chkDonateHours" & $i), $GUI_UNCHECKED)
		EndIf
	Next

	For $i = 0 To 23
		If $iPlannedRequestCCHours[$i] = 1 Then
			GUICtrlSetState(Eval("chkRequestCCHours" & $i), $GUI_CHECKED)
		Else
			GUICtrlSetState(Eval("chkRequestCCHours" & $i), $GUI_UNCHECKED)
		EndIf
	Next

	For $i = 0 To 23
		If $iPlannedDropCCHours[$i] = 1 Then
			GUICtrlSetState(Eval("chkDropCCHours" & $i), $GUI_CHECKED)
		Else
			GUICtrlSetState(Eval("chkDropCCHours" & $i), $GUI_UNCHECKED)
		EndIf
	Next

	For $i = 0 To 23
		If $iPlannedattackHours[$i] = 1 Then
			GUICtrlSetState(Eval("chkattackHours" & $i), $GUI_CHECKED)
		Else
			GUICtrlSetState(Eval("chkattackHours" & $i), $GUI_UNCHECKED)
		EndIf
	Next

	For $i = 0 To 6
		If $iPlannedAttackWeekDays[$i] = 1 Then
			GUICtrlSetState(Eval("chkAttackWeekdays" & $i), $GUI_CHECKED)
		Else
			GUICtrlSetState(Eval("chkAttackWeekdays" & $i), $GUI_UNCHECKED)
		EndIf
	Next

	If $ichkAttackPlannerEnable = 1 Then
		GUICtrlSetState($chkAttackPlannerEnable, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackPlannerEnable, $GUI_UNCHECKED)
	EndIf
	If $ichkAttackPlannerCloseCoC = 1 Then
		GUICtrlSetState($chkAttackPlannerCloseCoC, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackPlannerCloseCoC, $GUI_UNCHECKED)
	EndIf
	If $ichkAttackPlannerCloseAll = 1 Then
		GUICtrlSetState($chkAttackPlannerCloseAll, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackPlannerCloseAll, $GUI_UNCHECKED)
	EndIf
	If $ichkAttackPlannerRandom = 1 Then
		GUICtrlSetState($chkAttackPlannerRandom, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackPlannerRandom, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbAttackPlannerRandom, $icmbAttackPlannerRandom)
	If $ichkAttackPlannerDayLimit = 1 Then
		GUICtrlSetState($chkAttackPlannerDayLimit, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackPlannerDayLimit, $GUI_UNCHECKED)
	EndIf
	chkAttackPlannerEnable()

	GUICtrlSetData($cmbAttackPlannerDayMin, $icmbAttackPlannerDayMin)
	GUICtrlSetData($cmbAttackPlannerDayMax, $icmbAttackPlannerDayMax)
	_cmbAttackPlannerDayLimit()

	GUICtrlSetData($txtSWTTiles, $itxtSWTtiles)
	;ChkSnipeWhileTrain()


	;th snipe custom attacks
	LoadThSnipeAttacks() ; recreate combo box values
	_GUICtrlComboBox_SetCurSel($cmbAttackTHType, _GUICtrlComboBox_FindStringExact($cmbAttackTHType, $scmbAttackTHType))

	;AttackCSV
;~ 	If $KingAttackCSV[$DB] = 1 Then
;~ 		GUICtrlSetState($chkDBKingAttackCSV, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkDBKingAttackCSV, $GUI_UNCHECKED)
;~ 	EndIf
;~ 	If $KingAttackCSV[$LB] = 1 Then
;~ 		GUICtrlSetState($chkABKingAttackCSV, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkABKingAttackCSV, $GUI_UNCHECKED)
;~ 	EndIf

;~ 	If $QueenAttackCSV[$DB] = 1 Then
;~ 		GUICtrlSetState($chkDBQueenAttackCSV, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkDBQueenAttackCSV, $GUI_UNCHECKED)
;~ 	EndIf
;~ 	If $QueenAttackCSV[$LB] = 1 Then
;~ 		GUICtrlSetState($chkABQueenAttackCSV, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkABQueenAttackCSV, $GUI_UNCHECKED)
;~ 	EndIf

;~ 	If $iDropCCCSV[$DB] = 1 Then
;~ 		GUICtrlSetState($chkDBDropCCCSV, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkDBDropCCCSV, $GUI_UNCHECKED)
;~ 	EndIf

;~ 	If $iDropCCCSV[$LB] = 1 Then
;~ 		GUICtrlSetState($chkABDropCCCSV, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkABDropCCCSV, $GUI_UNCHECKED)
;~ 	EndIf

;~ 	If $WardenAttackCSV[$DB] = 1 Then
;~ 		GUICtrlSetState($chkDBWardenAttackCSV, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkDBWardenAttackCSV, $GUI_UNCHECKED)
;~ 	EndIf

;~ 	If $WardenAttackCSV[$LB] = 1 Then
;~ 		GUICtrlSetState($chkABWardenAttackCSV, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkABWardenAttackCSV, $GUI_UNCHECKED)
;~ 	EndIf

;~ 	If $iChkUseCCBalancedCSV = 1 Then
;~ 		GUICtrlSetState($chkUseCCBalancedCSV, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkUseCCBalancedCSV, $GUI_UNCHECKED)
;~ 	EndIf

;~ 	_GUICtrlComboBox_SetCurSel($cmbCCDonatedCSV, $iCmbCCDonatedCSV - 1)
;~ 	_GUICtrlComboBox_SetCurSel($cmbCCReceivedCSV, $iCmbCCReceivedCSV - 1)

;~ 	chkBalanceDRCSV()
	If $ichkLightSpell[$DB] = 1 Then
		GUICtrlSetState($chkDBLightSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBLightSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkLightSpell[$LB] = 1 Then
		GUICtrlSetState($chkABLightSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABLightSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkLightSpell[$TS] = 1 Then
		GUICtrlSetState($chkTSLightSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSLightSpell, $GUI_UNCHECKED)
	EndIf

	If $ichkHealSpell[$DB] = 1 Then
		GUICtrlSetState($chkDBHealSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBHealSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkHealSpell[$LB] = 1 Then
		GUICtrlSetState($chkABHealSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABHealSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkHealSpell[$TS] = 1 Then
		GUICtrlSetState($chkTSHealSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSHealSpell, $GUI_UNCHECKED)
	EndIf

	If $ichkRageSpell[$DB] = 1 Then
		GUICtrlSetState($chkDBRageSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBRageSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkRageSpell[$LB] = 1 Then
		GUICtrlSetState($chkABRageSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABRageSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkRageSpell[$TS] = 1 Then
		GUICtrlSetState($chkTSRageSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSRageSpell, $GUI_UNCHECKED)
	EndIf

	If $ichkJumpSpell[$DB] = 1 Then
		GUICtrlSetState($chkDBJumpSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBJumpSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkJumpSpell[$LB] = 1 Then
		GUICtrlSetState($chkABJumpSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABJumpSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkJumpSpell[$TS] = 1 Then
		GUICtrlSetState($chkTSJumpSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSJumpSpell, $GUI_UNCHECKED)
	EndIf

	If $ichkFreezeSpell[$DB] = 1 Then
		GUICtrlSetState($chkDBFreezeSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBFreezeSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkFreezeSpell[$LB] = 1 Then
		GUICtrlSetState($chkABFreezeSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABFreezeSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkFreezeSpell[$TS] = 1 Then
		GUICtrlSetState($chkTSFreezeSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSFreezeSpell, $GUI_UNCHECKED)
	EndIf

	If $ichkPoisonSpell[$DB] = 1 Then
		GUICtrlSetState($chkDBPoisonSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBPoisonSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkPoisonSpell[$LB] = 1 Then
		GUICtrlSetState($chkABPoisonSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABPoisonSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkPoisonSpell[$TS] = 1 Then
		GUICtrlSetState($chkTSPoisonSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSPoisonSpell, $GUI_UNCHECKED)
	EndIf

	If $ichkEarthquakeSpell[$DB] = 1 Then
		GUICtrlSetState($chkDBEarthquakeSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBEarthquakeSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkEarthquakeSpell[$LB] = 1 Then
		GUICtrlSetState($chkABEarthquakeSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABEarthquakeSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkEarthquakeSpell[$TS] = 1 Then
		GUICtrlSetState($chkTSEarthquakeSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSEarthquakeSpell, $GUI_UNCHECKED)
	EndIf

	If $ichkHasteSpell[$DB] = 1 Then
		GUICtrlSetState($chkDBHasteSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBHasteSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkHasteSpell[$LB] = 1 Then
		GUICtrlSetState($chkABHasteSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABHasteSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkHasteSpell[$TS] = 1 Then
		GUICtrlSetState($chkTSHasteSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSHasteSpell, $GUI_UNCHECKED)
	EndIf

	If $ichkCloneSpell[$DB] = 1 Then
		GUICtrlSetState($chkDBCloneSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBCloneSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkCloneSpell[$LB] = 1 Then
		GUICtrlSetState($chkABCloneSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABCloneSpell, $GUI_UNCHECKED)
	EndIf

	If $ichkSkeletonSpell[$DB] = 1 Then
		GUICtrlSetState($chkDBSkeletonSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBSkeletonSpell, $GUI_UNCHECKED)
	EndIf
	If $ichkSkeletonSpell[$LB] = 1 Then
		GUICtrlSetState($chkABSkeletonSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABSkeletonSpell, $GUI_UNCHECKED)
	EndIf

;~ 	If $ichkRequest = 1 Then
;~ 		GUICtrlSetState($chkRequest, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkRequest, $GUI_UNCHECKED)
;~ 	EndIf
	GUICtrlSetData($txtRequestCC, $sTxtRequest)
;~ 	chkRequest()


	If $iSkipDonateNearFulLTroopsEnable = 1 Then
		GUICtrlSetState($chkskipDonateNearFulLTroopsEnable, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkskipDonateNearFulLTroopsEnable, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtSkipDonateNearFulLTroopsPercentual, $sSkipDonateNearFulLTroopsPercentual)
	chkskipDonateNearFulLTroopsEnable()

	If $iShareAttack = 1 Then
		GUICtrlSetState($chkShareAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkShareAttack, $GUI_UNCHECKED)
	EndIf





	; apply donate GUI ----------------------------------------------------------------------------

	If $ichkDonateBarbarians = 1 Then
		GUICtrlSetState($chkDonateBarbarians, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateBarbarians, $GUI_UNCHECKED)
	EndIf
	chkDonateBarbarians()
	If $configLoaded Then GUICtrlSetData($txtDonateBarbarians, $sTxtDonateBarbarians)
	If $configLoaded Then GUICtrlSetData($txtBlacklistBarbarians, $sTxtBlacklistBarbarians)

	If $ichkDonateArchers = 1 Then
		GUICtrlSetState($chkDonateArchers, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateArchers, $GUI_UNCHECKED)
	EndIf
	chkDonateArchers()
	If $configLoaded Then GUICtrlSetData($txtDonateArchers, $sTxtDonateArchers)
	If $configLoaded Then GUICtrlSetData($txtBlacklistArchers, $sTxtBlacklistArchers)

	If $ichkDonateGiants = 1 Then
		GUICtrlSetState($chkDonateGiants, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateGiants, $GUI_UNCHECKED)
	EndIf
	chkDonateGiants()
	If $configLoaded Then GUICtrlSetData($txtDonateGiants, $sTxtDonateGiants)
	If $configLoaded Then GUICtrlSetData($txtBlacklistGiants, $sTxtBlacklistGiants)

	If $ichkDonateGoblins = 1 Then
		GUICtrlSetState($chkDonateGoblins, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateGoblins, $GUI_UNCHECKED)
	EndIf
	chkDonateGoblins()
	If $configLoaded Then GUICtrlSetData($txtDonateGoblins, $sTxtDonateGoblins)
	If $configLoaded Then GUICtrlSetData($txtBlacklistGoblins, $sTxtBlacklistGoblins)

	If $ichkDonateWallBreakers = 1 Then
		GUICtrlSetState($chkDonateWallBreakers, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateWallBreakers, $GUI_UNCHECKED)
	EndIf
	chkDonateWallBreakers()
	If $configLoaded Then GUICtrlSetData($txtDonateWallBreakers, $sTxtDonateWallBreakers)
	If $configLoaded Then GUICtrlSetData($txtBlacklistWallBreakers, $sTxtBlacklistWallBreakers)

	If $ichkDonateBalloons = 1 Then
		GUICtrlSetState($chkDonateBalloons, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateBalloons, $GUI_UNCHECKED)
	EndIf
	chkDonateBalloons()
	If $configLoaded Then GUICtrlSetData($txtDonateBalloons, $sTxtDonateBalloons)
	If $configLoaded Then GUICtrlSetData($txtBlacklistBalloons, $sTxtBlacklistBalloons)

	If $ichkDonateWizards = 1 Then
		GUICtrlSetState($chkDonateWizards, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateWizards, $GUI_UNCHECKED)
	EndIf
	chkDonateWizards()
	If $configLoaded Then GUICtrlSetData($txtDonateWizards, $sTxtDonateWizards)
	If $configLoaded Then GUICtrlSetData($txtBlacklistWizards, $sTxtBlacklistWizards)

	If $ichkDonateHealers = 1 Then
		GUICtrlSetState($chkDonateHealers, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateHealers, $GUI_UNCHECKED)
	EndIf
	chkDonateHealers()
	If $configLoaded Then GUICtrlSetData($txtDonateHealers, $sTxtDonateHealers)
	If $configLoaded Then GUICtrlSetData($txtBlacklistHealers, $sTxtBlacklistHealers)

	If $ichkDonateDragons = 1 Then
		GUICtrlSetState($chkDonateDragons, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateDragons, $GUI_UNCHECKED)
	EndIf
	chkDonateDragons()
	If $configLoaded Then GUICtrlSetData($txtDonateDragons, $sTxtDonateDragons)
	If $configLoaded Then GUICtrlSetData($txtBlacklistDragons, $sTxtBlacklistDragons)

	If $ichkDonatePekkas = 1 Then
		GUICtrlSetState($chkDonatePekkas, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonatePekkas, $GUI_UNCHECKED)
	EndIf
	chkDonatePekkas()
	If $configLoaded Then GUICtrlSetData($txtDonatePekkas, $sTxtDonatePekkas)
	If $configLoaded Then GUICtrlSetData($txtBlacklistPekkas, $sTxtBlacklistPekkas)

	If $ichkDonateBabyDragons = 1 Then
		GUICtrlSetState($chkDonateBabyDragons, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateBabyDragons, $GUI_UNCHECKED)
	EndIf
	chkDonateBabyDragons()
	If $configLoaded Then GUICtrlSetData($txtDonateBabyDragons, $sTxtDonateBabyDragons)
	If $configLoaded Then GUICtrlSetData($txtBlacklistBabyDragons, $sTxtBlacklistBabyDragons)

	If $ichkDonateMiners = 1 Then
		GUICtrlSetState($chkDonateMiners, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateMiners, $GUI_UNCHECKED)
	EndIf
	chkDonateMiners()
	If $configLoaded Then GUICtrlSetData($txtDonateMiners, $sTxtDonateMiners)
	If $configLoaded Then GUICtrlSetData($txtBlacklistMiners, $sTxtBlacklistMiners)

	If $ichkDonateLightningSpells = 1 Then
		GUICtrlSetState($chkDonateLightningSpells, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateLightningSpells, $GUI_UNCHECKED)
	EndIf
	chkDonateLightningSpells()
	If $configLoaded Then GUICtrlSetData($txtDonateLightningSpells, $sTxtDonateLightningSpells)
	If $configLoaded Then GUICtrlSetData($txtBlacklistLightningSpells, $sTxtBlacklistLightningSpells)

	If $ichkDonateHealSpells = 1 Then
		GUICtrlSetState($chkDonateHealSpells, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateHealSpells, $GUI_UNCHECKED)
	EndIf
	chkDonateHealSpells()
	If $configLoaded Then GUICtrlSetData($txtDonateHealSpells, $sTxtDonateHealSpells)
	If $configLoaded Then GUICtrlSetData($txtBlacklistHealSpells, $sTxtBlacklistHealSpells)

	If $ichkDonateRageSpells = 1 Then
		GUICtrlSetState($chkDonateRageSpells, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateRageSpells, $GUI_UNCHECKED)
	EndIf
	chkDonateRageSpells()
	If $configLoaded Then GUICtrlSetData($txtDonateRageSpells, $sTxtDonateRageSpells)
	If $configLoaded Then GUICtrlSetData($txtBlacklistRageSpells, $sTxtBlacklistRageSpells)

	If $ichkDonateJumpSpells = 1 Then
		GUICtrlSetState($chkDonateJumpSpells, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateJumpSpells, $GUI_UNCHECKED)
	EndIf
	chkDonateJumpSpells()
	If $configLoaded Then GUICtrlSetData($txtDonateJumpSpells, $sTxtDonateJumpSpells)
	If $configLoaded Then GUICtrlSetData($txtBlacklistJumpSpells, $sTxtBlacklistJumpSpells)

	If $ichkDonateFreezeSpells = 1 Then
		GUICtrlSetState($chkDonateFreezeSpells, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateFreezeSpells, $GUI_UNCHECKED)
	EndIf
	chkDonateFreezeSpells()
	If $configLoaded Then GUICtrlSetData($txtDonateFreezeSpells, $sTxtDonateFreezeSpells)
	If $configLoaded Then GUICtrlSetData($txtBlacklistFreezeSpells, $sTxtBlacklistFreezeSpells)

	If $ichkDonateMinions = 1 Then
		GUICtrlSetState($chkDonateMinions, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateMinions, $GUI_UNCHECKED)
	EndIf
	chkDonateMinions()
	If $configLoaded Then GUICtrlSetData($txtDonateMinions, $sTxtDonateMinions)
	If $configLoaded Then GUICtrlSetData($txtBlacklistMinions, $sTxtBlacklistMinions)
	If $ichkDonateHogRiders = 1 Then
		GUICtrlSetState($chkDonateHogRiders, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateHogRiders, $GUI_UNCHECKED)
	EndIf
	chkDonateHogRiders()
	If $configLoaded Then GUICtrlSetData($txtDonateHogRiders, $sTxtDonateHogRiders)
	If $configLoaded Then GUICtrlSetData($txtBlacklistHogRiders, $sTxtBlacklistHogRiders)

	If $ichkDonateValkyries = 1 Then
		GUICtrlSetState($chkDonateValkyries, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateValkyries, $GUI_UNCHECKED)
	EndIf
	chkDonateValkyries()
	If $configLoaded Then GUICtrlSetData($txtDonateValkyries, $sTxtDonateValkyries)
	If $configLoaded Then GUICtrlSetData($txtBlacklistValkyries, $sTxtBlacklistValkyries)

	If $ichkDonateGolems = 1 Then
		GUICtrlSetState($chkDonateGolems, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateGolems, $GUI_UNCHECKED)
	EndIf
	chkDonateGolems()
	If $configLoaded Then GUICtrlSetData($txtDonateGolems, $sTxtDonateGolems)
	If $configLoaded Then GUICtrlSetData($txtBlacklistGolems, $sTxtBlacklistGolems)

	If $ichkDonateWitches = 1 Then
		GUICtrlSetState($chkDonateWitches, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateWitches, $GUI_UNCHECKED)
	EndIf
	chkDonateWitches()
	If $configLoaded Then GUICtrlSetData($txtDonateWitches, $sTxtDonateWitches)
	If $configLoaded Then GUICtrlSetData($txtBlacklistWitches, $sTxtBlacklistWitches)

	If $ichkDonateLavaHounds = 1 Then
		GUICtrlSetState($chkDonateLavaHounds, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateLavaHounds, $GUI_UNCHECKED)
	EndIf
	chkDonateLavaHounds()
	If $configLoaded Then GUICtrlSetData($txtDonateLavaHounds, $sTxtDonateLavaHounds)
	If $configLoaded Then GUICtrlSetData($txtBlacklistLavaHounds, $sTxtBlacklistLavaHounds)

	If $ichkDonateBowlers = 1 Then
		GUICtrlSetState($chkDonateBowlers, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateBowlers, $GUI_UNCHECKED)
	EndIf
	chkDonateBowlers()
	If $configLoaded Then GUICtrlSetData($txtDonateBowlers, $sTxtDonateBowlers)
	If $configLoaded Then GUICtrlSetData($txtBlacklistBowlers, $sTxtBlacklistBowlers)

	If $ichkDonatePoisonSpells = 1 Then
		GUICtrlSetState($chkDonatePoisonSpells, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonatePoisonSpells, $GUI_UNCHECKED)
	EndIf
	chkDonatePoisonSpells()
	If $configLoaded Then GUICtrlSetData($txtDonatePoisonSpells, $sTxtDonatePoisonSpells)
	If $configLoaded Then GUICtrlSetData($txtBlacklistPoisonSpells, $sTxtBlacklistPoisonSpells)

	If $ichkDonateEarthQuakeSpells = 1 Then
		GUICtrlSetState($chkDonateEarthQuakeSpells, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateEarthQuakeSpells, $GUI_UNCHECKED)
	EndIf
	chkDonateEarthQuakeSpells()
	If $configLoaded Then GUICtrlSetData($txtDonateEarthQuakeSpells, $sTxtDonateEarthQuakeSpells)
	If $configLoaded Then GUICtrlSetData($txtBlacklistEarthQuakeSpells, $sTxtBlacklistEarthQuakeSpells)

	If $ichkDonateHasteSpells = 1 Then
		GUICtrlSetState($chkDonateHasteSpells, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateHasteSpells, $GUI_UNCHECKED)
	EndIf
	chkDonateHasteSpells()
	If $configLoaded Then GUICtrlSetData($txtDonateHasteSpells, $sTxtDonateHasteSpells)
	If $configLoaded Then GUICtrlSetData($txtBlacklistHasteSpells, $sTxtBlacklistHasteSpells)

	If $ichkDonateSkeletonSpells = 1 Then
		GUICtrlSetState($chkDonateSkeletonSpells, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateSkeletonSpells, $GUI_UNCHECKED)
	EndIf
	chkDonateSkeletonSpells()
	If $configLoaded Then GUICtrlSetData($txtDonateSkeletonSpells, $sTxtDonateSkeletonSpells)
	If $configLoaded Then GUICtrlSetData($txtBlacklistSkeletonSpells, $sTxtBlacklistSkeletonSpells)

	;;; Custom Combination Donate by ChiefM3
	If $ichkDonateCustomA = 1 Then
		GUICtrlSetState($chkDonateCustomA, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateCustomA, $GUI_UNCHECKED)
	EndIf
	chkDonateCustomA()
	If $configLoaded Then GUICtrlSetData($txtDonateCustomA, $sTxtDonateCustomA)
	If $configLoaded Then GUICtrlSetData($txtBlacklistCustomA, $sTxtBlacklistCustomA)

	_GUICtrlComboBox_SetCurSel($cmbDonateCustomA1, $varDonateCustomA[0][0])
	GUICtrlSetData($txtDonateCustomA1, $varDonateCustomA[0][1])
	_GUICtrlComboBox_SetCurSel($cmbDonateCustomA2, $varDonateCustomA[1][0])
	GUICtrlSetData($txtDonateCustomA2, $varDonateCustomA[1][1])
	_GUICtrlComboBox_SetCurSel($cmbDonateCustomA3, $varDonateCustomA[2][0])
	GUICtrlSetData($txtDonateCustomA3, $varDonateCustomA[2][1])
	cmbDonateCustomA()

	If $ichkDonateCustomB = 1 Then
		GUICtrlSetState($chkDonateCustomB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDonateCustomB, $GUI_UNCHECKED)
	EndIf
	chkDonateCustomB()
	If $configLoaded Then GUICtrlSetData($txtDonateCustomB, $sTxtDonateCustomB)
	If $configLoaded Then GUICtrlSetData($txtBlacklistCustomB, $sTxtBlacklistCustomB)

	_GUICtrlComboBox_SetCurSel($cmbDonateCustomB1, $varDonateCustomB[0][0])
	GUICtrlSetData($txtDonateCustomB1, $varDonateCustomB[0][1])
	_GUICtrlComboBox_SetCurSel($cmbDonateCustomB2, $varDonateCustomB[1][0])
	GUICtrlSetData($txtDonateCustomB2, $varDonateCustomB[1][1])
	_GUICtrlComboBox_SetCurSel($cmbDonateCustomB3, $varDonateCustomB[2][0])
	GUICtrlSetData($txtDonateCustomB3, $varDonateCustomB[2][1])
	cmbDonateCustomB()


	GUICtrlSetData($txtBlacklist, $sTxtBlacklist)

	If $ichkDonateAllBarbarians = 1 Then
		GUICtrlSetState($chkDonateAllBarbarians, $GUI_CHECKED)
		_DonateAllControls($eBarb, True)
	Else
		GUICtrlSetState($chkDonateAllBarbarians, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllArchers = 1 Then
		GUICtrlSetState($chkDonateAllArchers, $GUI_CHECKED)
		_DonateAllControls($eArch, True)
	Else
		GUICtrlSetState($chkDonateAllArchers, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllGiants = 1 Then
		GUICtrlSetState($chkDonateAllGiants, $GUI_CHECKED)
		_DonateAllControls($eGiant, True)
	Else
		GUICtrlSetState($chkDonateAllGiants, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllGoblins = 1 Then
		GUICtrlSetState($chkDonateAllGoblins, $GUI_CHECKED)
		_DonateAllControls($eGobl, True)
	Else
		GUICtrlSetState($chkDonateAllGoblins, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllWallBreakers = 1 Then
		GUICtrlSetState($chkDonateAllWallBreakers, $GUI_CHECKED)
		_DonateAllControls($eWall, True)
	Else
		GUICtrlSetState($chkDonateAllWallBreakers, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllBalloons = 1 Then
		GUICtrlSetState($chkDonateAllBalloons, $GUI_CHECKED)
		_DonateAllControls($eBall, True)
	Else
		GUICtrlSetState($chkDonateAllBalloons, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllWizards = 1 Then
		GUICtrlSetState($chkDonateAllWizards, $GUI_CHECKED)
		_DonateAllControls($eWiza, True)
	Else
		GUICtrlSetState($chkDonateAllWizards, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllHealers = 1 Then
		GUICtrlSetState($chkDonateAllHealers, $GUI_CHECKED)
		_DonateAllControls($eHeal, True)
	Else
		GUICtrlSetState($chkDonateAllHealers, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllDragons = 1 Then
		GUICtrlSetState($chkDonateAllDragons, $GUI_CHECKED)
		_DonateAllControls($eDrag, True)
	Else
		GUICtrlSetState($chkDonateAllDragons, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllPekkas = 1 Then
		GUICtrlSetState($chkDonateAllPekkas, $GUI_CHECKED)
		_DonateAllControls($ePekk, True)
	Else
		GUICtrlSetState($chkDonateAllPekkas, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllBabyDragons = 1 Then
		GUICtrlSetState($chkDonateAllBabyDragons, $GUI_CHECKED)
		_DonateAllControls($eBabyD, True)
	Else
		GUICtrlSetState($chkDonateAllBabyDragons, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllMiners = 1 Then
		GUICtrlSetState($chkDonateAllMiners, $GUI_CHECKED)
		_DonateAllControls($eMine, True)
	Else
		GUICtrlSetState($chkDonateAllMiners, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllLightningSpells = 1 Then
		GUICtrlSetState($chkDonateAllLightningSpells, $GUI_CHECKED)
		_DonateAllControlsSpell(4, True)
	Else
		GUICtrlSetState($chkDonateAllLightningSpells, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllHealSpells = 1 Then
		GUICtrlSetState($chkDonateAllHealSpells, $GUI_CHECKED)
		_DonateAllControlsSpell(5, True)
	Else
		GUICtrlSetState($chkDonateAllHealSpells, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllRageSpells = 1 Then
		GUICtrlSetState($chkDonateAllRageSpells, $GUI_CHECKED)
		_DonateAllControlsSpell(6, True)
	Else
		GUICtrlSetState($chkDonateAllRageSpells, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllJumpSpells = 1 Then
		GUICtrlSetState($chkDonateAllJumpSpells, $GUI_CHECKED)
		_DonateAllControlsSpell(7, True)
	Else
		GUICtrlSetState($chkDonateAllJumpSpells, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllFreezeSpells = 1 Then
		GUICtrlSetState($chkDonateAllFreezeSpells, $GUI_CHECKED)
		_DonateAllControlsSpell(8, True)
	Else
		GUICtrlSetState($chkDonateAllFreezeSpells, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllMinions = 1 Then
		GUICtrlSetState($chkDonateAllMinions, $GUI_CHECKED)
		_DonateAllControls($eMini, True)
	Else
		GUICtrlSetState($chkDonateAllMinions, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllHogRiders = 1 Then
		GUICtrlSetState($chkDonateAllHogRiders, $GUI_CHECKED)
		_DonateAllControls($eHogs, True)
	Else
		GUICtrlSetState($chkDonateAllHogRiders, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllValkyries = 1 Then
		GUICtrlSetState($chkDonateAllValkyries, $GUI_CHECKED)
		_DonateAllControls($eValk, True)
	Else
		GUICtrlSetState($chkDonateAllValkyries, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllGolems = 1 Then
		GUICtrlSetState($chkDonateAllGolems, $GUI_CHECKED)
		_DonateAllControls($eGole, True)
	Else
		GUICtrlSetState($chkDonateAllGolems, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllWitches = 1 Then
		GUICtrlSetState($chkDonateAllWitches, $GUI_CHECKED)
		_DonateAllControls($eWitc, True)
	Else
		GUICtrlSetState($chkDonateAllWitches, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllLavaHounds = 1 Then
		GUICtrlSetState($chkDonateAllLavaHounds, $GUI_CHECKED)
		_DonateAllControls($eLava, True)
	Else
		GUICtrlSetState($chkDonateAllLavaHounds, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllBowlers = 1 Then
		GUICtrlSetState($chkDonateAllBowlers, $GUI_CHECKED)
		_DonateAllControls($eLava, True)
	Else
		GUICtrlSetState($chkDonateAllBowlers, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllPoisonSpells = 1 Then
		GUICtrlSetState($chkDonateAllPoisonSpells, $GUI_CHECKED)
		_DonateAllControlsSpell(0, True)
	Else
		GUICtrlSetState($chkDonateAllPoisonSpells, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllEarthQuakeSpells = 1 Then
		GUICtrlSetState($chkDonateAllEarthQuakeSpells, $GUI_CHECKED)
		_DonateAllControlsSpell(1, True)
	Else
		GUICtrlSetState($chkDonateAllEarthQuakeSpells, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllHasteSpells = 1 Then
		GUICtrlSetState($chkDonateAllHasteSpells, $GUI_CHECKED)
		_DonateAllControlsSpell(2, True)
	Else
		GUICtrlSetState($chkDonateAllHasteSpells, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllSkeletonSpells = 1 Then
		GUICtrlSetState($chkDonateAllSkeletonSpells, $GUI_CHECKED)
		_DonateAllControlsSpell(3, True)
	Else
		GUICtrlSetState($chkDonateAllSkeletonSpells, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllCustomA = 1 Then
		GUICtrlSetState($chkDonateAllCustomA, $GUI_CHECKED)
		_DonateAllControls(19, True)
	Else
		GUICtrlSetState($chkDonateAllCustomA, $GUI_UNCHECKED)
	EndIf

	If $ichkDonateAllCustomB = 1 Then
		GUICtrlSetState($chkDonateAllCustomB, $GUI_CHECKED)
		_DonateAllControls(20, True)
	Else
		GUICtrlSetState($chkDonateAllCustomB, $GUI_UNCHECKED)
	EndIf

	; Extra Alphabets, Cyrillic, Chinese, Persian
	If $ichkExtraAlphabets = 0 Then
		GUICtrlSetState($chkExtraAlphabets, $GUI_UNCHECKED)
	ElseIf $ichkExtraAlphabets = 1 Then
		GUICtrlSetState($chkExtraAlphabets, $GUI_CHECKED)
	EndIf
	If $ichkExtraChinese = 0 Then
		GUICtrlSetState($chkExtraChinese, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($chkExtraChinese, $GUI_CHECKED)
	EndIf
	If $ichkExtraPersian = 0 Then
		GUICtrlSetState($chkExtraPersian, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($chkExtraPersian, $GUI_CHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbFilterDonationsCC, $icmbFilterDonationsCC)

	;------------------------------------------------------------------------------------


	; apply strategy
	PopulatePresetComboBox()
	MakeSavePresetMessage()
	GUICtrlSetState($lblLoadPresetMessage, $GUI_SHOW)
	GUICtrlSetState($txtPresetMessage, $GUI_HIDE)
	GUICtrlSetState($btnGUIPresetLoadConf, $GUI_HIDE)
	GUICtrlSetState($btnGUIPresetDeleteConf, $GUI_HIDE + $GUI_DISABLE)
	GUICtrlSetState($chkCheckDeleteConf, $GUI_HIDE + $GUI_UNCHECKED)
	GUICtrlSetState($chkCheckDeleteConf, $GUI_HIDE)
	;------------------------------------------------------------------------------------


	;==============================================================
	;NOTIFY CONFIG ================================================
	;==============================================================

	; apply notify PushBullet
	If $NotifyPBEnabled = 1 Then
		GUICtrlSetState($chkNotifyPBEnabled, $GUI_CHECKED)
	ElseIf $NotifyPBEnabled = 0 Then
		GUICtrlSetState($chkNotifyPBEnabled, $GUI_UNCHECKED)
	EndIf
	; apply notify Telegram
	If $NotifyTGEnabled = 1 Then
		GUICtrlSetState($chkTGenabled, $GUI_CHECKED)
	ElseIf $NotifyTGEnabled = 0 Then
		GUICtrlSetState($chkTGenabled, $GUI_UNCHECKED)
	EndIf
	chkPBTGenabled()

	If $NotifyRemoteEnable = 1 Then
		GUICtrlSetState($chkNotifyRemote, $GUI_CHECKED)
	ElseIf $NotifyRemoteEnable = 0 Then
		GUICtrlSetState($chkNotifyRemote, $GUI_UNCHECKED)
	EndIf

	If $NotifyDeleteAllPushesOnStart = 1 Then
		GUICtrlSetState($chkNotifyDeleteAllPBPushes, $GUI_CHECKED)
	ElseIf $NotifyDeleteAllPushesOnStart = 0 Then
		GUICtrlSetState($chkNotifyDeleteAllPBPushes, $GUI_UNCHECKED)
	EndIf

	If $NotifyDeletePushesOlderThan = 1 Then
		GUICtrlSetState($chkNotifyDeleteOldPBPushes, $GUI_CHECKED)
	ElseIf $NotifyDeletePushesOlderThan = 0 Then
		GUICtrlSetState($chkNotifyDeleteOldPBPushes, $GUI_UNCHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbNotifyPushHours, $NotifyDeletePushesOlderThanHours)

	If $NotifyAlertMatchFound = 1 Then
		GUICtrlSetState($chkNotifyAlertMatchFound, $GUI_CHECKED)
	ElseIf $NotifyAlertMatchFound = 0 Then
		GUICtrlSetState($chkNotifyAlertMatchFound, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlerLastRaidIMG = 1 Then
		GUICtrlSetState($chkNotifyAlertLastRaidIMG, $GUI_CHECKED)
	ElseIf $NotifyAlerLastRaidIMG = 0 Then
		GUICtrlSetState($chkNotifyAlertLastRaidIMG, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlertUpgradeWalls = 1 Then
		GUICtrlSetState($chkNotifyAlertUpgradeWall, $GUI_CHECKED)
	ElseIf $NotifyAlertUpgradeWalls = 0 Then
		GUICtrlSetState($chkNotifyAlertUpgradeWall, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlertOutOfSync = 1 Then
		GUICtrlSetState($chkNotifyAlertOutOfSync, $GUI_CHECKED)
	ElseIf $NotifyAlertOutOfSync = 0 Then
		GUICtrlSetState($chkNotifyAlertOutOfSync, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlertTakeBreak = 1 Then
		GUICtrlSetState($chkNotifyAlertTakeBreak, $GUI_CHECKED)
	ElseIf $NotifyAlertTakeBreak = 0 Then
		GUICtrlSetState($chkNotifyAlertTakeBreak, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlertAnotherDevice = 1 Then
		GUICtrlSetState($chkNotifyAlertAnotherDevice, $GUI_CHECKED)
	ElseIf $NotifyAlertAnotherDevice = 0 Then
		GUICtrlSetState($chkNotifyAlertAnotherDevice, $GUI_UNCHECKED)
	EndIf

	If $NotifyDeletePushesOlderThan = 1 Then
		GUICtrlSetState($chkNotifyDeleteOldPBPushes, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkNotifyDeleteOldPBPushes, $GUI_UNCHECKED)
	EndIf
	chkDeleteOldPBPushes()

	If $NotifyAlerLastRaidTXT = 1 Then
		GUICtrlSetState($chkNotifyAlertLastRaidTXT, $GUI_CHECKED)
	ElseIf $NotifyAlerLastRaidTXT = 0 Then
		GUICtrlSetState($chkNotifyAlertLastRaidTXT, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlertCampFull = 1 Then
		GUICtrlSetState($chkNotifyAlertCampFull, $GUI_CHECKED)
	ElseIf $NotifyAlertCampFull = 0 Then
		GUICtrlSetState($chkNotifyAlertCampFull, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlertVillageReport = 1 Then
		GUICtrlSetState($chkNotifyAlertVillageStats, $GUI_CHECKED)
	ElseIf $NotifyAlertVillageReport = 0 Then
		GUICtrlSetState($chkNotifyAlertVillageStats, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlertLastAttack = 1 Then
		GUICtrlSetState($chkNotifyAlertLastAttack, $GUI_CHECKED)
	ElseIf $NotifyAlertLastAttack = 0 Then
		GUICtrlSetState($chkNotifyAlertLastAttack, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlertBulderIdle = 1 Then
		GUICtrlSetState($chkNotifyAlertBuilderIdle, $GUI_CHECKED)
	ElseIf $NotifyAlertBulderIdle = 0 Then
		GUICtrlSetState($chkNotifyAlertBuilderIdle, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlertMaintenance = 1 Then
		GUICtrlSetState($chkNotifyAlertMaintenance, $GUI_CHECKED)
	ElseIf $NotifyAlertMaintenance = 0 Then
		GUICtrlSetState($chkNotifyAlertMaintenance, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlertBAN = 1 Then
		GUICtrlSetState($chkNotifyAlertBAN, $GUI_CHECKED)
	ElseIf $NotifyAlertBAN = 0 Then
		GUICtrlSetState($chkNotifyAlertBAN, $GUI_UNCHECKED)
	EndIf

	If $NotifyAlertBOTUpdate = 1 Then
		GUICtrlSetState($chkNotifyBOTUpdate, $GUI_CHECKED)
	ElseIf $NotifyAlertBOTUpdate = 0 Then
		GUICtrlSetState($chkNotifyBOTUpdate, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txbNotifyPBToken, $NotifyPBToken)
	GUICtrlSetData($txbNotifyTGToken, $NotifyTGToken)
	GUICtrlSetData($txbNotifyOrigin, $NotifyOrigin)
	;Schedule
	If $NotifyScheduleHoursEnable = 1 Then
		GUICtrlSetState($chkNotifyHours, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkNotifyHours, $GUI_UNCHECKED)
	EndIf
	chkNotifyHours()
	For $i = 0 To 23
		If $NotifyScheduleHours[$i] = 1 Then
			GUICtrlSetState(Eval("chkNotifyHours" & $i), $GUI_CHECKED)
		Else
			GUICtrlSetState(Eval("chkNotifyHours" & $i), $GUI_UNCHECKED)
		EndIf
	Next
	If $NotifyScheduleWeekDaysEnable = 1 Then
		GUICtrlSetState($chkNotifyWeekDays, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkNotifyWeekDays, $GUI_UNCHECKED)
	EndIf
	chkNotifyWeekDays()
	For $i = 0 To 6
		If $NotifyScheduleWeekDays[$i] = 1 Then
			GUICtrlSetState(Eval("chkNotifyWeekdays" & $i), $GUI_CHECKED)
		Else
			GUICtrlSetState(Eval("chkNotifyWeekdays" & $i), $GUI_UNCHECKED)
		EndIf
	Next


	;==============================================================
	;NOTIFY CONFIG ================================================
	;==============================================================



	; apply upgrade buildings -------------------------------------------------------------------
	;Lab
	If $ichkLab = 1 Then
		GUICtrlSetState($chkLab, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkLab, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbLaboratory, $icmbLaboratory)
	GUICtrlSetImage($icnLabUpgrade, $pIconLib, $aLabTroops[$icmbLaboratory][4])
	chkLab()

	If $ichkUpgradeKing = 1 Then
		GUICtrlSetState($chkUpgradeKing, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUpgradeKing, $GUI_UNCHECKED)
	EndIf
	chkUpgradeKing()
	chkDBKingWait() ; Need to run function after upgrade status is applied
	chkABKingWait() ; Need to run function after upgrade status is applied
	If $ichkUpgradeQueen = 1 Then
		GUICtrlSetState($chkUpgradeQueen, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUpgradeQueen, $GUI_UNCHECKED)
	EndIf
	chkUpgradeQueen()
	chkDBQueenWait() ; Need to run function after upgrade status is applied
	chkABQueenWait() ; Need to run function after upgrade status is applied

	If $ichkUpgradeWarden = 1 Then
		GUICtrlSetState($chkUpgradeWarden, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUpgradeWarden, $GUI_UNCHECKED)
	EndIf
	chkUpgradeWarden()
	chkDBWardenWait() ; Need to run function after upgrade status is applied
	chkABWardenWait() ; Need to run function after upgrade status is applied

	For $iz = 0 To UBound($aUpgrades, 1) - 1 ; Apply the buildings upgrade variable to GUI
		GUICtrlSetImage($picUpgradeStatus[$iz], $pIconLib, $ipicUpgradeStatus[$iz]) ; Set GUI status pic
		If $aUpgrades[$iz][2] > 0 Then
			GUICtrlSetData($txtUpgradeValue[$iz], _NumberFormat($aUpgrades[$iz][2])) ; Set GUI loot value to match $aUpgrades variable
		Else
			GUICtrlSetData($txtUpgradeValue[$iz], "") ; Set GUI loot value to blank
		EndIf
		GUICtrlSetData($txtUpgradeName[$iz], $aUpgrades[$iz][4]) ; Set GUI unit name $aUpgrades variable
		GUICtrlSetData($txtUpgradeLevel[$iz], $aUpgrades[$iz][5]) ; Set GUI unit level to match $aUpgrades variable
		GUICtrlSetData($txtUpgradeTime[$iz], StringStripWS($aUpgrades[$iz][6], $STR_STRIPALL)) ; Set GUI upgrade time to match $aUpgrades variable

		Switch $aUpgrades[$iz][3] ;Set GUI Upgrade Type to match $aUpgrades variable
			Case "Gold"
				GUICtrlSetImage($picUpgradeType[$iz], $pIconLib, $eIcnGold)
			Case "Elixir"
				GUICtrlSetImage($picUpgradeType[$iz], $pIconLib, $eIcnElixir)
			Case "Dark"
				GUICtrlSetImage($picUpgradeType[$iz], $pIconLib, $eIcnDark)
			Case Else
				GUICtrlSetImage($picUpgradeType[$iz], $pIconLib, $eIcnBlank)
		EndSwitch
		If $ichkbxUpgrade[$iz] = 1 Then
			GUICtrlSetState($chkbxUpgrade[$iz], $GUI_CHECKED)
		Else
			GUICtrlSetState($chkbxUpgrade[$iz], $GUI_UNCHECKED)
		EndIf
		If $ichkUpgrdeRepeat[$iz] = 1 Then
			GUICtrlSetState($chkUpgrdeRepeat[$iz], $GUI_CHECKED)
		Else
			GUICtrlSetState($chkUpgrdeRepeat[$iz], $GUI_UNCHECKED)
		EndIf
		GUICtrlSetData($txtUpgradeEndTime[$iz], $aUpgrades[$iz][7]) ; Set GUI upgrade End time to match $aUpgrades variable

	Next
	GUICtrlSetData($txtUpgrMinGold, $itxtUpgrMinGold)
	GUICtrlSetData($txtUpgrMinElixir, $itxtUpgrMinElixir)
	GUICtrlSetData($txtUpgrMinDark, $itxtUpgrMinDark)

	; apply upgrade walls -------------------------------------------------------

	_GUICtrlComboBox_SetCurSel($cmbWalls, $icmbWalls)

	Switch $iUseStorage
		Case 0
			GUICtrlSetState($UseGold, $GUI_CHECKED)
		Case 1
			GUICtrlSetState($UseElixir, $GUI_CHECKED)
		Case 2
			GUICtrlSetState($UseElixirGold, $GUI_CHECKED)
	EndSwitch


	GUICtrlSetData($txtWallMinGold, $itxtWallMinGold)
	GUICtrlSetData($txtWallMinElixir, $itxtWallMinElixir)
	cmbWalls()

	If $ichkWalls = 1 Then
		GUICtrlSetState($chkWalls, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkWalls, $GUI_UNCHECKED)
	EndIf
	chkWalls()

	;Slider Upgrade Walls
	; GUICtrlSetData($sldMaxNbWall, $iMaxNbWall)

	If $iSaveWallBldr = 1 Then
		GUICtrlSetState($chkSaveWallBldr, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSaveWallBldr, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txtWall04ST, $itxtWall04ST)
	GUICtrlSetData($txtWall05ST, $itxtWall05ST)
	GUICtrlSetData($txtWall06ST, $itxtWall06ST)
	GUICtrlSetData($txtWall07ST, $itxtWall07ST)
	GUICtrlSetData($txtWall08ST, $itxtWall08ST)
	GUICtrlSetData($txtWall09ST, $itxtWall09ST)
	GUICtrlSetData($txtWall10ST, $itxtWall10ST)
	GUICtrlSetData($txtWall11ST, $itxtWall11ST)
	GUICtrlSetData($txtWall12ST, $itxtWall12ST)

	GUICtrlSetData($txtUpgrMinGold, $itxtUpgrMinGold)
	GUICtrlSetData($txtUpgrMinElixir, $itxtUpgrMinElixir)
	GUICtrlSetData($txtUpgrMinDark, $itxtUpgrMinDark)

	; apply unbreakable -----------------------------------------------------------------
	GUICtrlSetData($txtUnbreakable, $iUnbreakableWait)
	GUICtrlSetData($txtUnBrkMinGold, $iUnBrkMinGold)
	GUICtrlSetData($txtUnBrkMinElixir, $iUnBrkMinElixir)
	GUICtrlSetData($txtUnBrkMinDark, $iUnBrkMinDark)
	GUICtrlSetData($txtUnBrkMaxGold, $iUnBrkMaxGold)
	GUICtrlSetData($txtUnBrkMaxElixir, $iUnBrkMaxElixir)
	GUICtrlSetData($txtUnBrkMaxDark, $iUnBrkMaxDark)
	If $iUnbreakableMode = 1 Then
		GUICtrlSetState($chkUnbreakable, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUnbreakable, $GUI_UNCHECKED)
	EndIf
	chkUnbreakable()

	; apply halt&resume-------------------------------------------------------------------
	If $ichkBotStop = 1 Then
		GUICtrlSetState($chkBotStop, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkBotStop, $GUI_UNCHECKED)
	EndIf
	chkBotStop()

	_GUICtrlComboBox_SetCurSel($cmbBotCommand, $icmbBotCommand)
	_GUICtrlComboBox_SetCurSel($cmbBotCond, $icmbBotCond)
	_GUICtrlComboBox_SetCurSel($cmbHoursStop, $icmbHoursStop)
	cmbBotCond()

	GUICtrlSetData($txtTimeWakeUp, Int(Int($sTimeWakeUp) / 60))

	GUICtrlSetData($txtRestartGold, $itxtRestartGold)
	GUICtrlSetData($txtRestartElixir, $itxtRestartElixir)
	GUICtrlSetData($txtRestartDark, $itxtRestartDark)

	; apply bot options -----------------------------------------------------------------

	If $ichkDisableSplash = 1 Then
		GUICtrlSetState($chkDisableSplash, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDisableSplash, $GUI_UNCHECKED)
	EndIf
	If $ichkVersion = 1 Then
		GUICtrlSetState($chkVersion, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkVersion, $GUI_UNCHECKED)
	EndIf
	; delete Files
	If $ichkDeleteLogs = 1 Then
		GUICtrlSetState($chkDeleteLogs, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeleteLogs, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtDeleteLogsDays, $iDeleteLogsDays)
	chkDeleteLogs()
	If $ichkDeleteTemp = 1 Then
		GUICtrlSetState($chkDeleteTemp, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeleteTemp, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtDeleteTempDays, $iDeleteTempDays)
	chkDeleteTemp()

	If $ichkDeleteLoots = 1 Then
		GUICtrlSetState($chkDeleteLoots, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDeleteLoots, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtDeleteLootsDays, $iDeleteLootsDays)
	chkDeleteLoots()

	If $ichkAutoStart = 1 Then
		GUICtrlSetState($chkAutoStart, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAutoStart, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtAutoStartDelay, $ichkAutoStartDelay)
	chkAutoStart()
	If $ichkLanguage = 1 Then
		GUICtrlSetState($ChkLanguage, $GUI_CHECKED)
	Else
		GUICtrlSetState($ChkLanguage, $GUI_UNCHECKED)
	EndIf
	If $iDisposeWindows = 1 Then
		GUICtrlSetState($chkDisposeWindows, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDisposeWindows, $GUI_UNCHECKED)
	EndIf
	chkDisposeWindows()
	_GUICtrlComboBox_SetCurSel($cmbDisposeWindowsCond, $icmbDisposeWindowsPos)
	GUICtrlSetData($txtWAOffsetX, $iWAOffsetX)
	GUICtrlSetData($txtWAOffsetY, $iWAOffsetY)
	;_GUICtrlComboBox_SetCurSel($cmbGUIStyle, $iGUIStyle)
	;debug
	If $debugClick = 1 Then
		GUICtrlSetState($chkDebugClick, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugClick, $GUI_UNCHECKED)
	EndIf


	If $DebugSetlog = 1 Then
		GUICtrlSetState($chkDebugSetlog, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugSetlog, $GUI_UNCHECKED)
	EndIf
	If $debugDisableZoomout = 1 Then
		GUICtrlSetState($chkDebugDisableZoomout, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugDisableZoomout, $GUI_UNCHECKED)
	EndIf
	If $debugDisableVillageCentering = 1 Then
		GUICtrlSetState($chkDebugDisableVillageCentering, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugDisableVillageCentering, $GUI_UNCHECKED)
	EndIf
	If $debugDeadbaseImage = 1 Then
		GUICtrlSetState($chkDebugDeadbaseImage, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugDeadbaseImage, $GUI_UNCHECKED)
	EndIf
	If $DebugSmartZap = 1 Then
		GUICtrlSetState($chkDebugSmartZap, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugSmartZap, $GUI_UNCHECKED)
	EndIf
	If $DebugSX = 1 Then
		GUICtrlSetState($chkDebugSX, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugSX, $GUI_UNCHECKED)
	EndIf
	If $debugOcr = 1 Then
		GUICtrlSetState($chkDebugOcr, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugOcr, $GUI_UNCHECKED)
	EndIf
	If $DebugImageSave = 1 Then
		GUICtrlSetState($chkDebugImageSave, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugImageSave, $GUI_UNCHECKED)
	EndIf
	If $debugBuildingPos = 1 Then
		GUICtrlSetState($chkdebugBuildingPos, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkdebugBuildingPos, $GUI_UNCHECKED)
	EndIf
	If $debugsetlogTrain = 1 Then
		GUICtrlSetState($chkdebugTrain, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkdebugTrain, $GUI_UNCHECKED)
	EndIf
	If $debugOCRdonate = 1 Then
		GUICtrlSetState($chkdebugOCRDonate, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkdebugOCRDonate, $GUI_UNCHECKED)
	EndIf
	If $debugAttackCSV = 1 Then
		GUICtrlSetState($chkdebugAttackCSV, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkdebugAttackCSV, $GUI_UNCHECKED)
	EndIf
	If $makeIMGCSV = 1 Then
		GUICtrlSetState($chkmakeIMGCSV, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkmakeIMGCSV, $GUI_UNCHECKED)
	EndIf

	If $ichkUseQTrain = 1 Then
		GUICtrlSetState($hChk_UseQTrain, $GUI_CHECKED)
	Else
		GUICtrlSetState($hChk_UseQTrain, $GUI_UNCHECKED)
	EndIf
	chkUseQTrain()

	If $ichkForceBrewBeforeAttack = 1 Then
		GUICtrlSetState($chkForceBrewBeforeAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkForceBrewBeforeAttack, $GUI_UNCHECKED)
	EndIf

	If $ichkFixClanCastle = 1 Then
		GUICtrlSetState($chkFixClanCastle, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkFixClanCastle, $GUI_UNCHECKED)
	EndIf

	;multilanguage
	LoadLanguagesComboBox() ; recreate combo box values

	;distributors
	SetCurSelCmbCOCDistributors()

	;Advanced
	If $iUseRandomClick = 1 Then
		GUICtrlSetState($chkUseRandomClick, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUseRandomClick, $GUI_UNCHECKED)
	EndIf

	If $ichkAddIdleTime = 1 Then
		GUICtrlSetState($chkAddDelayIdlePhaseEnable, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAddDelayIdlePhaseEnable, $GUI_UNCHECKED)
	EndIf
	chkAddDelayIdlePhaseEnable()

	;screenshot
	If $iScreenshotType = 1 Then
		GUICtrlSetState($chkScreenshotType, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkScreenshotType, $GUI_UNCHECKED)
	EndIf

	If $ichkScreenshotHideName = 1 Then
		GUICtrlSetState($chkScreenshotHideName, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkScreenshotHideName, $GUI_UNCHECKED)
	EndIf


	If $iVSDelay > $iMaxVSDelay Then $iMaxVSDelay = $iVSDelay ; check for illegal condition

	GUICtrlSetData($sldVSDelay, $iVSDelay)
	GUICtrlSetData($lblVSDelay, $iVSDelay)
	GUICtrlSetData($sldMaxVSDelay, $iMaxVSDelay)
	GUICtrlSetData($lblMaxVSDelay, $iMaxVSDelay)

	GUICtrlSetData($sldTrainITDelay, $isldTrainITDelay)
	sldTrainITDelay()
	GUICtrlSetData($lbltxtTrainITDelayTime, $isldTrainITDelay & " ms")

	If $AlertSearch = 1 Then
		GUICtrlSetState($chkAlertSearch, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAlertSearch, $GUI_UNCHECKED)
	EndIf


	If $devmode = 1 Then
		GUICtrlSetState($chkDebugSetlog, $GUI_ENABLE)
		GUICtrlSetState($chkDebugOcr, $GUI_ENABLE)
		GUICtrlSetState($chkDebugImageSave, $GUI_ENABLE)
		GUICtrlSetState($chkdebugBuildingPos, $GUI_ENABLE)
		GUICtrlSetState($chkdebugTrain, $GUI_ENABLE)
		GUICtrlSetState($chkmakeIMGCSV, $GUI_ENABLE)
		GUICtrlSetState($chkdebugAttackCSV, $GUI_ENABLE)
		GUICtrlSetState($chkDebugSmartZap, $GUI_ENABLE)
		GUICtrlSetState($chkDebugSX, $GUI_ENABLE)
;~ 		GUICtrlSetState($btnTestVillage, $GUI_SHOW)
	EndIf

	; boost barracks ---------------------------------------------------------------------
	_GUICtrlComboBox_SetCurSel($cmbQuantBoostBarracks, $icmbQuantBoostBarracks)
	_GUICtrlComboBox_SetCurSel($cmbBoostBarracks, $icmbBoostBarracks)
	_GUICtrlComboBox_SetCurSel($cmbBoostSpellFactory, $icmbBoostSpellFactory)
	_GUICtrlComboBox_SetCurSel($cmbBoostDarkSpellFactory, $icmbBoostDarkSpellFactory)
	_GUICtrlComboBox_SetCurSel($cmbBoostBarbarianKing, $icmbBoostBarbarianKing)
	_GUICtrlComboBox_SetCurSel($cmbBoostArcherQueen, $icmbBoostArcherQueen)
	_GUICtrlComboBox_SetCurSel($cmbBoostWarden, $icmbBoostWarden)
	For $i = 0 To 23
		If $iPlannedBoostBarracksHours[$i] = 1 Then
			GUICtrlSetState(Eval("chkBoostBarracksHours" & $i), $GUI_CHECKED)
		Else
			GUICtrlSetState(Eval("chkBoostBarracksHours" & $i), $GUI_UNCHECKED)
		EndIf
	Next

	; search reduction ---------------------------------------------------------------------
	GUICtrlSetData($txtSearchReduceCount, $ReduceCount)
	GUICtrlSetData($txtSearchReduceGold, $ReduceGold)
	GUICtrlSetData($txtSearchReduceElixir, $ReduceElixir)
	GUICtrlSetData($txtSearchReduceGoldPlusElixir, $ReduceGoldPlusElixir)
	GUICtrlSetData($txtSearchReduceDark, $ReduceDark)
	GUICtrlSetData($txtSearchReduceTrophy, $ReduceTrophy)

	; th bully ------------------------------------------------------------------------------
	GUICtrlSetData($txtATBullyMode, $ATBullyMode)
	_GUICtrlComboBox_SetCurSel($cmbYourTH, $YourTH)
	If $iTHBullyAttackMode = 0 Then
		GUICtrlSetState($radUseDBAttack, $GUI_CHECKED)
	ElseIf $iTHBullyAttackMode = 1 Then
		GUICtrlSetState($radUseLBAttack, $GUI_CHECKED)
	EndIf

	; tropies -------------------------------------------------------------------------------
	If $iChkTrophyRange = 1 Then
		GUICtrlSetState($chkTrophyRange, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrophyRange, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txtMaxTrophy, $itxtMaxTrophy)
	GUICtrlSetData($txtdropTrophy, $itxtdropTrophy)

	If $iChkTrophyHeroes = 1 Then
		GUICtrlSetState($chkTrophyHeroes, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrophyHeroes, $GUI_UNCHECKED)
	EndIf
	chkTrophyHeroes()
	_GUICtrlComboBox_SetCurSel($cmbTrophyHeroesPriority, $iCmbTrophyHeroesPriority)
	If $iChkTrophyAtkDead = 1 Then
		GUICtrlSetState($chkTrophyAtkDead, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTrophyAtkDead, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtDTArmyMin, $itxtDTArmyMin)
	chkTrophyRange()

	; weakbase --------------------------------------------------------------------------
	_GUICtrlComboBox_SetCurSel($cmbWeakMortar[$DB], $iCmbWeakMortar[$DB])
	_GUICtrlComboBox_SetCurSel($cmbWeakWizTower[$DB], $iCmbWeakWizTower[$DB])
	_GUICtrlComboBox_SetCurSel($cmbWeakAirDefense[$DB], $iCmbWeakAirDefense[$DB])
	_GUICtrlComboBox_SetCurSel($cmbWeakXbow[$DB], $iCmbWeakXbow[$DB])
	_GUICtrlComboBox_SetCurSel($cmbWeakInferno[$DB], $iCmbWeakInferno[$DB])
	_GUICtrlComboBox_SetCurSel($cmbWeakEagle[$DB], $iCmbWeakEagle[$DB])
	chkDBWeakBase()
	_GUICtrlComboBox_SetCurSel($cmbWeakMortar[$LB], $iCmbWeakMortar[$LB])
	_GUICtrlComboBox_SetCurSel($cmbWeakWizTower[$LB], $iCmbWeakWizTower[$LB])
	_GUICtrlComboBox_SetCurSel($cmbWeakAirDefense[$LB], $iCmbWeakAirDefense[$LB])
	_GUICtrlComboBox_SetCurSel($cmbWeakXbow[$LB], $iCmbWeakXbow[$LB])
	_GUICtrlComboBox_SetCurSel($cmbWeakInferno[$LB], $iCmbWeakInferno[$LB])
	_GUICtrlComboBox_SetCurSel($cmbWeakEagle[$LB], $iCmbWeakEagle[$LB])
	chkABWeakBase()

	; end battle options AB--------------------------------------------------------------
	If $DESideEB = 1 Then
		GUICtrlSetState($chkDESideEB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDESideEB, $GUI_UNCHECKED)
	EndIf
	chkDESideEB()
	GUICtrlSetData($txtDELowEndMin, $DELowEndMin)

	If $DisableOtherEBO = 1 Then
		GUICtrlSetState($chkDisableOtherEBO, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDisableOtherEBO, $GUI_UNCHECKED)
	EndIf

	If $DEEndOneStar = 1 Then
		GUICtrlSetState($chkDEEndOneStar, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDEEndOneStar, $GUI_UNCHECKED)
	EndIf

	If $DEEndBk = 1 Then
		GUICtrlSetState($chkDEEndBk, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDEEndBk, $GUI_UNCHECKED)
	EndIf

	If $DEEndAq = 1 Then
		GUICtrlSetState($chkDEEndAq, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDEEndAq, $GUI_UNCHECKED)
	EndIf

	; milking ---------------------------------------------------------------------------
	;1. elixir Collectors Minimum Level
	If UBound($MilkFarmElixirParam) = 9 Then
		For $i = 0 To UBound($MilkFarmElixirParam) - 1
			_GUICtrlComboBox_SetCurSel(Eval("cmbMilkLvl" & $i + 4), $MilkFarmElixirParam[$i] + 1)
		Next
	Else
		For $i = 0 To 9 - 1
			_GUICtrlComboBox_SetCurSel(Eval("cmbMilkLvl" & $i + 4), 0)
		Next
	EndIf

	;2 If Elixir Collectors Found, Then
	If $MilkFarmLocateElixir = 1 Then
		GUICtrlSetState($chkAtkElixirExtractors, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAtkElixirExtractors, $GUI_UNCHECKED)
	EndIf

	If $MilkFarmLocateMine = 1 Then
		GUICtrlSetState($chkAtkGoldMines, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAtkGoldMines, $GUI_UNCHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbAtkGoldMinesLevel, $MilkFarmMineParam - 1)

	If $MilkFarmLocateDrill = 1 Then
		GUICtrlSetState($chkAtkDarkDrills, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAtkDarkDrills, $GUI_UNCHECKED)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbAtkDarkDrillsLevel, $MilkFarmDrillParam - 1)

	;3 Only attack If
	_GUICtrlComboBox_SetCurSel($cmbRedlineResDistance, $MilkFarmResMaxTilesFromBorder)

	If $MilkFarmAttackElixirExtractors = 1 Then
		GUICtrlSetState($chkAttackMinesifElixir, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackMinesifElixir, $GUI_UNCHECKED)
	EndIf
	If $MilkFarmAttackGoldMines = 1 Then
		GUICtrlSetState($chkAttackMinesifGold, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackMinesifGold, $GUI_UNCHECKED)
	EndIf
	If $MilkFarmAttackDarkDrills = 1 Then
		GUICtrlSetState($chkAttackMinesifDarkElixir, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackMinesifDarkElixir, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtAttackMinesIfGold, $MilkFarmLimitGold)
	GUICtrlSetData($txtAttackMinesifElixir, $MilkFarmLimitElixir)
	GUICtrlSetData($txtAttackMinesifDarkElixir, $MilkFarmLimitDark)
	chkAttackMinesifGold()
	chkAttackMinesifelixir()
	chkAttackMinesifdarkElixir()


	GUICtrlSetData($txtLowerXWave, $MilkFarmTroopForWaveMin)
	GUICtrlSetData($txtUpperXWave, $MilkFarmTroopForWaveMax)
	GUICtrlSetData($txtMaxWaves, $MilkFarmTroopMaxWaves)
	GUICtrlSetData($txtLowerDelayWaves, $MilkFarmDelayFromWavesMin)
	GUICtrlSetData($txtUpperDelayWaves, $MilkFarmDelayFromWavesMax)

	GUICtrlSetData($txtMaxTilesMilk, $MilkFarmTHMaxTilesFromBorder)

	Dim $FileSearch, $NewFile
	$FileSearch = FileFindFirstFile($dirTHSnipesAttacks & "\*.csv")
	Dim $output = ""
	While True
		$NewFile = FileFindNextFile($FileSearch)
		If @error Then ExitLoop
		$output = $output & StringLeft($NewFile, StringLen($NewFile) - 4) & "|"
	WEnd
	FileClose($FileSearch)
	;remove last |
	$output = StringLeft($output, StringLen($output) - 1)
	;reset combo box
	;_GUICtrlComboBox_ResetContent($cmbAttackTHType)
	;set combo box
	GUICtrlSetData($cmbMilkSnipeAlgorithm, $output)
	_GUICtrlComboBox_SetCurSel($cmbMilkSnipeAlgorithm, _GUICtrlComboBox_FindStringExact($cmbMilkSnipeAlgorithm, $MilkFarmAlgorithmTh))

	If $MilkFarmSnipeEvenIfNoExtractorsFound = 1 Then
		GUICtrlSetState($chkSnipeIfNoElixir, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSnipeIfNoElixir, $GUI_UNCHECKED)
	EndIf


	If $devmode = 1 Then
		GUICtrlSetState($grpMilkingDebug, $GUI_SHOW)
		GUICtrlSetState($chkMilkingDebugIMG, $GUI_SHOW)
		GUICtrlSetState($chkMilkingDebugVillage, $GUI_SHOW)
		GUICtrlSetState($chkMilkingVillageDebugIMG, $GUI_SHOW)
		GUICtrlSetState($chkMilkingDebugFullSearch, $GUI_SHOW)
		GUICtrlSetState($chkDebugSmartZap, $GUI_SHOW)
		GUICtrlSetState($chkDebugSX, $GUI_SHOW)


		If $debugresourcesoffset = 1 Then
			GUICtrlSetState($chkMilkingDebugIMG, $GUI_CHECKED)
		Else
			GUICtrlSetState($chkMilkingDebugIMG, $GUI_UNCHECKED)
		EndIf

		If $debugMilkingIMGmake = 1 Then
			GUICtrlSetState($chkMilkingDebugVillage, $GUI_CHECKED)
		Else
			GUICtrlSetState($chkMilkingDebugVillage, $GUI_UNCHECKED)
		EndIf

		If $continuesearchelixirdebug = 1 Then
			GUICtrlSetState($chkMilkingDebugFullSearch, $GUI_CHECKED)
		Else
			GUICtrlSetState($chkMilkingDebugFullSearch, $GUI_UNCHECKED)
		EndIf


	EndIf

	If $MilkFarmForcetolerance = 1 Then
		GUICtrlSetState($chkMilkFarmForcetolerance, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMilkFarmForcetolerance, $GUI_UNCHECKED)
	EndIf
	chkMilkFarmForcetolerance()
	GUICtrlSetData($txtMilkFarmForcetolerancenormal, $MilkFarmForcetolerancenormal)
	GUICtrlSetData($txtMilkFarmForcetoleranceboosted, $MilkFarmForcetoleranceboosted)
	GUICtrlSetData($txtMilkFarmForcetolerancedestroyed, $MilkFarmForcetolerancedestroyed)
	;MsgBox("","", "apply " & $MilkFarmForcetolerancenormal & " " & $MilkFarmForcetoleranceboosted & " " & $MilkFarmForcetolerancedestroyed)

	If $MilkAttackType = 1 Then
		_GUICtrlComboBox_SetCurSel($cmbMilkAttackType, 1)
	Else
		_GUICtrlComboBox_SetCurSel($cmbMilkAttackType, 0)
	EndIf

	If $MilkingAttackCheckStructureDestroyedBeforeAttack = 1 Then
		GUICtrlSetState($chkStructureDestroyedBeforeAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkStructureDestroyedBeforeAttack, $GUI_UNCHECKED)
	EndIf

	If $MilkingAttackCheckStructureDestroyedAfterAttack = 1 Then
		GUICtrlSetState($chkStructureDestroyedAfterAttack, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkStructureDestroyedAfterAttack, $GUI_UNCHECKED)
	EndIf

	If $MilkingAttackDropGoblinAlgorithm = 1 Then
		_GUICtrlComboBox_SetCurSel($cmbMilkingAttackDropGoblinAlgorithm, 1)
	Else
		_GUICtrlComboBox_SetCurSel($cmbMilkingAttackDropGoblinAlgorithm, 0)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbStructureOrder, $MilkingAttackStructureOrder)

	;scripted attack apply

	If $MilkAttackAfterScriptedAtk = 1 Then
		GUICtrlSetState($chkMilkAfterAttackScripted, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMilkAfterAttackScripted, $GUI_UNCHECKED)
	EndIf
	;chkMilkAfterAttackStandard()
	PopulateComboMilkingCSVScriptsFiles()

	Local $tempindex = _GUICtrlComboBox_FindStringExact($cmbMilkingCSVScriptName, $MilkAttackCSVscript)
	If $tempindex = -1 Then
		$tempindex = 0
		Setlog("Previous saved Milking Scripted Attack not found (deleted, renamed?)", $COLOR_ERROR)
		Setlog("Automatically setted a default script, please check your config", $COLOR_ERROR)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbMilkingCSVScriptName, $tempindex)

	If $MilkAttackAfterTHSnipe = 1 Then
		GUICtrlSetState($chkMilkAfterAttackTHSnipe, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkMilkAfterAttackTHSnipe, $GUI_UNCHECKED)
	EndIf
	chkMilkAfterAttackTHSnipe()

	; standard attack algorithm option --------------------------------------------------
	_GUICtrlComboBox_SetCurSel($cmbStandardAlgorithmDB, $iCmbStandardAlgorithm[$DB])
	_GUICtrlComboBox_SetCurSel($cmbDeployDB, $iChkDeploySettings[$DB])
	_GUICtrlComboBox_SetCurSel($cmbUnitDelayDB, $iCmbUnitDelay[$DB])
	_GUICtrlComboBox_SetCurSel($cmbWaveDelayDB, $iCmbWaveDelay[$DB])
	If $iChkRandomspeedatk[$DB] = 1 Then
		GUICtrlSetState($chkRandomSpeedAtkDB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkRandomSpeedAtkDB, $GUI_UNCHECKED)
	EndIf
	chkRandomSpeedAtkDB()
	If $iChkRedArea[$DB] = 1 Then
		GUICtrlSetState($chkSmartAttackRedAreaDB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSmartAttackRedAreaDB, $GUI_UNCHECKED)
	EndIf
	chkSmartAttackRedAreaDB()
	If $iChkSmartAttack[$DB][0] = 1 Then
		GUICtrlSetState($chkAttackNearGoldMineDB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackNearGoldMineDB, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbSmartDeployDB, $iCmbSmartDeploy[$DB])
	If $iChkSmartAttack[$DB][1] = 1 Then
		GUICtrlSetState($chkAttackNearElixirCollectorDB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackNearElixirCollectorDB, $GUI_UNCHECKED)
	EndIf
	If $iChkSmartAttack[$DB][2] = 1 Then
		GUICtrlSetState($chkAttackNearDarkElixirDrillDB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackNearDarkElixirDrillDB, $GUI_UNCHECKED)
	EndIf

	; SuperXP
	If $ichkEnableSuperXP = 1 Then
		GUICtrlSetState($chkEnableSuperXP, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkEnableSuperXP, $GUI_UNCHECKED)
	EndIf
	chkEnableSuperXP()
	If $irbSXTraining = 1 Then
		GUICtrlSetState($rbSXTraining, $GUI_CHECKED)
		GUICtrlSetState($rbSXIAttacking, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($rbSXIAttacking, $GUI_CHECKED)
		GUICtrlSetState($rbSXTraining, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtMaxXPtoGain, $itxtMaxXPtoGain)
	If $ichkSXBK = $HERO_KING Then
		GUICtrlSetState($chkSXBK, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSXBK, $GUI_UNCHECKED)
	EndIf
	If $ichkSXAQ = $HERO_QUEEN Then
		GUICtrlSetState($chkSXAQ, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSXAQ, $GUI_UNCHECKED)
	EndIf
	If $ichkSXGW = $HERO_WARDEN Then
		GUICtrlSetState($chkSXGW, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSXGW, $GUI_UNCHECKED)
	EndIf

;~ 	If $chkATH = 1 Then
;~ 		GUICtrlSetState($chkAttackTH, $GUI_CHECKED)
;~ 	Else
;~ 		GUICtrlSetState($chkAttackTH, $GUI_UNCHECKED)
;~ 	EndIf
	_GUICtrlComboBox_SetCurSel($cmbStandardAlgorithmAB, $iCmbStandardAlgorithm[$LB])
	_GUICtrlComboBox_SetCurSel($cmbDeployAB, $iChkDeploySettings[$LB])
	_GUICtrlComboBox_SetCurSel($cmbUnitDelayAB, $iCmbUnitDelay[$LB])
	_GUICtrlComboBox_SetCurSel($cmbWaveDelayAB, $iCmbWaveDelay[$LB])
	If $iChkRandomspeedatk[$LB] = 1 Then
		GUICtrlSetState($chkRandomSpeedAtkAB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkRandomSpeedAtkAB, $GUI_UNCHECKED)
	EndIf
	chkRandomSpeedAtkAB()
	If $iChkRedArea[$LB] = 1 Then
		GUICtrlSetState($chkSmartAttackRedAreaAB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSmartAttackRedAreaAB, $GUI_UNCHECKED)
	EndIf
	chkSmartAttackRedAreaAB()
	If $iChkSmartAttack[$LB][0] = 1 Then
		GUICtrlSetState($chkAttackNearGoldMineAB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackNearGoldMineAB, $GUI_UNCHECKED)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbSmartDeployAB, $iCmbSmartDeploy[$LB])
	If $iChkSmartAttack[$LB][1] = 1 Then
		GUICtrlSetState($chkAttackNearElixirCollectorAB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackNearElixirCollectorAB, $GUI_UNCHECKED)
	EndIf
	If $iChkSmartAttack[$LB][2] = 1 Then
		GUICtrlSetState($chkAttackNearDarkElixirDrillAB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkAttackNearDarkElixirDrillAB, $GUI_UNCHECKED)
	EndIf

	; attackcsv---------------------------------------------------------------------------
	PopulateComboScriptsFilesDB()
	PopulateComboScriptsFilesAB()
	Local $tempindex = _GUICtrlComboBox_FindStringExact($cmbScriptNameDB, $scmbDBScriptName)
	If $tempindex = -1 Then
		$tempindex = 0
		Setlog("Previous saved Scripted Attack not found (deleted, renamed?)", $COLOR_ERROR)
		Setlog("Automatically setted a default script, please check your config", $COLOR_ERROR)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbScriptNameDB, $tempindex)

	Local $tempindex = _GUICtrlComboBox_FindStringExact($cmbScriptNameAB, $scmbABScriptName)
	If $tempindex = -1 Then
		$tempindex = 0
		Setlog("Previous saved Scripted Attack not found (deleted, renamed?)", $COLOR_ERROR)
		Setlog("Automatically setted a default script, please check your config", $COLOR_ERROR)
	EndIf
	_GUICtrlComboBox_SetCurSel($cmbScriptNameAB, $tempindex)

	cmbScriptNameDB()
	cmbScriptNameAB()

	_GUICtrlComboBox_SetCurSel($cmbScriptRedlineImplDB, $iRedlineRoutine[$DB])
	_GUICtrlComboBox_SetCurSel($cmbScriptRedlineImplAB, $iRedlineRoutine[$LB])
	_GUICtrlComboBox_SetCurSel($cmbScriptDroplineDB, $iDroplineEdge[$DB])
	_GUICtrlComboBox_SetCurSel($cmbScriptDroplineAB, $iDroplineEdge[$LB])

	cmbScriptRedlineImplDB()
	cmbScriptRedlineImplAB()

	; collectors ---------------------------------------------------------------------------
	If $chkLvl6Enabled = 1 Then
		GUICtrlSetState($chkLvl6, $GUI_CHECKED)
		GUICtrlSetState($cmbLvl6, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkLvl6, $GUI_UNCHECKED)
		GUICtrlSetState($cmbLvl6, $GUI_DISABLE)
	EndIf
	If $chkLvl7Enabled = 1 Then
		GUICtrlSetState($chkLvl7, $GUI_CHECKED)
		GUICtrlSetState($cmbLvl7, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkLvl7, $GUI_UNCHECKED)
		GUICtrlSetState($cmbLvl7, $GUI_DISABLE)
	EndIf
	If $chkLvl8Enabled = 1 Then
		GUICtrlSetState($chkLvl8, $GUI_CHECKED)
		GUICtrlSetState($cmbLvl8, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkLvl8, $GUI_UNCHECKED)
		GUICtrlSetState($cmbLvl8, $GUI_DISABLE)
	EndIf
	If $chkLvl9Enabled = 1 Then
		GUICtrlSetState($chkLvl9, $GUI_CHECKED)
		GUICtrlSetState($cmbLvl9, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkLvl9, $GUI_UNCHECKED)
		GUICtrlSetState($cmbLvl9, $GUI_DISABLE)
	EndIf
	If $chkLvl10Enabled = 1 Then
		GUICtrlSetState($chkLvl10, $GUI_CHECKED)
		GUICtrlSetState($cmbLvl10, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkLvl10, $GUI_UNCHECKED)
		GUICtrlSetState($cmbLvl10, $GUI_DISABLE)
	EndIf
	If $chkLvl11Enabled = 1 Then
		GUICtrlSetState($chkLvl11, $GUI_CHECKED)
		GUICtrlSetState($cmbLvl11, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkLvl11, $GUI_UNCHECKED)
		GUICtrlSetState($cmbLvl11, $GUI_DISABLE)
	EndIf
	If $chkLvl12Enabled = 1 Then
		GUICtrlSetState($chkLvl12, $GUI_CHECKED)
		GUICtrlSetState($cmbLvl12, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkLvl12, $GUI_UNCHECKED)
		GUICtrlSetState($cmbLvl12, $GUI_DISABLE)
	EndIf

	_GUICtrlComboBox_SetCurSel($cmbLvl6, $cmbLvl6Fill)
	_GUICtrlComboBox_SetCurSel($cmbLvl7, $cmbLvl7Fill)
	_GUICtrlComboBox_SetCurSel($cmbLvl8, $cmbLvl8Fill)
	_GUICtrlComboBox_SetCurSel($cmbLvl9, $cmbLvl9Fill)
	_GUICtrlComboBox_SetCurSel($cmbLvl10, $cmbLvl10Fill)
	_GUICtrlComboBox_SetCurSel($cmbLvl11, $cmbLvl11Fill)
	_GUICtrlComboBox_SetCurSel($cmbLvl12, $cmbLvl12Fill)
	_GUICtrlComboBox_SetCurSel($cmbMinCollectorMatches, $iMinCollectorMatches - 1)

	GUICtrlSetData($sldCollectorTolerance, $toleranceOffset)
	checkCollectors()

	If $iDeadBaseDisableCollectorsFilter = 0 Then
		GUICtrlSetState($chkDeadBaseDisableCollectorsFilter, $GUI_UNCHECKED)
	Else
		GUICtrlSetState($chkDeadBaseDisableCollectorsFilter, $GUI_CHECKED)
	EndIf


	;Share Attack Settings----------------------------------------
	GUICtrlSetData($txtShareMinGold, $iShareminGold)
	GUICtrlSetData($txtShareMinElixir, $iShareminElixir)
	GUICtrlSetData($txtShareMinDark, $iShareminDark)
	GUICtrlSetData($txtShareMessage, $sShareMessage)


	; TH SNIPE AFTER DB AND LB ATTACK APPLY
	If $THSnipeBeforeDBEnable = 1 Then
		GUICtrlSetState($chkTHSnipeBeforeDBEnable, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTHSnipeBeforeDBEnable, $GUI_UNCHECKED)
	EndIf
	chkTHSnipeBeforeDBEnable()
	If $THSnipeBeforeLBEnable = 1 Then
		GUICtrlSetState($chkTHSnipeBeforeLBEnable, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTHSnipeBeforeLBEnable, $GUI_UNCHECKED)
	EndIf
	chkTHSnipeBeforeLBEnable()
	GUICtrlSetData($txtTHSnipeBeforeDBTiles, $THSnipeBeforeDBTiles)
	GUICtrlSetData($txtTHSnipeBeforeLBTiles, $THSnipeBeforeLBTiles)
	LoadDBSnipeAttacks() ; recreate combo box values
	_GUICtrlComboBox_SetCurSel($cmbTHSnipeBeforeDBScript, _GUICtrlComboBox_FindStringExact($cmbTHSnipeBeforeDBScript, $THSnipeBeforeDBScript))
	LoadABSnipeAttacks() ; recreate combo box values
	_GUICtrlComboBox_SetCurSel($cmbTHSnipeBeforeLBScript, _GUICtrlComboBox_FindStringExact($cmbTHSnipeBeforeLBScript, $THSnipeBeforeLBScript))

	;Wait For Spells
	If $iEnableSpellsWait[$DB] = 1 Then
		GUICtrlSetState($chkDBSpellsWait, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBSpellsWait, $GUI_UNCHECKED)
	EndIf
	chkDBSpellsWait()
	If $iEnableSpellsWait[$LB] = 1 Then
		GUICtrlSetState($chkABSpellsWait, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABSpellsWait, $GUI_UNCHECKED)
	EndIf
	chkABSpellsWait()

	If $iChkWaitForCastleSpell[$DB] = 1 Then
		GUICtrlSetState($chkDBWaitForCastleSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBWaitForCastleSpell, $GUI_UNCHECKED)
	EndIf
	If $iChkWaitForCastleSpell[$LB] = 1 Then
		GUICtrlSetState($chkABWaitForCastleSpell, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABWaitForCastleSpell, $GUI_UNCHECKED)
	EndIf
	If $iChkWaitForCastleTroops[$DB] = 1 Then
		GUICtrlSetState($chkDBWaitForCastleTroops, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDBWaitForCastleTroops, $GUI_UNCHECKED)
	EndIf
	If $iChkWaitForCastleTroops[$LB] = 1 Then
		GUICtrlSetState($chkABWaitForCastleTroops, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkABWaitForCastleTroops, $GUI_UNCHECKED)
	EndIf

	chkDBWaitForCCSpell()
	chkABWaitForCCSpell()

	_GUICtrlComboBox_SetCurSel($cmbDBWaitForCastleSpell, $iCmbWaitForCastleSpell[$DB])
	_GUICtrlComboBox_SetCurSel($cmbDBWaitForCastleSpell2, $iCmbWaitForCastleSpell2[$DB])
	_GUICtrlComboBox_SetCurSel($cmbABWaitForCastleSpell, $iCmbWaitForCastleSpell[$LB])
	_GUICtrlComboBox_SetCurSel($cmbABWaitForCastleSpell2, $iCmbWaitForCastleSpell2[$LB])

	cmbDBWaitForCCSpell()
	cmbABWaitForCCSpell()

	;Apply to switch Attack Standard after THSnipe End ==>
	If $ichkTSActivateCamps2 = 1 Then
		GUICtrlSetState($chkTSActivateCamps2, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkTSActivateCamps2, $GUI_UNCHECKED)
	EndIf
	chkTSActivateCamps2()
	GUICtrlSetData($txtTSArmyCamps2, $iEnableAfterArmyCamps2)

	;Train Radio/QuickTrain

	If $iChkQuickArmy1 = 1 Then
		GUICtrlSetState($hRadio_Army1, $GUI_CHECKED)
	Else
		GUICtrlSetState($hRadio_Army1, $GUI_UNCHECKED)
	EndIf

	If $iChkQuickArmy2 = 1 Then
		GUICtrlSetState($hRadio_Army2, $GUI_CHECKED)
	Else
		GUICtrlSetState($hRadio_Army2, $GUI_UNCHECKED)
	EndIf

	If $iChkQuickArmy3 = 1 Then
		GUICtrlSetState($hRadio_Army3, $GUI_CHECKED)
	Else
		GUICtrlSetState($hRadio_Army3, $GUI_UNCHECKED)
	EndIf

	; ============================================================================
	; ================================= SmartZap =================================
	; ============================================================================
	If $ichkSmartZap = 1 Then
		GUICtrlSetState($chkSmartLightSpell, $GUI_CHECKED)
		GUICtrlSetState($chkSmartZapDB, $GUI_ENABLE)
		GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_ENABLE)
		GUICtrlSetState($txtMinDark, $GUI_ENABLE)
		GUICtrlSetState($chkNoobZap, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkSmartZapDB, $GUI_DISABLE)
		GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_DISABLE)
		GUICtrlSetState($txtMinDark, $GUI_DISABLE)
		GUICtrlSetState($chkSmartLightSpell, $GUI_UNCHECKED)
		GUICtrlSetState($chkNoobZap, $GUI_DISABLE)
	EndIf
	If $ichkNoobZap = 1 Then
		GUICtrlSetState($chkNoobZap, $GUI_CHECKED)
		GUICtrlSetState($txtExpectedDE, $GUI_ENABLE)
	Else
		GUICtrlSetState($chkNoobZap, $GUI_UNCHECKED)
		GUICtrlSetState($txtExpectedDE, $GUI_DISABLE)
	EndIf
	If $ichkEarthQuakeZap = 1 Then
		GUICtrlSetState($chkEarthQuakeZap, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkEarthQuakeZap, $GUI_UNCHECKED)
	EndIf
	If $ichkSmartZapDB = 1 Then
		GUICtrlSetState($chkSmartZapDB, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSmartZapDB, $GUI_UNCHECKED)
	EndIf
	If $ichkSmartZapSaveHeroes = 1 Then
		GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkSmartZapSaveHeroes, $GUI_UNCHECKED)
	EndIf
	If $DebugSmartZap = 1 Then
		GUICtrlSetState($chkDebugSmartZap, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDebugSmartZap, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($txtMinDark, $itxtMinDE)
	GUICtrlSetData($txtExpectedDE, $itxtExpectedDE)
	; ============================================================================
	; ================================= SmartZap =================================
	; ============================================================================

	; ================================================== BOT HUMANIZATION PART ================================================== ;

	If $ichkUseBotHumanization = 1 Then
		GUICtrlSetState($chkUseBotHumanization, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUseBotHumanization, $GUI_UNCHECKED)
	EndIf

	If $ichkUseAltRClick = 1 Then
		GUICtrlSetState($chkUseAltRClick, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkUseAltRClick, $GUI_UNCHECKED)
	EndIf

	If $ichkCollectAchievements = 1 Then
		GUICtrlSetState($chkCollectAchievements, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkCollectAchievements, $GUI_UNCHECKED)
	EndIf

	If $ichkLookAtRedNotifications = 1 Then
		GUICtrlSetState($chkLookAtRedNotifications, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkLookAtRedNotifications, $GUI_UNCHECKED)
	EndIf

	chkUseBotHumanization()

	For $i = 0 To 12
		_GUICtrlComboBox_SetCurSel($cmbPriority[$i], $icmbPriority[$i])
	Next
	For $i = 0 To 1
		_GUICtrlComboBox_SetCurSel($cmbMaxSpeed[$i], $icmbMaxSpeed[$i])
	Next
	For $i = 0 To 1
		_GUICtrlComboBox_SetCurSel($cmbPause[$i], $icmbPause[$i])
	Next

	For $i = 0 To 1
		GUICtrlSetData($humanMessage[$i], $ihumanMessage[$i])
	Next

	_GUICtrlComboBox_SetCurSel($cmbMaxActionsNumber, $icmbMaxActionsNumber)

	cmbStandardReplay()
	cmbWarReplay()

	; ================================================== BOT HUMANIZATION END ================================================== ;

	; ================================================== TREASURY COLLECT PART ================================================== ;

	If $ichkEnableTrCollect = 1 Then
		GUICtrlSetState($chkEnableTrCollect, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkEnableTrCollect, $GUI_UNCHECKED)
	EndIf

	If $ichkForceTrCollect = 1 Then
		GUICtrlSetState($chkForceTrCollect, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkForceTrCollect, $GUI_UNCHECKED)
	EndIf

	If $ichkGoldTrCollect = 1 Then
		GUICtrlSetState($chkGoldTrCollect, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkGoldTrCollect, $GUI_UNCHECKED)
	EndIf

	If $ichkElxTrCollect = 1 Then
		GUICtrlSetState($chkElxTrCollect, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkElxTrCollect, $GUI_UNCHECKED)
	EndIf

	If $ichkDarkTrCollect = 1 Then
		GUICtrlSetState($chkDarkTrCollect, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkDarkTrCollect, $GUI_UNCHECKED)
	EndIf

	If $ichkFullGoldTrCollect = 1 Then
		GUICtrlSetState($chkFullGoldTrCollect, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkFullGoldTrCollect, $GUI_UNCHECKED)
	EndIf

	If $ichkFullElxTrCollect = 1 Then
		GUICtrlSetState($chkFullElxTrCollect, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkFullElxTrCollect, $GUI_UNCHECKED)
	EndIf

	If $ichkFullDarkTrCollect = 1 Then
		GUICtrlSetState($chkFullDarkTrCollect, $GUI_CHECKED)
	Else
		GUICtrlSetState($chkFullDarkTrCollect, $GUI_UNCHECKED)
	EndIf

	GUICtrlSetData($txtMinGoldTrCollect, $itxtMinGoldTrCollect)
	GUICtrlSetData($txtMinElxTrCollect, $itxtMinElxTrCollect)
	GUICtrlSetData($txtMinDarkTrCollect, $itxtMinDarkTrCollect)

	chkEnableTrCollect()

	; ================================================== TREASURY COLLECT END ================================================== ;

	#include "..\..\functions\DocOC++Team Mod's\Misc\applyConfig.au3"

	If $iGUIEnabled = 0 Then
		lblTotalCount2()
		; For $T = 0 To (UBound($TroopName) - 1)
		; Assign("itxtLev" & $TroopName[$T], Eval("itxtLev" & $TroopName[$T]) - 1)
		; Call("Lev" & $TroopName[$T])
		; If Eval("itxtLev" & $TroopName[$T]) < 0 Then Assign("itxtLev" & $TroopName[$T], 0)
		; Next
		; For $S = 0 To (UBound($SpellName) - 1)
		; Assign("itxtLev" & $SpellName[$S], Eval("itxtLev" & $SpellName[$S]) - 1)
		; Call("Lev" & $SpellName[$S])
		; If Eval("itxtLev" & $SpellName[$S]) < 0 Then Assign("itxtLev" & $SpellName[$S], 0)
		; Next
		$iGUIEnabled = 1
	EndIf

	; Reenabling window redraw - Keep this last....
	If $bRedrawAtExit Then SetRedrawBotWindow(True)
EndFunc   ;==>applyConfig
