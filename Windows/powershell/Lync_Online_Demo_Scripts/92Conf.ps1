if ($ex) {exit;}
<# set the menu colors#>
$cmf="DarkRed"
$cmb="DarkGray"
$allMod = $PolList + "AllModality"
$allNoFT = $PolList + "AllModalityNoFT"
$allNoRec = $PolList + "AllModalityNoRec"
$allNoFTV = $PolList + "AllModalityNoFTNoVideo"
$allNoRecV = $PolList + "AllModalityNoRecNoVideo"

$userdata = Get-CSOnlineUser $TheUser;
$PolInstance = $userdata.ConferencingPolicy;
            
<#======================================================#>
<# Set a Conferencing Policy for this user              #>
<#======================================================#>

    $choice = -1
    $global:titre=$tnt + " - " + $TheUser + " - " + $PolInstance +"                                              ";
    $title=$titre.substring(0,52);
    write-host -backgroundColor darkBlue -foregroundcolor Gray "$title";
    write-host -backgroundColor darkBlue -foregroundcolor Gray "  MENU 92          Conferencing Modality Management " 
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [1] All Modalities                                 " # BposSAllModality
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [2] All Except Video                             " # BposSAllModalityNoVideo
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [3] All Except File Transfer                     " # BposSAllModalityNoFT
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [4] All Except Recording                         " # BposSAllModalityNoRec
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [5] All Except Video and File Transfer           " # BposSAllModalityNoFTNoVideo
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [6] All Except Video and Recording               " # BposSAllModalityNoRecNoVideo
	       
    write-host -backgroundColor darkBlue -foregroundcolor Gray "   [B]ack e[X]it                                    "
	      

    while ($choice -NotIn "1","2","3","4","5","6","7","B","X") { 
            write-host -NoNewLine                                      "   >"
            $choice=read-host;
            
    }
    logit "Menu 92 Selection = $choice"
    if (($choice -eq "x") -OR ($choice -eq "X")){
        $global:ex = 1;
        exit;
    }
   
    <#switch#>
    switch ($choice)
    {        

        <#---------------------------------------------------#>
        <# Grant BPosSAllModality                            #>
        <#---------------------------------------------------#>

        "1"{  
            logit "Allowing All Conferencing Modes"
            logit "Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $AllMod"; 
            Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $AllMod
            
            $userdata = Get-CSOnlineUser $TheUser;
            $PolInstance = $userdata.ConferencingPolicy;
            
            logit "New Setting is ..... $PolInstance"; 
            
            .\92Conf.ps1
            }
        
        <#---------------------------------------------------#>
        <# Grant AllModalityNoVideo                          #>
        <#---------------------------------------------------#>

        "2"{  
            logit "Allowing All Conferencing Modes except video"
            logit "Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $OffVideo"; 
            Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $OffVideo
            
            $userdata = Get-CSOnlineUser $TheUser;
            $PolInstance = $userdata.ConferencingPolicy;
            
            logit "New Setting is ..... $PolInstance"; 
            
            .\92Conf.ps1

            }
        <#---------------------------------------------------#>
        <# Grant AllModalityNoFT                             #>
        <#---------------------------------------------------#>

        "3"{  
            logit "Allowing All Conferencing Modes except File Transfer"
            logit "Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $AllNoFT"; 
            Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $AllNoFT
            
            $userdata = Get-CSOnlineUser $TheUser;
            $PolInstance = $userdata.ConferencingPolicy;
            
            logit "New Setting is ..... $PolInstance"; 
            
            .\92Conf.ps1

            }
        <#---------------------------------------------------#>
        <# Grant      AllModalityNoRec                       #>
        <#---------------------------------------------------#>

        "4"{  
            logit "Allowing All Conferencing Modes Except Recording"
            logit "Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $AllNoRec"; 
            Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $AllNoRec
            
            $userdata = Get-CSOnlineUser $TheUser;
            $PolInstance = $userdata.ConferencingPolicy;
            
            logit "New Setting is ..... $PolInstance"; 
            
            .\92Conf.ps1
            }

        <#---------------------------------------------------#>
        <# Grant AllModalityNoFTNoVideo                      #>
        <#---------------------------------------------------#>

        "5"{  
            logit "Allowing All Conferencing Modes Except File Transfer and Video"
            logit "Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $AllNoFTV"; 
            Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $AllNoFTV
            
            $userdata = Get-CSOnlineUser $TheUser;
            $PolInstance = $userdata.ConferencingPolicy;
            
            logit "New Setting is ..... $PolInstance"; 
            
            .\92Conf.ps1

            }
        <#---------------------------------------------------#>
        <# Grant AllModalityNoRecNoVideo                     #>
        <#---------------------------------------------------#>

            "6"{  
            logit "Allowing All Conferencing Modes Except Recording and Video"
            logit "Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $AllNoRecV"; 
            Get-CSOnlineUser -Identity $TheUser | Grant-CSConferencingPolicy -PolicyName $AllNoRecV
            
            $userdata = Get-CSOnlineUser $TheUser;
            $PolInstance = $userdata.ConferencingPolicy;
            
            logit "New Setting is ..... $PolInstance"; 
            
            .\92Conf.ps1

            }


       

        "B" {
            .\82User.ps1
        }

        
	  
        default{            
	    logit "Unexpected Value in Menu 92";
	    exit;
        }

    }<# end of Switch #>


