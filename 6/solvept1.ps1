$data = get-content "input.txt" -raw
$nl = [System.Environment]::NewLine
$splitdata = $data.split("$nl$nl")
foreach ($group in $splitdata) {
    $grouparray = @()
    $groupuniques = @()
    $groupuniquecount = 0
    $people = $group.split("$nl")
    foreach ($person in $people) {
        $grouparray += $person.ToCharArray()
    }
    $groupuniques = $grouparray | Sort-Object | Get-Unique
    $groupuniquecount = $groupuniques.length
    $total += $groupuniquecount
}
$total