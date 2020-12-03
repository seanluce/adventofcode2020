$data = get-content "input.txt"
$width = 30
$right = 7
$currentcolumn = 0
$treehits = 0
$rowcount = 0
foreach ($row in $data) {
    $row
    $chars = $row.tochararray()
    $currentcolumn
    $chars[$currentcolumn]
    $rowcount % 2
    if ($chars[$currentcolumn] -eq '#') {
        $treehits++
    }
    $currentcolumn = $currentcolumn + $right
    if ($currentcolumn -gt $width) {
        $currentcolumn = $currentcolumn - $width - 1
    }
    $rowcount++
    $treehits
}
$treehits
