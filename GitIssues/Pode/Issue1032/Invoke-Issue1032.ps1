#Start Pode Server
Import-Module ActiveDirectory
Import-Module -Name Pode.Kestrel
Start-PodeServer -Threads 2 -ListenerType Kestrel {

    #Attach port 8000 to the local machine address and use HTTP protocol
    Add-PodeEndpoint -Address 192.168.60.30 -Port 8083 -Protocol Http
    Set-PodeViewEngine -Type HTML
    #Create route and return a static value
    Add-PodeRoute -Method Get -Path '/static' -ScriptBlock {
        $data = Get-ADUser -LDAPFilter '(&(samaccountname=administrator)(memberof=CN=Domain Admins,CN=Users,DC=stie2,DC=articatech,DC=local))' -Server stie2.articatech.local
        if($data.Count -eq 0) {
            Write-PodeTextResponse -Value 'false' -Cache -MaxAge 1800
        }
        else {
            Write-PodeTextResponse -Value 'true' -Cache -MaxAge 1800
        }  
       
    }
}