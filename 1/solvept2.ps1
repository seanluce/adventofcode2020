$data = gc "input.txt"
ForEach ($c1 in $data) { 
    ForEach ($c2 in $data) {
        if ([int]$c2 -ne [int]$c1) {
            ForEach ($c3 in $data) {
                if ([int]$c1 + [int]$c2 + [int]$c3 -eq 2020) {
                    [int]$c1 * [int]$c2 * [int]$c3
                }
            }
        }
    }
}