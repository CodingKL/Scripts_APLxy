if ($ex) {exit;}
<# set the menu colors#>
$cmf="DarkRed"
$cmb="DarkGray"
$Dep="Department="
<#=============================================================#>
<# Menu for setting a few policies for All Users or a group    #>
<#The group is defined in $UDep in 0Start.ps1                  #>
<#=============================================================#>

    $choice = -1
    $global:titre=$tnt + " - " + $TheUser + "                                                                                  ";
    $title=$titre.substring(0,52);
    write-host -backgroundColor darkBlue -foregroundcolor Gray "$title";
    write-host -backgroundColor darkBlue -foregroundcolor Gray "  MENU 85                          Group Management "
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [1] Display Conferencing Policies for All Users        "

	
    write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [2] Grant All Modes to $UDep       "
    write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [3] Grant All Except Video to $UDep"	
	
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [4] Conferencing: Grant All to All Users               "
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [5] Conferencing: Grant All Except Video to All Users  "
	
    

       
    write-host -backgroundColor darkBlue -foregroundcolor Gray "   [B]ack e[X]it                                    "
	      write-host -NoNewLine                                      "   >"

    while ($choice -NotIn "1","2","P","3","4","5","6","7","8","B","X") { 
            $choice=read-host
    }
    logit "Menu 85 Selection = $choice"
    if (($choice -eq "x") -OR ($choice -eq "X")){
        $global:ex = 1;
        exit;
    }
   
    <#switch#>
    switch ($choice)
    {        
        <#--------------------------------------------------------#>
        <# Display the current Conferencing Policies for all users#>
        <#--------------------------------------------------------#>

        "1"{ 
            logit "get-csonlineuser | format-table -property alias, conferencingPolicy -autosize"; 
            get-csonlineuser | format-table -property FirstName, LastName, Department, conferencingPolicy -autosize
            logit "... done"
            .\85Group.ps1;
            
        }
        <#------------------------------------------------------------------------#>
        <# Grant All Conferencing Modes to a Specific Group (Technical Marketing) #>
        <#------------------------------------------------------------------------#>

        "2"{  
            logit "Allowing All Conferencing Modes for Technical Marketing"
            logit "(get-csonlineuser -LDAPFilter $D3ep$UDep).Identity | foreach {Grant-CSConferencingPolicy -Identity `$_ -PolicyName $OnVideo}"; 

            (get-csonlineuser -LDAPFilter $Dep$UDep).Identity | foreach {Grant-CSConferencingPolicy -Identity $_ -PolicyName $OnVideo}

            get-csonlineuser | format-table -property FirstName, LastName, Department, conferencingPolicy -autosize

            .\85Group.ps1
        }
      

        <#---------------------------------------------------#>
        <# Grant all except Video to a specific group        #>
        <#        Technical Marketing                        #>
        <#---------------------------------------------------#>

      "3"{  


            logit "Allowing All Conferencing Modes for Technical Marketing"
            logit "(get-csonlineuser -LDAPFilter $Dep$UDep).Identity | foreach {Grant-CSConferencingPolicy -Identity `$_ -PolicyName $OffVideo}"; 

            (get-csonlineuser -LDAPFilter $Dep$UDep).Identity | foreach {Grant-CSConferencingPolicy -Identity $_ -PolicyName $OffVideo}

            get-csonlineuser | format-table -property FirstName, LastName, Department, conferencingPolicy -autosize

            .\85Group.ps1

        }
        <#---------------------------------------------------#>
        <# Grant BPosSAllModality to All users               #>
        <#---------------------------------------------------#>

        "4"{  
            logit "Allowing All Conferencing Modes for All Users"
            logit "(Get-Csonlineuser).identity | foreach {Grant-CSConferencingPolicy -Identity `$_ -PolicyName $OnVideo}"; 
            
            (Get-Csonlineuser).identity | foreach {Grant-CSConferencingPolicy -Identity $_ -PolicyName $OnVideo}
                                  
            logit "New Setting is ..... $OnVideo"; 
            get-csonlineuser | format-table -property FirstName, LastName, Department, conferencingPolicy -autosize
            
            .\Group.ps1
            
           
        }

        <#---------------------------------------------------#>
        <# Grant BPosSAllModalityNoVideo to All Users        #>
        <#---------------------------------------------------#>


        "5"{  
            logit "Allowing All Conferencing Modes for All Users"
            logit "(Get-Csonlineuser).identity | foreach {Grant-CSConferencingPolicy -Identity `$_ -PolicyName $OffVideo}"; 
            
            (Get-Csonlineuser).identity | foreach {Grant-CSConferencingPolicy -Identity $_ -PolicyName $OffVideo}

                      
            logit "New Setting is ..... $OffVideo"; 
            get-csonlineuser | format-table -property FirstName, LastName, Department, conferencingPolicy -autosize

            .\85Group.ps1
                        
        }
       

        "B" {
            logit "Exit 85 Group Menu";
           exit;
           .\75tenantMenu.ps1
        }

        
	  
        default{            
	    logit "Unexpected Value in Menu 85";
	    exit;
        }

    }<# end of Switch #>


