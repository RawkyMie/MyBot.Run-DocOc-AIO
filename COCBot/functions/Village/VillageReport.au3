; #FUNCTION# ====================================================================================================================
; Name ..........: VillageReport
; Description ...: This function will report the village free and total builders, gold, elixir, dark elixir and gems.
;                  It will also update the statistics to the GUI.
; Syntax ........: VillageReport()
; Parameters ....: None
; Return values .: None
; Author ........: Hervidero (2015-feb-10)
; Modified ......: Safar46 (2015), Hervidero (2015), KnowJack (June-2015) , ProMac (2015), Sardo 2015-08, MonkeyHunter(6-2106)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Func VillageReport($bBypass = False, $bSuppressLog = False)
	PureClickP($aAway, 1, 0, "#0319") ;Click Away
	If _Sleep($iDelayVillageReport1) Then Return

	Switch $bBypass
		Case False
			If Not $bSuppressLog Then SetLog("Village Report", $COLOR_INFO)
		Case True
			If Not $bSuppressLog Then SetLog("Updating Village Resource Values", $COLOR_INFO)
		Case Else
			If Not $bSuppressLog Then SetLog("Village Report Error, You have been a BAD programmer!", $COLOR_ERROR)
	EndSwitch

	getBuilderCount($bSuppressLog) ; update builder data
	If _Sleep($iDelayRespond) Then Return

	; Separate Stats per Each Account - SwitchAcc Mode
	If $ichkSwitchAccount = 1 Then
		$g_iFreeBuilders[$CurrentAccount]  = $g_iFreeBuilderCount[$CurrentAccount]
		$g_iTotalBuilders[$CurrentAccount] = $g_iTotalBuilderCount[$CurrentAccount]
    EndIf


	$g_iTrophyCurrent[$CurrentAccount] = getTrophyMainScreen($aTrophies[0], $aTrophies[1])
	If Not $bSuppressLog Then Setlog(" [T]: " & _NumberFormat($g_iTrophyCurrent[$CurrentAccount]), $COLOR_SUCCESS)

	If _ColorCheck(_GetPixelColor(830, 150, True), Hex(0x000100, 6), 15) Then ; check if the village have a Dark Elixir Storage
		$g_iGoldCurrent[$CurrentAccount] = getResourcesMainScreen(696, 23)
		$g_iElixirCurrent[$CurrentAccount] = getResourcesMainScreen(696, 74)
		$g_iDarkCurrent[$CurrentAccount] =  getResourcesMainScreen(728, 123)
		$g_iGemAmount[$CurrentAccount] = getResourcesMainScreen(740, 171)
		
		;Incase of miss read of color ck or getResourcesMainScreen ocr of darkE on first run
		If $g_iDarkStart[$CurrentAccount] = 0 Or $g_iDarkStart[$CurrentAccount] = "" Then
			$g_iDarkStart[$CurrentAccount] = $g_iDarkCurrent[$CurrentAccount]
		EndIf
			
		
		
		If Not $bSuppressLog Then SetLog(" [G]: " & _NumberFormat($g_iGoldCurrent[$CurrentAccount]) & " [E]: " & _NumberFormat($g_iElixirCurrent[$CurrentAccount]) & " [D]: " & _NumberFormat($g_iDarkCurrent[$CurrentAccount]) & " [GEM]: " & _NumberFormat($g_iGemAmount[$CurrentAccount]), $COLOR_SUCCESS)

	; Separate Stats per Each Account - SwitchAcc Mode
		If $ichkSwitchAccount = 1 Then	; Separate Stats per Each Account - Switch Mode
			$g_iGoldNowSW[$CurrentAccount]	= $g_iGoldCurrent[$CurrentAccount]
			$g_iElixirNowSW[$CurrentAccount]= $g_iElixirCurrent[$CurrentAccount]
			$g_iDarkNowSW[$CurrentAccount]	= $g_iDarkCurrent[$CurrentAccount]
			$g_iGemNow[$CurrentAccount]		= $g_iGemAmount[$CurrentAccount]
		EndIf
	Else
		$g_iGoldCurrent[$CurrentAccount] = getResourcesMainScreen(701, 23)
		$g_iElixirCurrent[$CurrentAccount] = getResourcesMainScreen(701, 74)
		$g_iGemAmount[$CurrentAccount] = getResourcesMainScreen(719, 123)
		If Not $bSuppressLog Then SetLog(" [G]: " & _NumberFormat($g_iGoldCurrent[$CurrentAccount]) & " [E]: " & _NumberFormat($g_iElixirCurrent[$CurrentAccount]) & " [GEM]: " & _NumberFormat($g_iGemAmount[$CurrentAccount]), $COLOR_SUCCESS)

	; Separate Stats per Each Account - SwitchAcc Mode
		If $ichkSwitchAccount = 1 Then	; Separate Stats per Each Account - Switch Mode
			$g_iGoldNowSW[$CurrentAccount]	= $g_iGoldCurrent[$CurrentAccount]
			$g_iElixirNowSW[$CurrentAccount]= $g_iElixirCurrent[$CurrentAccount]
			$g_iGemNow[$CurrentAccount]		= $g_iGemAmount[$CurrentAccount]
		EndIf
	EndIf
	If $bBypass = False Then ; update stats
		UpdateStats()
	EndIf

	Local $i = 0
	While _ColorCheck(_GetPixelColor(819, 39, True), Hex(0xF8FCFF, 6), 20) = True ; wait for Builder/shop to close
		$i += 1
		If _Sleep($iDelayVillageReport1) Then Return
		If $i >= 20 Then ExitLoop
	WEnd

EndFunc   ;==>VillageReport
