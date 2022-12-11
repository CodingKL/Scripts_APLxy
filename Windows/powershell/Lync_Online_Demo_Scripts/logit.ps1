param($p1)
<#################################>
<# Timestamp write-host commands #>
<#################################>
if ($displayon -eq 1 )
    {
        write-host -ForegroundColor darkyellow -nonewline " $(get-date -uFormat `"%Y/%m/%d %T`")->";
        write-host -Foregroundcolor darkgray "$p1"
    }
