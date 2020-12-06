$data = get-content input.txt -raw
$nl = [System.Environment]::NewLine
$splitdata = $data.split("$nl$nl")
$splitdata
$validrecords = 0
foreach ($record in $splitdata) {
    $record
    if ($record -like '*byr*' -and $record -like '*iyr*' -and $record -like '*eyr*' -and $record -like '*hgt*' -and $record -like '*hcl*' -and $record -like '*ecl*' -and $record -like '*pid*') {
        $validrecords++       
    }
}
$validrecords