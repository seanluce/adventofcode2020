$data = get-content "input.txt"
#$data = @('BFFFBBFRRR')
$seatidarray = @()
$max = 0
foreach ($bp in $data) {
    $bparray = $bp.ToCharArray()
    $row = @(1,128)
    $seat = @(1,8)
    foreach ($item in $bparray[0..5]) {
        if ($item -eq 'F') {
            $newhigh = $row[1] - ($row[1] - $row[0] + 1) / 2
            $row = @($row[0],$newhigh)
        }
        if ($item -eq 'B') {
            $newlow = $row[0] + (($row[1] - $row[0] + 1) / 2)
            $row = @($newlow,$row[1])
        }
    }
    if ($bparray[6] -eq 'F') {
        $row = $row[0]
    }
    else {
        $row = $row[1]
    }
    foreach ($item in $bparray[7..8]) {
        if ($item -eq 'L') {
            $newhigh = $seat[1] - ($seat[1] - $seat[0] + 1) / 2
            $seat = @($seat[0],$newhigh)
        }
        if ($item -eq 'R') {
            $newlow = $seat[0] + (($seat[1] - $seat[0] + 1) / 2)
            $seat = @($newlow,$seat[1])
        }
    }
    if ($bparray[9] -eq 'L') {
        $seat = $seat[0]
    }
    else {
        $seat = $seat[1]
    }
$seatid = ($row - 1) * 8 + ($seat -1)
if ($seatid -gt $max) {
    $max = $seatid
}
$seatidarray += $seatid
}
$max
$seatidarray::sort($seatidarray)
$seatidarray

for ($counter=1; $counter -lt $seatidarray.length-1; $counter++) {
    if ($seatidarray[$counter] + 1 -ne $seatidarray[$counter + 1]) {
        $myseat = $seatidarray[$counter] + 1
    }
}
$myseat