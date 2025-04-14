# Template Version: 1.0.0.20250413
# This template is simple & omits some pieces that are not needed for POC

#region -- PSModuleTemplateFunction (Function)
Function PSModuleTemplateFunction {
    <#
        .SYNOPSIS
            This is a template function for the PSModuleTemplate module.

        .DESCRIPTION
            This function is a template for creating new functions in the 
            PSModuleTemplate module.

        .PARAMETER Name
            The name of the function.
        
        .EXAMPLE
            PSModuleTemplateFunction -Name MyFunction
    #>

    #region -- CMDletBinding
        [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$Name
        )
    #endregion -- CMDletBinding

    begin {

    }

    process {

    }

    end {

    }
}
#endregion -- PSModuleTemplateFunction (Function)