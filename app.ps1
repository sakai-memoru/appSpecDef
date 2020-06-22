# param (
#     [Parameter(Mandatory=$true)][string]$excelFile = "appOutReport.xlsm",
#     [Parameter(Mandatory=$true)][string]$macro = "FieldDefMain.Batch",
#     [Parameter(Mandatory=$true)][string]$formName = "FIELD_DEF",
#     [Parameter(Mandatory=$true)][boolean]$ddlOn = $false,
#     [Parameter(Mandatory=$true)][boolean]$codeOn = $false,
#     [Parameter(Mandatory=$true)][boolean]$moveOn = $false
# )

$excelFile = "appSpecDef.xlsm"
$macro = "SpecDefMain.Batch"
$formName = "TRANSFORM_DEF_TD"
$ddlOn = $true
$codeOn = $false
$moveOn = $false
##
$curFolder = pwd 
$fullpath = Join-Path $curFolder.Path $excelFile
$excel = new-object -comobject excel.application
$excel.Visible = $false
$workbook = $excel.workbooks.open($fullpath)
$null = $excel.Run($macro, $formName, $ddlOn, $codeOn, $moveOn)
$workbook.close()
$excel.Quit()
echo 'finish ..... !'
$null = [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel)
$null = Remove-Variable excel
