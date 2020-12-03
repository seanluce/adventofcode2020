$data = get-content "input.txt"
$width = 30
$right = 1
$currentcolumn = 0
$treehits = 0
$rowcount = 0
foreach ($row in $data) {
    $chars = $row.tochararray()
    if ($rowcount % 2 -eq 0) {
        if ($chars[$currentcolumn] -eq '#') {
            $treehits++
            $row + ' ' + $currentcolumn + ' ' + $chars[$currentcolumn] + ' ' + $treehits + ' ' + $rowcount % 2
        }
        $currentcolumn = $currentcolumn + $right
        if ($currentcolumn -gt $width) {
            $currentcolumn = $currentcolumn - $width - 1
        }
        $row + ' ' + $currentcolumn + ' ' + $chars[$currentcolumn] + ' ' + $treehits + ' ' + $rowcount % 2
    }
    $rowcount++
}
$treehits

77 * 218 * 65 * 82 * 43