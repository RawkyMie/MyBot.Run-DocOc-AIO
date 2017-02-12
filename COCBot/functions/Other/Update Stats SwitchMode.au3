; #FUNCTION# ====================================================================================================================
; Name ..........: UpdateStats
; Description ...: Additional functions for UpdateStats
; Syntax ........: UpdateStats()
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......:
; ===============================================================================================================================

Func UpdateStatsSwitchMode($bForceUpdateAll = False) ; UPDATES THE TAB MULTI STATS
	Local Static $g_iOLDGoldNowSW[9], $g_iOLDElixirNowSW[9], $g_iOLDDarkNowSW[9], $g_iOLDGemNowSW[9]
	Local Static $g_iOLDFreeBuilders[9], $g_sProfileName[9]

	If $bForceUpdateAll = True Or $g_sProfileName[$CurrentAccount] <> $sCurrProfile Or $CurrentAccount = 0 Then
		$g_sProfileName[$CurrentAccount] = $sCurrProfile
		GUICtrlSetData($g_grpVillageSW[$CurrentAccount], GetTranslated(603, 32, "Village") & ": " & $g_sProfileName[$CurrentAccount])
		If WinGetState(Eval($hGuiPopOut & $CurrentAccount)) <> -1 Then
			GUICtrlSetData($g_grpVillagePO[$CurrentAccount], GetTranslated(603, 32, "Village") & ": " & $g_sProfileName[$CurrentAccount])
		EndIf
	EndIf
	
    For $i = 1 To 8 ; Update time for all Accounts
		If $CurrentAccount = 0 Then $i = 0
	;THESE ARE UPDATE STATS IN TAB, NOT BELOW STATS
		GUICtrlSetData($g_lblHrStatsGoldSW[$CurrentAccount], _NumberFormat(Round($g_iGoldTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) )
		GUICtrlSetData($g_lblHrStatsElixirSW[$CurrentAccount], _NumberFormat(Round($g_iElixirTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) )
		GUICtrlSetData($g_lblHrStatsDarkSW[$CurrentAccount], _NumberFormat(Round($g_iDarkTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600 * 1000)) )
		If WinGetState(Eval($hGuiPopOut & $i)) <> -1 Then
			GUICtrlSetData($g_lblHrStatsGoldPO[$CurrentAccount], _NumberFormat(Round($g_iGoldTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) )
			GUICtrlSetData($g_lblHrStatsElixirPO[$CurrentAccount], _NumberFormat(Round($g_iElixirTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600)) )
			GUICtrlSetData($g_lblHrStatsDarkPO[$CurrentAccount], _NumberFormat(Round($g_iDarkTotal[$CurrentAccount] / (Int(TimerDiff($sTimer) + $iTimePassed)) * 3600 * 1000)) )
		EndIf
		If $CurrentAccount = 0 Then ExitLoop
	Next

; Update Stats TAB MULTI Just for Current Account, only the ones that have changed >> Faster
		If $bForceUpdateAll = True Or $g_iGoldCurrent[$CurrentAccount] <> $g_iOLDGoldNowSW[$CurrentAccount] Or $g_iGoldCurrent[$CurrentAccount] = "" Or $CurrentAccount = 0 Then
			GUICtrlSetData($g_lblGoldNowSW[$CurrentAccount], _NumberFormat($g_iGoldCurrent[$CurrentAccount]))
			GUICtrlSetData($g_lblGoldNowPO[$CurrentAccount], _NumberFormat($g_iGoldCurrent[$CurrentAccount]))

			$g_iOLDGoldNowSW[$CurrentAccount] = $g_iGoldCurrent[$CurrentAccount]
		EndIf

		If $bForceUpdateAll = True Or $g_iElixirCurrent[$CurrentAccount] <> $g_iOLDElixirNowSW[$CurrentAccount] Or $g_iElixirCurrent[$CurrentAccount] = "" Or $CurrentAccount = 0 Then
			GUICtrlSetData($g_lblElixirNowSW[$CurrentAccount], _NumberFormat($g_iElixirCurrent[$CurrentAccount]))
			GUICtrlSetData($g_lblElixirNowPO[$CurrentAccount], _NumberFormat($g_iElixirCurrent[$CurrentAccount]))

			$g_iOLDElixirNowSW[$CurrentAccount] = $g_iElixirCurrent[$CurrentAccount]
		EndIf

		If $bForceUpdateAll = True Or $g_iDarkCurrent[$CurrentAccount] <> $g_iOLDDarkNowSW[$CurrentAccount] Or $g_iDarkCurrent[$CurrentAccount] = "" Or $CurrentAccount = 0 Then
			If $g_iDarkStart[$CurrentAccount] <> "" Then
				GUICtrlSetData($g_lblDarkNowSW[$CurrentAccount], _NumberFormat($g_iDarkCurrent[$CurrentAccount]))
				GUICtrlSetData($g_lblDarkNowPO[$CurrentAccount], _NumberFormat($g_iDarkCurrent[$CurrentAccount]))

				$g_iOLDDarkNowSW[$CurrentAccount] = $g_iDarkCurrent[$CurrentAccount]
			EndIf
		EndIf

		If $bForceUpdateAll = True Or $g_iGemAmount[$CurrentAccount] <> $g_iOLDGemNowSW[$CurrentAccount] Or $g_iGemAmount[$CurrentAccount] = "" Or $CurrentAccount = 0 Then
			GUICtrlSetData($g_lblGemNowSW[$CurrentAccount], $g_iGemAmount[$CurrentAccount] )
			GUICtrlSetData($g_lblGemNowPO[$CurrentAccount], $g_iGemAmount[$CurrentAccount] )

			$g_iOLDGemNowSW[$CurrentAccount] = $g_iGemAmount[$CurrentAccount]
		EndIf

		If $bForceUpdateAll = True Or $g_iFreeBuilderCount[$CurrentAccount] <> $g_iOLDFreeBuilders[$CurrentAccount] Or $g_iFreeBuilderCount[$CurrentAccount] = "" Or $CurrentAccount = 0 Then
			GUICtrlSetData($g_lblBuilderNowSW[$CurrentAccount], $g_iFreeBuilderCount[$CurrentAccount] & "/" & $g_iTotalBuilderCount[$CurrentAccount])
			GUICtrlSetData($g_lblBuilderNowPO[$CurrentAccount], $g_iFreeBuilderCount[$CurrentAccount] & "/" & $g_iTotalBuilderCount[$CurrentAccount])

			$g_iOLDFreeBuilders[$CurrentAccount] = $g_iFreeBuilderCount[$CurrentAccount]
		EndIf

EndFunc   ;==>UpdateStatsForSwitchAcc

Func ResetStatsSwitchMode()
	Return
EndFunc   ;==>ResetStatsForSwitchAcc


