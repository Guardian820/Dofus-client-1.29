#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Users\Florent\Downloads\aide-index-aide-en-ligne-point-interrogation-icone-6583-128.ico
#AutoIt3Wrapper_Outfile=C:\Users\Florent\Desktop\Search In All Source For Amputed.exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>
#include <Array.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <WindowsConstants.au3>
#include <ListViewConstants.au3>
; [0] = Nbr de File - [1] = Le 1er Fichier - [Ubound-1] = Le dernier
#Region ### START Koda GUI section ### Form=
Global $GUI = GUICreate("Search In All File", 507, 438, -1, -1)
GUISetBkColor(0xC8C8C8)
Global $MotClef = GUICtrlCreateInput("keyWord", 8, 8, 489, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
Global $search = GUICtrlCreateButton("Recherche", 8, 54, 491, 25)
Global $openFile = GUICtrlCreateButton("Ouvrir", 8, 400, 491, 33)
Global $Radio1 = GUICtrlCreateRadio("Not case sensitive ( Default )", 8, 32, 153, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $Radio2 = GUICtrlCreateRadio("Case sensitive", 168, 32, 89, 17)
Global $Radio3 = GUICtrlCreateRadio("Not case sensitive, basic/faster comaprison", 264, 32, 233, 17)
Global $listKeyWord = GUICtrlCreateListView("Fichier|Mot Clef|Ligne", 8, 88, 490, 302)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 260)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 100)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 100)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit

			Case $search
				$CaseSense = 0
				If isChecked($Radio1) Then $CaseSense = 0
				If isChecked($Radio2) Then $CaseSense = 1
				If isChecked($Radio3) Then $CaseSense = 2
				$KeyWord = GuiCtrlRead($MotClef)
				SplashTextOn("","Recherche en cours.. Veuillez patienter..", 450, 70, -1, -1, 0 + 1 + 16 + 32, "Times New Roman", 12, 800)
				If $KeyWord = "" Then
					MsgBox(0+16, "Erreur", "Aucun mot clé n'est indiqué")
				Else
					; ## FILE IN SCRIPTDIR ##
					$FileList1 = _FileListToArray(@ScriptDir, "*.as")
					If Not @Error Then
						For $i = 1 To $FileList1[0] Step 1
							For $a = 1 To _FileCountLines($FileList1[$i]) Step 1
								$StringLine = FileReadLine($FileList1[$i], $a)
								$str = StringInStr($StringLine, $KeyWord, $CaseSense)
								If Not $str = 0 Then
									GUICtrlCreateListViewItem($FileList1[$i]&"|"&$KeyWord&"|"&$a, $listKeyWord)
								EndIf
							Next
						Next
					EndIf
					;## FIN FILE IN SCRIPTDIR ##

					;## FOLDER ON FOLDER ##
					$FolderList1 = _FileListToArray(@ScriptDir, "*",2)
					If Not @Error Then
						For $i = 1 To $FolderList1[0] Step 1

							$FileList2 = _FileListToArray(@ScriptDir&"\"&$FolderList1[$i], "*.as")
							If Not @Error Then
								For $a = 1 To $FileList2[0] Step 1
									For $b = 1 To _FileCountLines(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FileList2[$a]) Step 1
										$StringLine = FileReadLine(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FileList2[$a], $b)
										$str = StringInStr($StringLine, $KeyWord, $CaseSense)
										If Not $str = 0 Then
											GUICtrlCreateListViewItem($FolderList1[$i]&"\"&$FileList2[$a]&"|"&$KeyWord&"|"&$b, $listKeyWord)
										EndIf
									Next
								Next
							EndIf

							$FolderList2 = _FileListToArray(@ScriptDir&"\"&$FolderList1[$i], "*",2)
							If Not @Error Then
								For $c = 1 To $FolderList2[0] Step 1
									$FileList3 = _FileListToArray(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c], "*.as")
									If Not @Error Then
										For $d = 1 To $FileList3[0] Step 1
											For $e = 1 To _FileCountLines(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FileList3[$d]) Step 1
												$StringLine = FileReadLine(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FileList3[$d], $e)
												$str = StringInStr($StringLine, $KeyWord, $CaseSense)
												If Not $str = 0 Then
													GUICtrlCreateListViewItem($FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FileList3[$d]&"|"&$KeyWord&"|"&$e, $listKeyWord)
												EndIf
											Next
										Next
									EndIf

									$FolderList3 = _FileListToArray(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c], "*",2)
									If Not @Error Then
										For $f = 1 To $FolderList3[0] Step 1
											$FileList4 = _FileListToArray(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f], "*.as")
											If Not @Error Then
												For $g = 1 To $FileList4[0] Step 1
													For $h = 1 To _FileCountLines(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FileList4[$g]) Step 1
														$StringLine = FileReadLine(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FileList4[$g], $h)
														$str = StringInStr($StringLine, $KeyWord, $CaseSense)
														If Not $str = 0 Then
															GUICtrlCreateListViewItem($FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FileList4[$g]&"|"&$KeyWord&"|"&$h, $listKeyWord)
														EndIf
													Next
												Next
											EndIf

											$FolderList4 = _FileListToArray(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f], "*",2)
											If Not @Error Then
												For $k = 1 To $FolderList4[0] Step 1
													$FileList5 = _FileListToArray(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k], "*.as")
													If Not @Error Then
														For $l = 1 To $FileList5[0] Step 1
															For $j = 1 To _FileCountLines(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FileList5[$l]) Step 1
																$StringLine = FileReadLine(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FileList5[$l], $j)
																$str = StringInStr($StringLine, $KeyWord, $CaseSense)
																If Not $str = 0 Then
																	GUICtrlCreateListViewItem($FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FileList5[$l]&"|"&$KeyWord&"|"&$j, $listKeyWord)
																EndIf
															Next
														Next
													EndIf

													$FolderList5 = _FileListToArray(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k], "*",2)
													If Not @Error Then
														For $m = 1 To $FolderList5[0] Step 1
															$FileList6 = _FileListToArray(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FolderList5[$m], "*.as")
															If Not @Error Then
																For $n = 1 To $FileList6[0] Step 1
																	For $o = 1 To _FileCountLines(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FolderList5[$m]&"\"&$FileList6[$n]) Step 1
																		$StringLine = FileReadLine(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FolderList5[$m]&"\"&$FileList6[$n], $o)
																		$str = StringInStr($StringLine, $KeyWord, $CaseSense)
																		If Not $str = 0 Then
																			GUICtrlCreateListViewItem($FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FolderList5[$m]&"\"&$FileList6[$n]&"|"&$KeyWord&"|"&$o, $listKeyWord)
																		EndIf
																	Next
																Next
															EndIf

															$FolderList6 = _FileListToArray(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FolderList5[$m], "*",2)
															If Not @Error Then
																For $p = 1 To $FolderList6[0] Step 1
																	$FileList7 = _FileListToArray(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FolderList5[$m]&"\"&$FolderList6[$p], "*.as")
																	If Not @Error Then
																		For $q = 1 To $FileList6[0] Step 1
																			For $r = 1 To _FileCountLines(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FolderList5[$m]&"\"&$FolderList6[$p]&"\"&$FileList7[$q]) Step 1
																				$StringLine = FileReadLine(@ScriptDir&"\"&$FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FolderList5[$m]&"\"&$FolderList6[$p]&"\"&$FileList7[$q], $r)
																				$str = StringInStr($StringLine, $KeyWord, $CaseSense)
																				If Not $str = 0 Then
																					GUICtrlCreateListViewItem($FolderList1[$i]&"\"&$FolderList2[$c]&"\"&$FolderList3[$f]&"\"&$FolderList4[$k]&"\"&$FolderList5[$m]&"\"&$FolderList6[$p]&"\"&$FileList7[$q]&"|"&$KeyWord&"|"&$r, $listKeyWord)
																				EndIf
																			Next
																		Next
																	EndIf
																Next
															EndIf
														Next
													EndIf
												Next
											EndIf
										Next
									EndIf
								Next
							EndIf
						Next
					EndIf
					;## FIN FOLDER ON FOLDER ##
				EndIf
				SplashOff()
			MsgBox(0+16, "Succès", "La recherche c'est effectué avec succès !")

			Case $openFile
				$Info = GUICtrlRead(GUICtrlRead($listKeyWord), 2)
				If $Info = "" Then
					MsgBox(0+16, "Erreur", "Aucun fichier sélection !")
				Else
					$browserFile = StringSplit($Info,"|")
					ShellExecute(@ScriptDir&"\"&$browserFile[1])
				EndIf
 EndSwitch
WEnd

Func isChecked($checkbox)
    Return BitAND(GUICtrlRead($checkbox),$GUI_CHECKED) = $GUI_CHECKED
EndFunc

Func Pop($Msg)
	MsgBox(0,"PopUp", $Msg)
EndFunc