$data = get-content "input.txt"
$totalmeets = 0
foreach ($row in $data) {
    $meetcount = 0
    $splitrow = $row.split(' ')
    $range = $splitrow[0].split('-') # $range[0] = low, $range[1] = high
    $requiredpos1 = [int]$range[0] - 1
    $requiredpos2 = [int]$range[1] - 1
    $requiredletter = $splitrow[1].split(':') # $requiredletter[0]
    $password = $splitrow[2].tochararray()
    if ($password[$requiredpos1] -eq $requiredletter[0]) { 
        $meetcount++
    }
    if ($password[$requiredpos2] -eq $requiredletter[0]) { 
        $meetcount++
    }
    if ($meetcount -eq 1) {
        $meets = "TRUE"
        $totalmeets++
    } else {
        $meets = "FALSE"
    }
    $row + ' ' + $requiredletter[0] + ' ' + $requiredpos1 + '-' + $requiredpos2 + ' ' + $meets
}
$totalmeets
