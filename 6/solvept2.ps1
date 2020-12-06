$data = get-content "input.txt" -raw
$nl = [System.Environment]::NewLine
$splitdata = $data.split("$nl$nl")
foreach ($group in $splitdata) {
    $uniquearray = @()
    $personarray = @()
    $people = $group.split("$nl")
    $uniquearray = $people[0].ToCharArray()
    $nl
    foreach ($person in $people) {
        $personarray = $person.ToCharArray()
        $uniquearray = $uniquearray | Where-Object{$personarray -contains $_}
    }
    $uniquearray
    $total += $uniquearray.length
}
$total




