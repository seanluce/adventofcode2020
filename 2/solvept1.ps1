$data = get-content "input.txt"
$totalmeets = 0
foreach ($row in $data) {
    $splitrow = $row.split(' ')
    $range = $splitrow[0].split('-') # $range[0] = low, $range[1] = high
    $requiredletter = $splitrow[1].split(':') # $requiredletter[0]
    $password = $splitrow[2].tochararray()
    $lettercount = 0
    foreach ($letter in $password) {
        if ($letter -eq $requiredletter[0])
        {
            $lettercount++
        }
    }
    if ($lettercount -ge $range[0] -and $lettercount -le $range[1]) {
        $meets = 'TRUE'
        $totalmeets++
    } else {
        $meets = 'FALSE'
    }
    $row + ' ' + $requiredletter[0] + ' ' + $lettercount + ' ' + $meets
}
$totalmeets