; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design - SmartSwitchAccount
; Description ...: This is a part of MBR GUI Design Child Attack - Troops
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Rorotiti
; Modified ......: Ezeck
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

Local $x = 10, $z = 189, $w = 357, $y = 85
	GUICtrlCreateGroup(GetTranslated(108,1, "Smart Switch Accounts"), $x, $y, 430, 295)
		$x += 10
		$y += 20
			$chkEnableSwitchAccount = GUICtrlCreateCheckbox(GetTranslated(108,2, "Use Smart Switch Accounts"), $x, $y, 152, 17)
				GUICtrlSetOnEvent(-1, "chkSwitchAccount")
			$lblNB = GUICtrlCreateLabel(GetTranslated(108,3, "Number of accounts on Emulator :"), $x + 195, $y + 2, 165, 17)
			$cmbAccountsQuantity = GUICtrlCreateCombo("", $x + 365, $y - 2, 45, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
				GUICtrlSetOnEvent(-1, "cmbAccountsQuantity")
				GUICtrlSetData(-1, "2|3|4|5|6|7|8", "2")
		$y += 35
			$chkCanUse[1] = GUICtrlCreateCheckbox(GetTranslated(108,4, "Use Account 1 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[1] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[1] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
		$y += 30
			$chkCanUse[2] = GUICtrlCreateCheckbox(GetTranslated(108,6, "Use Account 2 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[2] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[2] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
		$y += 30
			$chkCanUse[3] = GUICtrlCreateCheckbox(GetTranslated(108,7, "Use Account 3 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[3] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[3] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
		$y += 30
			$chkCanUse[4] = GUICtrlCreateCheckbox(GetTranslated(108,8, "Use Account 4 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[4] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[4] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
		$y += 30
			$chkCanUse[5] = GUICtrlCreateCheckbox(GetTranslated(108,9, "Use Account 5 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[5] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[5] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
		$y += 30
			$chkCanUse[6] = GUICtrlCreateCheckbox(GetTranslated(108,10, "Use Account 6 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[6] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[6] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
		$y += 30
			$chkCanUse[7] = GUICtrlCreateCheckbox(GetTranslated(108,11, "Use Account 7 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[7] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[7] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
		$y += 30
			$chkCanUse[8] = GUICtrlCreateCheckbox(GetTranslated(108,12, "Use Account 8 with Profile :"), $x, $y, 150, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")
			$cmbAccount[8] = GUICtrlCreateCombo("", $z, $y - 2, 145, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
			$chkDonateAccount[8] = GUICtrlCreateCheckbox(GetTranslated(108,5, "Donate only"), $w, $y, 77, 17)
				GUICtrlSetOnEvent(-1, "chkAccountsProperties")

		GUICtrlCreateGroup("", -99, -99, 1, 1)
