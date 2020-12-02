$data = gc "input.txt"
ForEach ($row in $data) { 
    ForEach ($compare in $data) {
        $sum = [int]$row + [int]$compare
        if ($sum -eq 2020) {
            [int]$compare * [int]$row
        } 
    }
}