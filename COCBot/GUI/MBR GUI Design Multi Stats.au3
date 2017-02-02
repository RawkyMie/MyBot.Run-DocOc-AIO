; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file Includes GUI Design
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Ezeck (2017)
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Global $g_grpVillageSW[9], $g_lblPopOutSW[9]										;Static

Global $g_lblGoldNowSW[9], $g_lblElixirNowSW[9], $g_lblDarkNowSW[9]							; Values get Updated
Global $g_lblHrStatsGoldSW[9], $g_lblHrStatsElixirSW[9], $g_lblHrStatsDarkSW[9]				; Values get Updated

Global $g_icnGoldSW[9], $g_icnElixirSW[9], $g_icnDarkSW[9]							;Static
Global $g_lblUnitMeasureSW1[9], $g_lblUnitMeasureSW2[9], $g_lblUnitMeasureSW3[9]	;Static
Global $g_icnGemSW[9], $g_icnBuliderSW[9], $g_icnHourGlassSW[9]						;Static

Global $g_lblKingStatus[9], $g_lblQueenStatus[9], $g_lblWardenStatus[9]						; Values get Updated
Global $g_lblLabStatus[9],$g_lblGemNowSW[9], $g_lblBuilderNowSW[9], $g_lblTimeNowSW[9]		; Values get Updated


;==================eXPERMENTAL pOPOUT==============================
Global $g_grpVillagePO[9], $g_lblPopOutEX[9]										;Static

Global $g_lblGoldNowPO[9], $g_lblElixirNowPO[9], $g_lblDarkNowPO[9]							; Values get Updated
Global $g_lblHrStatsGoldPO[9], $g_lblHrStatsElixirPO[9], $g_lblHrStatsDarkPO[9]				; Values get Updated

Global $g_icnGoldPO[9], $g_icnElixirPO[9], $g_icnDarkPO[9]							;Static
Global $g_lblUnitMeasurePO1[9], $g_lblUnitMeasurePO2[9], $g_lblUnitMeasurePO3[9]	;Static
Global $g_icnGemPO[9], $g_icnBuliderPO[9], $g_icnHourGlassPO[9]						;Static

Global $g_lblKingStatusPO[9], $g_lblQueenStatusPO[9], $g_lblWardenStatusPO[9]				; Values get Updated
Global $g_lblLabStatusPO[9],$g_lblGemNowPO[9], $g_lblBuilderNowPO[9], $g_lblTimeNowPO[9]	; Values get Updated
;============================================================================

Local $x = -5, $y = 7
	
	$g_grpVillageSW[1] 			= GUICtrlCreateGroup("Account 1", $x + 16, $y + 18, 209, 97, BitOR($GUI_SS_DEFAULT_GROUP,$BS_FLAT))
		$g_lblGoldNowSW[1] 		= GUICtrlCreateLabel("", $x + 40, $y + 36, 68, 17, $SS_RIGHT)
		$g_lblElixirNowSW[1] 	= GUICtrlCreateLabel("", $x + 40, $y + 54, 68, 17, $SS_RIGHT)
		$g_lblDarkNowSW[1] 		= GUICtrlCreateLabel("", $x + 40, $y + 72, 68, 17, $SS_RIGHT)

		$g_icnGoldSW[1] 		= GUICtrlCreateIcon($pIconLib, $eIcnGold, 	$x + 112, $y + 34, 18, 18)
		$g_icnElixirSW[1] 		= GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 112, $y + 52, 18, 18)
		$g_icnDarkSW[1] 		= GUICtrlCreateIcon($pIconLib, $eIcnDark, 	$x + 112, $y + 70, 18, 18)

		$g_lblHrStatsGoldSW[1] 	= GUICtrlCreateLabel("", $x + 130, $y + 36, 43, 17, $SS_RIGHT)
		$g_lblHrStatsElixirSW[1]= GUICtrlCreateLabel("", $x + 130, $y + 54, 43, 17, $SS_RIGHT)
		$g_lblHrStatsDarkSW[1] 	= GUICtrlCreateLabel("", $x + 130, $y + 72, 43, 17, $SS_RIGHT)

		$g_lblUnitMeasureSW1[1] = GUICtrlCreateLabel("K/Hour", 	$x + 176, $y + 36, 45, 17)
		$g_lblUnitMeasureSW2[1] = GUICtrlCreateLabel("K/Hour", 	$x + 176, $y + 54, 45, 17)
		$g_lblUnitMeasureSW3[1] = GUICtrlCreateLabel("/Hour", 	$x + 183, $y + 72, 37, 17)

		$g_icnGemSW[1] 			= GUICtrlCreateIcon($pIconLib, $eIcnGem, 		$x + 76,  $y + 90, 18, 18)
		$g_icnBuliderSW[1] 		= GUICtrlCreateIcon($pIconLib, $eIcnBuilder, 	$x + 126, $y + 90, 18, 18)
		$g_icnHourGlassSW[1] 	= GUICtrlCreateIcon($pIconLib, $eIcnHourGlass, 	$x + 204, $y + 90, 18, 18)

		$g_lblKingStatus[1]     = GUICtrlCreateLabel("K", 		$x + 22,  $y + 36,  12, 14, $SS_CENTER)
		$g_lblQueenStatus[1]    = GUICtrlCreateLabel("Q", 		$x + 22,  $y + 54,  12, 14, $SS_CENTER)
		$g_lblWardenStatus[1]   = GUICtrlCreateLabel("W", 		$x + 22,  $y + 72,  12, 14, $SS_CENTER)
		$g_lblLabStatus[1]      = GUICtrlCreateLabel("Lab", 	$x + 22,  $y + 93, 21, 14, $SS_RIGHT)

		$g_lblGemNowSW[1] 		= GUICtrlCreateLabel("", 		$x + 35,  $y + 93, 39, 17, $SS_RIGHT)
		$g_lblBuilderNowSW[1] 	= GUICtrlCreateLabel("", 		$x + 93,  $y + 93, 32, 17, $SS_RIGHT)
		$g_lblTimeNowSW[1] 		= GUICtrlCreateLabel("No Data", $x + 146, $y + 93, 58, 17, $SS_CENTER)
		
		$g_lblPopOutSW[1] 		= GUICtrlCreateIcon($pIconLib, $eIcnMove, 		$x + 208,  $y + 27, 12, 12)
			GUICtrlSetOnEvent($g_lblPopOutSW[1],"PopOut1")
			
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$g_grpVillageSW[2] 			= GUICtrlCreateGroup("Account 2", $x + 16, $y + 120, 209, 97, BitOR($GUI_SS_DEFAULT_GROUP,$BS_FLAT))
		$g_lblGoldNowSW[2] 		= GUICtrlCreateLabel("", $x + 40, $y + 138, 68, 17, $SS_RIGHT)
		$g_lblElixirNowSW[2] 	= GUICtrlCreateLabel("", $x + 40, $y + 156, 68, 17, $SS_RIGHT)
		$g_lblDarkNowSW[2] 		= GUICtrlCreateLabel("", $x + 40, $y + 174, 68, 17, $SS_RIGHT)

		$g_icnGoldSW[2] 		= GUICtrlCreateIcon($pIconLib, $eIcnGold, 	$x + 112, $y + 136, 18, 18)
		$g_icnElixirSW[2] 		= GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 112, $y + 154, 18, 18)
		$g_icnDarkSW[2] 		= GUICtrlCreateIcon($pIconLib, $eIcnDark, 	$x + 112, $y + 172, 18, 18)

		$g_lblHrStatsGoldSW[2] 	= GUICtrlCreateLabel("", $x + 130, $y + 138, 43, 17, $SS_RIGHT)
		$g_lblHrStatsElixirSW[2]= GUICtrlCreateLabel("", $x + 130, $y + 156, 43, 17, $SS_RIGHT)
		$g_lblHrStatsDarkSW[2] 	= GUICtrlCreateLabel("", $x + 131, $y + 174, 43, 17, $SS_RIGHT)

		$g_lblUnitMeasureSW1[2] = GUICtrlCreateLabel("K/Hour", 	$x + 176, $y + 138, 45, 17)
		$g_lblUnitMeasureSW2[2] = GUICtrlCreateLabel("K/Hour", 	$x + 176, $y + 156, 45, 17)
		$g_lblUnitMeasureSW3[2] = GUICtrlCreateLabel("/Hour", 	$x + 183, $y + 174, 37, 17)

		$g_icnGemSW[2] 			= GUICtrlCreateIcon($pIconLib, $eIcnGem, 		$x + 76,  $y + 192, 18, 18)
		$g_icnBuliderSW[2]		= GUICtrlCreateIcon($pIconLib, $eIcnBuilder, 	$x + 126, $y + 192, 18, 18)
		$g_icnHourGlassSW[2] 	= GUICtrlCreateIcon($pIconLib, $eIcnHourGlass, 	$x + 204, $y + 192, 18, 18)

		$g_lblKingStatus[2]     = GUICtrlCreateLabel("K", 		$x + 22,  $y + 138,  12, 14, $SS_CENTER)
		$g_lblQueenStatus[2]    = GUICtrlCreateLabel("Q", 		$x + 22,  $y + 156,  12, 14, $SS_CENTER)
		$g_lblWardenStatus[2]   = GUICtrlCreateLabel("W", 		$x + 22,  $y + 174,  12, 14, $SS_CENTER)
		$g_lblLabStatus[2]      = GUICtrlCreateLabel("Lab", 	$x + 22,  $y + 195, 21, 14, $SS_RIGHT)

		$g_lblGemNowSW[2] 		= GUICtrlCreateLabel("", 		$x + 35,  $y + 195, 39, 17, $SS_RIGHT)
		$g_lblBuilderNowSW[2] 	= GUICtrlCreateLabel("", 		$x + 93,  $y + 195, 32, 17, $SS_RIGHT)
		$g_lblTimeNowSW[2]	 	= GUICtrlCreateLabel("No Data", $x + 146, $y + 195, 58, 17, $SS_CENTER)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$g_grpVillageSW[3] 			= GUICtrlCreateGroup("Account 3", $x + 16, $y + 222, 209, 97, BitOR($GUI_SS_DEFAULT_GROUP,$BS_FLAT))
		$g_lblGoldNowSW[3] 		= GUICtrlCreateLabel("", $x + 40, $y + 240, 68, 17, $SS_RIGHT)
		$g_lblElixirNowSW[3] 	= GUICtrlCreateLabel("", $x + 40, $y + 258, 68, 17, $SS_RIGHT)
		$g_lblDarkNowSW[3] 		= GUICtrlCreateLabel("", $x + 40, $y + 276, 68, 17, $SS_RIGHT)

		$g_icnGoldSW[3] 		= GUICtrlCreateIcon($pIconLib, $eIcnGold, 	$x + 112, $y + 238, 18, 18)
		$g_icnElixirSW[3]		= GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 112, $y + 256, 18, 18)
		$g_icnDarkSW[3] 		= GUICtrlCreateIcon($pIconLib, $eIcnDark, 	$x + 112, $y + 274, 18, 18)

		$g_lblHrStatsGoldSW[3] 	= GUICtrlCreateLabel("", $x + 130, $y + 240, 43, 17, $SS_RIGHT)
		$g_lblHrStatsElixirSW[3]= GUICtrlCreateLabel("", $x + 130, $y + 258, 43, 17, $SS_RIGHT)
		$g_lblHrStatsDarkSW[3] 	= GUICtrlCreateLabel("", $x + 131, $y + 276, 43, 17, $SS_RIGHT)

		$g_lblUnitMeasureSW1[3] = GUICtrlCreateLabel("K/Hour", 	$x + 176, $y + 240, 45, 17)
		$g_lblUnitMeasureSW2[3] = GUICtrlCreateLabel("K/Hour", 	$x + 176, $y + 258, 45, 17)
		$g_lblUnitMeasureSW3[3] = GUICtrlCreateLabel("/Hour", 	$x + 183, $y + 276, 37, 17)

		$g_icnGemSW[3] 			= GUICtrlCreateIcon($pIconLib, $eIcnGem, 		$x + 76,  $y + 294, 18, 18)
		$g_icnBuliderSW[3]		= GUICtrlCreateIcon($pIconLib, $eIcnBuilder, 	$x + 126, $y + 294, 18, 18)
		$g_icnHourGlassSW[3] 	= GUICtrlCreateIcon($pIconLib, $eIcnHourGlass, 	$x + 204, $y + 294, 18, 18)

		$g_lblKingStatus[3]     = GUICtrlCreateLabel("K", 		$x + 22,  $y + 240,  12, 14, $SS_CENTER)
		$g_lblQueenStatus[3]    = GUICtrlCreateLabel("Q", 		$x + 22,  $y + 258,  12, 14, $SS_CENTER)
		$g_lblWardenStatus[3]   = GUICtrlCreateLabel("W", 		$x + 22,  $y + 276,  12, 14, $SS_CENTER)
		$g_lblLabStatus[3]      = GUICtrlCreateLabel("Lab", 	$x + 22,  $y + 297, 21, 14, $SS_RIGHT)

		$g_lblGemNowSW[3] 		= GUICtrlCreateLabel("", 		$x + 35,  $y + 297, 39, 17, $SS_RIGHT)
		$g_lblBuilderNowSW[3] 	= GUICtrlCreateLabel("", 		$x + 93,  $y + 297, 32, 17, $SS_RIGHT)
		$g_lblTimeNowSW[3]		= GUICtrlCreateLabel("No Data", $x + 146, $y + 297, 58, 17, $SS_CENTER)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$g_grpVillageSW[4] 			= GUICtrlCreateGroup("Account 4", $x + 16, $y + 324, 209, 97, BitOR($GUI_SS_DEFAULT_GROUP,$BS_FLAT))
		$g_lblGoldNowSW[4] 		= GUICtrlCreateLabel("", $x + 40, $y + 342, 68, 17, $SS_RIGHT)
		$g_lblElixirNowSW[4] 	= GUICtrlCreateLabel("", $x + 40, $y + 360, 68, 17, $SS_RIGHT)
		$g_lblDarkNowSW[4] 		= GUICtrlCreateLabel("", $x + 40, $y + 378, 68, 17, $SS_RIGHT)

		$g_icnGoldSW[4] 		= GUICtrlCreateIcon($pIconLib, $eIcnGold, 	$x + 112, $y + 340, 18, 18)
		$g_icnElixirSW[4] 		= GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 112, $y + 358, 18, 18)
		$g_icnDarkSW[4]			= GUICtrlCreateIcon($pIconLib, $eIcnDark, 	$x + 112, $y + 376, 18, 18)

		$g_lblHrStatsGoldSW[4] 	= GUICtrlCreateLabel("", $x + 130, $y + 342, 43, 17, $SS_RIGHT)
		$g_lblHrStatsElixirSW[4]= GUICtrlCreateLabel("", $x + 130, $y + 360, 43, 17, $SS_RIGHT)
		$g_lblHrStatsDarkSW[4] 	= GUICtrlCreateLabel("", $x + 131, $y + 378, 43, 17, $SS_RIGHT)

		$g_lblUnitMeasureSW1[4] = GUICtrlCreateLabel("K/Hour", $x + 176, $y + 342, 45, 17)
		$g_lblUnitMeasureSW2[4] = GUICtrlCreateLabel("K/Hour", $x + 176, $y + 360, 45, 17)
		$g_lblUnitMeasureSW3[4] = GUICtrlCreateLabel("/Hour",  $x + 183, $y + 378, 37, 17)

		$g_icnGemSW[4] 			= GUICtrlCreateIcon($pIconLib, $eIcnGem, 	   $x + 76,  $y + 396, 18, 18)
		$g_icnBuliderSW[4] 		= GUICtrlCreateIcon($pIconLib, $eIcnBuilder,   $x + 126, $y + 396, 18, 18)
		$g_icnHourGlassSW[4] 	= GUICtrlCreateIcon($pIconLib, $eIcnHourGlass, $x + 204, $y + 396, 18, 18)

		$g_lblKingStatus[4]     = GUICtrlCreateLabel("K", 		$x + 22,  $y + 342,  12, 14, $SS_CENTER)
		$g_lblQueenStatus[4]    = GUICtrlCreateLabel("Q", 		$x + 22,  $y + 360,  12, 14, $SS_CENTER)
		$g_lblWardenStatus[4]   = GUICtrlCreateLabel("W", 		$x + 22,  $y + 378,  12, 14, $SS_CENTER)
		$g_lblLabStatus[4]      = GUICtrlCreateLabel("Lab", 	$x + 22,  $y + 399, 21, 14, $SS_RIGHT)

		$g_lblGemNowSW[4] 		= GUICtrlCreateLabel("", 		$x + 35,  $y + 399, 39, 17, $SS_RIGHT)
		$g_lblBuilderNowSW[4] 	= GUICtrlCreateLabel("", 		$x + 93,  $y + 399, 32, 17, $SS_RIGHT)
		$g_lblTimeNowSW[4] 		= GUICtrlCreateLabel("No Data", $x + 146, $y + 399, 58, 17, $SS_CENTER)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	Local $x = -4
	$g_grpVillageSW[5] 			= GUICtrlCreateGroup("Account 5", $x + 232, $y + 18, 209, 97, BitOR($GUI_SS_DEFAULT_GROUP,$BS_FLAT))
		$g_lblGoldNowSW[5] 		= GUICtrlCreateLabel("", $x + 256, $y + 36, 68, 17, $SS_RIGHT)
		$g_lblElixirNowSW[5] 	= GUICtrlCreateLabel("", $x + 256, $y + 54, 68, 17, $SS_RIGHT)
		$g_lblDarkNowSW[5] 		= GUICtrlCreateLabel("", $x + 256, $y + 72, 68, 17, $SS_RIGHT)

		$g_icnGoldSW[5] 		= GUICtrlCreateIcon($pIconLib, $eIcnGold, 	$x + 328, $y + 34, 18, 18)
		$g_icnElixirSW[5] 		= GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 328, $y + 52, 18, 18)
		$g_icnDarkSW[5] 		= GUICtrlCreateIcon($pIconLib, $eIcnDark, 	$x + 328, $y + 70, 18, 18)

		$g_lblHrStatsGoldSW[5] 	= GUICtrlCreateLabel("", $x + 346, $y + 36, 43, 17, $SS_RIGHT)
		$g_lblHrStatsElixirSW[5]= GUICtrlCreateLabel("", $x + 346, $y + 54, 43, 17, $SS_RIGHT)
		$g_lblHrStatsDarkSW[5] 	= GUICtrlCreateLabel("", $x + 347, $y + 72, 43, 17, $SS_RIGHT)

		$g_lblUnitMeasureSW1[5] = GUICtrlCreateLabel("K/Hour", $x + 392, $y + 36, 45, 17)
		$g_lblUnitMeasureSW2[5] = GUICtrlCreateLabel("K/Hour", $x + 392, $y + 54, 45, 17)
		$g_lblUnitMeasureSW3[5] = GUICtrlCreateLabel("/Hour",  $x + 399, $y + 72, 37, 17)

		$g_icnGemSW[5] 			= GUICtrlCreateIcon($pIconLib, $eIcnGem, 		$x + 292, $y + 90, 18, 18)
		$g_icnBuliderSW[5]		= GUICtrlCreateIcon($pIconLib, $eIcnBuilder, 	$x + 342, $y + 90, 18, 18)
		$g_icnHourGlassSW[5]  	= GUICtrlCreateIcon($pIconLib, $eIcnHourGlass, 	$x + 420, $y + 90, 18, 18)

		$g_lblKingStatus[5]     = GUICtrlCreateLabel("K", 		$x + 238,  $y + 36,  12, 14, $SS_CENTER)
		$g_lblQueenStatus[5]    = GUICtrlCreateLabel("Q", 		$x + 238,  $y + 54,  12, 14, $SS_CENTER)
		$g_lblWardenStatus[5]   = GUICtrlCreateLabel("W", 		$x + 238,  $y + 72,  12, 14, $SS_CENTER)
		$g_lblLabStatus[5]      = GUICtrlCreateLabel("Lab", 	$x + 238, $y + 93, 21, 14, $SS_RIGHT)

		$g_lblGemNowSW[5] 		= GUICtrlCreateLabel("", 		$x + 251, $y + 93, 39, 17, $SS_RIGHT)
		$g_lblBuilderNowSW[5] 	= GUICtrlCreateLabel("", 		$x + 309, $y + 93, 32, 17, $SS_RIGHT)
		$g_lblTimeNowSW[5] 		= GUICtrlCreateLabel("No Data", $x + 362, $y + 93, 58, 17, $SS_CENTER)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$g_grpVillageSW[6] 			= GUICtrlCreateGroup("Account 6", $x + 232, $y + 120, 209, 97, BitOR($GUI_SS_DEFAULT_GROUP,$BS_FLAT))
		$g_lblGoldNowSW[6] 		= GUICtrlCreateLabel("", $x + 256, $y + 138, 68, 17, $SS_RIGHT)
		$g_lblElixirNowSW[6] 	= GUICtrlCreateLabel("", $x + 256, $y + 156, 68, 17, $SS_RIGHT)
		$g_lblDarkNowSW[6] 		= GUICtrlCreateLabel("", $x + 256, $y + 174, 68, 17, $SS_RIGHT)

		$g_icnGoldSW[6] 		= GUICtrlCreateIcon($pIconLib, $eIcnGold, 	$x + 328, $y + 136, 18, 18)
		$g_icnElixirSW[6] 		= GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 328, $y + 154, 18, 18)
		$g_icnDarkSW[6] 		= GUICtrlCreateIcon($pIconLib, $eIcnDark, 	$x + 328, $y + 172, 18, 18)

		$g_lblHrStatsGoldSW[6] 	= GUICtrlCreateLabel("", $x + 346, $y + 138, 43, 17, $SS_RIGHT)
		$g_lblHrStatsElixirSW[6]= GUICtrlCreateLabel("", $x + 346, $y + 156, 43, 17, $SS_RIGHT)
		$g_lblHrStatsDarkSW[6] 	= GUICtrlCreateLabel("", $x + 347, $y + 174, 43, 17, $SS_RIGHT)

		$g_lblUnitMeasureSW1[6] = GUICtrlCreateLabel("K/Hour", $x + 392, $y + 138, 45, 17)
		$g_lblUnitMeasureSW2[6] = GUICtrlCreateLabel("K/Hour", $x + 392, $y + 156, 45, 17)
		$g_lblUnitMeasureSW3[6] = GUICtrlCreateLabel("/Hour",  $x + 399, $y + 174, 37, 17)

		$g_icnGemSW[6] 			= GUICtrlCreateIcon($pIconLib, $eIcnGem, 		$x + 292, $y + 192, 18, 18)
		$g_icnBuliderSW[6] 		= GUICtrlCreateIcon($pIconLib, $eIcnBuilder, 	$x + 342, $y + 192, 18, 18)
		$g_icnHourGlassSW[6] 	= GUICtrlCreateIcon($pIconLib, $eIcnHourGlass, 	$x + 420, $y + 192, 18, 18)

		$g_lblKingStatus[6]     = GUICtrlCreateLabel("K", 		$x + 238,  $y + 138,  12, 14, $SS_CENTER)
		$g_lblQueenStatus[6]    = GUICtrlCreateLabel("Q", 		$x + 238,  $y + 156,  12, 14, $SS_CENTER)
		$g_lblWardenStatus[6]   = GUICtrlCreateLabel("W", 		$x + 238,  $y + 174,  12, 14, $SS_CENTER)
		$g_lblLabStatus[6]      = GUICtrlCreateLabel("Lab", 	$x + 238, $y + 195, 21, 14, $SS_RIGHT)

		$g_lblGemNowSW[6] 		= GUICtrlCreateLabel("", 		$x + 251, $y + 195, 39, 17, $SS_RIGHT)
		$g_lblBuilderNowSW[6] 	= GUICtrlCreateLabel("", 		$x + 309, $y + 195, 32, 17, $SS_RIGHT)
		$g_lblTimeNowSW[6] 		= GUICtrlCreateLabel("No Data", $x + 362, $y + 195, 58, 17, $SS_CENTER)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$g_grpVillageSW[7] 			= GUICtrlCreateGroup("Account 7", $x + 232, $y + 222, 209, 97, BitOR($GUI_SS_DEFAULT_GROUP,$BS_FLAT))
		$g_lblGoldNowSW[7] 		= GUICtrlCreateLabel("", $x + 256, $y + 240, 68, 17, $SS_RIGHT)
		$g_lblElixirNowSW[7] 	= GUICtrlCreateLabel("", $x + 256, $y + 258, 68, 17, $SS_RIGHT)
		$g_lblDarkNowSW[7] 		= GUICtrlCreateLabel("", $x + 256, $y + 276, 68, 17, $SS_RIGHT)

		$g_icnGoldSW[7] 		= GUICtrlCreateIcon($pIconLib, $eIcnGold, 	$x + 328, $y + 238, 18, 18)
		$g_icnElixirSW[7] 		= GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 328, $y + 256, 18, 18)
		$g_icnDarkSW[7] 		= GUICtrlCreateIcon($pIconLib, $eIcnDark, 	$x + 328, $y + 274, 18, 18)

		$g_lblHrStatsGoldSW[7] 	= GUICtrlCreateLabel("", $x + 346, $y + 240, 43, 17, $SS_RIGHT)
		$g_lblHrStatsElixirSW[7]= GUICtrlCreateLabel("", $x + 346, $y + 258, 43, 17, $SS_RIGHT)
		$g_lblHrStatsDarkSW[7] 	= GUICtrlCreateLabel("", $x + 347, $y + 276, 43, 17, $SS_RIGHT)

		$g_lblUnitMeasureSW1[7]	= GUICtrlCreateLabel("K/Hour", $x + 392, $y + 240, 45, 17)
		$g_lblUnitMeasureSW2[7] = GUICtrlCreateLabel("K/Hour", $x + 392, $y + 258, 45, 17)
		$g_lblUnitMeasureSW3[7] = GUICtrlCreateLabel("/Hour",  $x + 399, $y + 276, 37, 17)

		$g_icnGemSW[7] 			= GUICtrlCreateIcon($pIconLib, $eIcnGem, 		$x + 292, $y + 294, 18, 18)
		$g_icnBuliderSW[7] 		= GUICtrlCreateIcon($pIconLib, $eIcnBuilder, 	$x + 342, $y + 294, 18, 18)
		$g_icnHourGlassSW[7] 	= GUICtrlCreateIcon($pIconLib, $eIcnHourGlass,  $x + 420, $y + 294, 18, 18)

		$g_lblKingStatus[7]     = GUICtrlCreateLabel("K", 		$x + 238,  $y + 240,  12, 14, $SS_CENTER)
		$g_lblQueenStatus[7]    = GUICtrlCreateLabel("Q", 		$x + 238,  $y + 258,  12, 14, $SS_CENTER)
		$g_lblWardenStatus[7]   = GUICtrlCreateLabel("W", 		$x + 238,  $y + 276,  12, 14, $SS_CENTER)
		$g_lblLabStatus[7]      = GUICtrlCreateLabel("Lab", 	$x + 238, $y + 297, 21, 14, $SS_RIGHT)

		$g_lblGemNowSW[7] 		= GUICtrlCreateLabel("", 		$x + 251, $y + 297, 39, 17, $SS_RIGHT)
		$g_lblBuilderNowSW[7] 	= GUICtrlCreateLabel("", 		$x + 309, $y + 297, 32, 17, $SS_RIGHT)
		$g_lblTimeNowSW[7] 		= GUICtrlCreateLabel("No Data", $x + 362, $y + 297, 58, 17, $SS_CENTER)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

	$g_grpVillageSW[8] 			= GUICtrlCreateGroup("Account 8", $x + 232, $y + 324, 209, 97, BitOR($GUI_SS_DEFAULT_GROUP,$BS_FLAT))
		$g_lblGoldNowSW[8] 		= GUICtrlCreateLabel("", $x + 256, $y + 344, 68, 17, $SS_RIGHT)
		$g_lblElixirNowSW[8] 	= GUICtrlCreateLabel("", $x + 256, $y + 360, 68, 17, $SS_RIGHT)
		$g_lblDarkNowSW[8] 		= GUICtrlCreateLabel("", $x + 256, $y + 378, 68, 17, $SS_RIGHT)

		$g_icnGoldSW[8] 		= GUICtrlCreateIcon($pIconLib, $eIcnGold, 	$x + 328, $y + 340, 18, 18)
		$g_icnElixirSW[8] 		= GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 328, $y + 358, 18, 18)
		$g_icnDarkSW[8] 		= GUICtrlCreateIcon($pIconLib, $eIcnDark, 	$x + 328, $y + 376, 18, 18)

		$g_lblHrStatsGoldSW[8] 	= GUICtrlCreateLabel("", $x + 346, $y + 342, 43, 17, $SS_RIGHT)
		$g_lblHrStatsElixirSW[8]= GUICtrlCreateLabel("", $x + 346, $y + 360, 43, 17, $SS_RIGHT)
		$g_lblHrStatsDarkSW[8] 	= GUICtrlCreateLabel("", $x + 347, $y + 378, 43, 17, $SS_RIGHT)

		$g_lblUnitMeasureSW1[8]	= GUICtrlCreateLabel("K/Hour", $x + 392, $y + 342, 45, 17)
		$g_lblUnitMeasureSW2[8] = GUICtrlCreateLabel("K/Hour", $x + 392, $y + 360, 45, 17)
		$g_lblUnitMeasureSW3[8] = GUICtrlCreateLabel("/Hour",  $x + 399, $y + 378, 37, 17)

		$g_icnGemSW[8] 			= GUICtrlCreateIcon($pIconLib, $eIcnGem, 		$x + 292, $y + 396, 18, 18)
		$g_icnBuliderSW[8] 		= GUICtrlCreateIcon($pIconLib, $eIcnBuilder, 	$x + 342, $y + 396, 18, 18)
		$g_icnHourGlassSW[8] 	= GUICtrlCreateIcon($pIconLib, $eIcnHourGlass, 	$x + 420, $y + 396, 18, 18)

		$g_lblKingStatus[8]     = GUICtrlCreateLabel("K", 		$x + 238,  $y + 342,  12, 14, $SS_CENTER)
		$g_lblQueenStatus[8]    = GUICtrlCreateLabel("Q", 		$x + 238,  $y + 360,  12, 14, $SS_CENTER)
		$g_lblWardenStatus[8]   = GUICtrlCreateLabel("W", 		$x + 238,  $y + 378,  12, 14, $SS_CENTER)
		$g_lblLabStatus[8]      = GUICtrlCreateLabel("Lab", 	$x + 238, $y + 399, 21, 14, $SS_RIGHT)

		$g_lblGemNowSW[8] 		= GUICtrlCreateLabel("", 		$x + 251, $y + 399, 39, 17, $SS_RIGHT)
		$g_lblBuilderNowSW[8] 	= GUICtrlCreateLabel("", 		$x + 309, $y + 399, 32, 17, $SS_RIGHT)
		$g_lblTimeNowSW[8] 		= GUICtrlCreateLabel("No Data", $x + 362, $y + 399, 58, 17, $SS_CENTER)
	GUICtrlCreateGroup("", -99, -99, 1, 1)

; SET FONT
For $i = $g_grpVillageSW[1] To $g_lblTimeNowSW[8]
	GUICtrlSetFont($i, 9, 800, 0, "Arial", $CLEARTYPE_QUALITY)
Next
For $i = 1 To 8
	_GUICtrlSetTip($g_lblKingStatus[$i], "Green - Avaible, Yellow - Healing, Red - Upgrading")
	_GUICtrlSetTip($g_lblQueenStatus[$i], "Green - Avaible, Yellow - Healing, Red - Upgrading")
	_GUICtrlSetTip($g_lblWardenStatus[$i], "Green - Avaible, Yellow - Healing, Red - Upgrading")
	_GUICtrlSetTip($g_lblLabStatus[$i], "Green - Lab is Running, Red - Lab has Stopped")
Next

Func PopOut1()
	GUICtrlSetState($g_lblPopOutSW[1], $GUI_DISABLE)

	Global $hGuiPopOut1 = GUICreate("", 220, 105, -1, -1, BitOR($WS_SYSMENU, $WS_POPUP))
	GUISwitch($hGuiPopOut1)
	Local $x = -10, $y = -15
	$g_grpVillagePO[1] 			= GUICtrlCreateGroup("Account 1", $x + 16, $y + 18, 209, 97, BitOR($GUI_SS_DEFAULT_GROUP,$BS_FLAT))
		$g_lblGoldNowPO[1] 		= GUICtrlCreateLabel("", $x + 40, $y + 36, 68, 17, $SS_RIGHT)
			GUICtrlSetData(-1,GUICtrlRead($g_lblGoldNowSW[1]))
		$g_lblElixirNowPO[1] 	= GUICtrlCreateLabel("", $x + 40, $y + 54, 68, 17, $SS_RIGHT)
			GUICtrlSetData(-1,GUICtrlRead($g_lblElixirNowSW[1]))
		$g_lblDarkNowPO[1] 		= GUICtrlCreateLabel("", $x + 40, $y + 72, 68, 17, $SS_RIGHT)
			GUICtrlSetData(-1,GUICtrlRead($g_lblDarkNowSW[1]))

		$g_icnGoldPO[1] 		= GUICtrlCreateIcon($pIconLib, $eIcnGold, 	$x + 112, $y + 34, 18, 18)
		$g_icnElixirPO[1] 		= GUICtrlCreateIcon($pIconLib, $eIcnElixir, $x + 112, $y + 52, 18, 18)
		$g_icnDarkPO[1] 		= GUICtrlCreateIcon($pIconLib, $eIcnDark, 	$x + 112, $y + 70, 18, 18)
		
		$g_lblHrStatsGoldPO[1] 	= GUICtrlCreateLabel("", $x + 130, $y + 36, 43, 17, $SS_RIGHT)
			GUICtrlSetData(-1,GUICtrlRead($g_lblHrStatsGoldSW[1]))
		$g_lblHrStatsElixirPO[1]= GUICtrlCreateLabel("", $x + 130, $y + 54, 43, 17, $SS_RIGHT)
			GUICtrlSetData(-1,GUICtrlRead($g_lblHrStatsElixirSW[1]))
		$g_lblHrStatsDarkPO[1] 	= GUICtrlCreateLabel("", $x + 130, $y + 72, 43, 17, $SS_RIGHT)
			GUICtrlSetData(-1,GUICtrlRead($g_lblHrStatsDarkSW[1]))
		
		$g_lblUnitMeasurePO1[1] = GUICtrlCreateLabel("K/Hour", 	$x + 176, $y + 36, 45, 17)
		$g_lblUnitMeasurePO2[1] = GUICtrlCreateLabel("K/Hour", 	$x + 176, $y + 54, 45, 17)
		$g_lblUnitMeasurePO3[1] = GUICtrlCreateLabel("/Hour", 	$x + 183, $y + 72, 37, 17)

		$g_icnGemPO[1] 			= GUICtrlCreateIcon($pIconLib, $eIcnGem, 		$x + 76,  $y + 90, 18, 18)
		$g_icnBuliderPO[1] 		= GUICtrlCreateIcon($pIconLib, $eIcnBuilder, 	$x + 126, $y + 90, 18, 18)
		$g_icnHourGlassPO[1] 	= GUICtrlCreateIcon($pIconLib, $eIcnHourGlass, 	$x + 204, $y + 90, 18, 18)
		
		$g_lblKingStatusPO[1]    = GUICtrlCreateLabel("K", 		$x + 22,  $y + 36,  12, 14, $SS_CENTER)
		$g_lblQueenStatusPO[1]   = GUICtrlCreateLabel("Q", 		$x + 22,  $y + 54,  12, 14, $SS_CENTER)
		$g_lblWardenStatusPO[1]  = GUICtrlCreateLabel("W", 		$x + 22,  $y + 72,  12, 14, $SS_CENTER)
		$g_lblLabStatusPO[1]     = GUICtrlCreateLabel("Lab", 	$x + 22,  $y + 93,  21, 14, $SS_CENTER)
		
		$g_lblGemNowPO[1] 		= GUICtrlCreateLabel("", 		$x + 44,  $y + 93, 30, 17, $SS_RIGHT)
			GUICtrlSetData(-1,GUICtrlRead($g_lblGemNowSW[1]))
		$g_lblBuilderNowPO[1] 	= GUICtrlCreateLabel("", 		$x + 93,  $y + 93, 32, 17, $SS_RIGHT)
			GUICtrlSetData(-1,GUICtrlRead($g_lblBuilderNowSW[1]))
		$g_lblTimeNowPO[1] 		= GUICtrlCreateLabel("No Data", $x + 146, $y + 93, 58, 17, $SS_CENTER)
			GUICtrlSetData(-1,GUICtrlRead($g_lblTimeNowSW[1]))

		$g_lblPopOutEX[1] 	= GUICtrlCreateIcon($pIconLib, $eIcnDelete, 	$x + 208, $y + 27, 12, 12)
			GUICtrlSetOnEvent($g_lblPopOutEX[1],"PopOutEX1")
			
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUIRegisterMsg($WM_NCHITTEST, "_MY_NCHITTEST")
GUISetState(@SW_SHOW)
EndFunc

	 ; Original code - Prog@ndy Draggable Code
 Func _MY_NCHITTEST($hWnd, $uMsg, $wParam, $lParam)
     Switch $hWnd
         Case $hGuiPopOut1
             Local $aPos = WinGetPos($hWnd) ; Check if mouse is over top 50 pixels
             If Abs(BitAND(BitShift($lParam, 16), 0xFFFF) - $aPos[1]) < 50 Then Return $HTCAPTION
     EndSwitch
     Return $GUI_RUNDEFMSG
 EndFunc   ;==>_MY_NCHITTEST

 Func PopOutEX1()
	 GUIDelete($hGuiPopOut1)
	 GUICtrlSetState($g_lblPopOutSW[1], $GUI_ENABLE)

 EndFunc

