#region -- Get-MTAData.ps1 (Function)
Function Get-MTAData.ps1 {
    <#
        .SYNOPSIS
            This function gets data from the Metro North API

        .DESCRIPTION
            

        .PARAMETER MTAURI
            The MTA endpoint URI. The default value is metro north railway.
            Default: https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/mnr%2Fgtfs-mnr
        
        .EXAMPLE
            Get-MTAData.ps1 -foo bar
    #>

    #region -- CMDletBinding
        [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $false)]
            [string]$MTAURI = 'https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/mnr%2Fgtfs-mnr'
        )
    #endregion -- CMDletBinding

    begin {
        # nothing to do here.
    }

    process {
        try {
            $data = Invoke-RestMethod -Uri $MTAURI -ErrorAction Stop
            #$zipPath = "$env:TEMP\gtfs.zip"
            # Invoke-RestMethod -Uri $MTAURI -OutFile 'c:\temp\zippy.zip' -ErrorAction Stop
            #Invoke-RestMethod -Uri $MTAURI -OutFile $zipPath -ErrorAction Stop
        } catch {
            Write-Error -Message "Failed to get data from MTA API: $_"
            return
        }
        <#
        try {
            # Unzip the downloaded file
            $unzipPath = "$env:TEMP\gtfs"
            Expand-Archive -Path $zipPath -DestinationPath $unzipPath -Force
        } catch {
            Write-Error -Message "Failed to unzip data: $_"
            return
        }

        try {
            # read the contents of all files
            $files = Get-ChildItem -Path $unzipPath -Recurse -File
            $Data = foreach ($file in $files) {
                $content = Get-Content -Path $file.FullName -Raw
                [PSCustomObject]@{
                    FileName = $file.Name
                    Content  = $content
                }
            }
        } catch {
            Write-Error -Message "Failed to read data from unzipped files: $_"
            return
        }
            #>
    }   

    end {
        return $Data
    }
}
#endregion -- Get-MTAData.ps1 (Function)